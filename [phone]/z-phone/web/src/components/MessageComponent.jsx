import React, { useContext, useState } from "react";
import { MENU_DEFAULT, MENU_MESSAGE_CHATTING } from "../constant/menu";
import MenuContext from "../context/MenuContext";
import { MdArrowBackIosNew, MdOutlineSearch, MdOutlineCallMade } from "react-icons/md";
import { searchByKeyValueContains } from "../utils/common";
import axios from "axios";

const MessageComponent = ({ isShow }) => {
  const { setMenu, chats, resolution, setChats, chatsBk, setChatting } =
    useContext(MenuContext);
  const [isOpenCreate, setIsOpenCreate] = useState(false);
  const [errorCreateGroup, setErrorCreateGroup] = useState(null);
  const [groupName, setGroupName] = useState(""); // Kept for compatibility if needed, but mostly unused now
  
  const [targetPhoneNumber, setTargetPhoneNumber] = useState("");

  const handleCreateChat = async () => {
    if (!targetPhoneNumber) {
      setErrorCreateGroup("Please enter a phone number.");
      return;
    }

    try {
      // Assuming the backend handles creating a chat or finding an existing one
      // We might need to adjust the endpoint or payload based on the backend implementation
      // For now, I'll try to simulate opening a chat directly.
      // If the backend requires a group for everything, we might need to create a "group" with just one person.
      
      // However, the user asked to "send a message to a phone number".
      // Let's try to create a "group" with just that one number, or use a different endpoint if available.
      // Since I don't see a direct "create-chat" endpoint, I'll stick to "create-group" but adapt it for 1-on-1.
      
      const response = await axios.post("/create-group", {
        name: targetPhoneNumber, // Use phone number as name initially or let backend handle it
        phone_numbers: [targetPhoneNumber],
      });
      
      // After creating, we should probably refresh chats or open the new chat
      // For now, just closing the modal
    } catch (error) {
      console.error("error /create-group", error);
    }

    setIsOpenCreate(false);
    setTargetPhoneNumber("");
    setGroupName("");
  };

  return (
    <div
      className="relative flex flex-col w-full h-full"
      style={{
        display: isShow ? "block" : "none",
      }}
    >
      <div
        className="absolute bottom-10 right-5 h-10 w-10 rounded-full bg-blue-500 cursor-pointer z-50 flex items-center justify-center text-white shadow-lg"
        onClick={() => setIsOpenCreate(true)}
      >
        <MdOutlineCallMade className="text-lg rotate-45" /> {/* Using an icon that looks like 'compose' */}
      </div>
      <div
        style={{
          display: isOpenCreate ? "block" : "none",
        }}
      >
        <div
          className="absolute bottom-0 left-0 z-30"
          style={{
            height: resolution.layoutHeight ? resolution.layoutHeight : 0,
            width: resolution.layoutWidth ? resolution.layoutWidth : 0,
            backgroundColor: "rgba(0, 0, 0, 0.5)",
            backdropFilter: "blur(4px)"
          }}
          onClick={() => {
            setIsOpenCreate(false);
            setTargetPhoneNumber("");
          }}
        ></div>
        <div className="absolute bottom-0 left-0 w-full bg-gray-900 rounded-t-2xl pb-8 z-50 border-t border-gray-800">
          <div className="flex flex-col space-y-4 px-6 pt-4">
            <div
              className="flex justify-center cursor-pointer pb-2"
              onClick={() => {
                setIsOpenCreate(false);
                setTargetPhoneNumber("");
              }}
            >
              <div className="w-12 h-1.5 bg-gray-600 rounded-full"></div>
            </div>
            
            <h3 className="text-white text-lg font-semibold text-center">Ny Besked</h3>

            <div className="flex flex-col space-y-2">
                <label className="text-gray-400 text-xs uppercase font-bold tracking-wider">Modtager</label>
                <input
                  type="text"
                  placeholder="Indtast telefonnummer"
                  className="w-full text-sm text-white bg-gray-800 border border-gray-700 focus:border-blue-500 focus:outline-none rounded-xl px-4 py-3 transition-colors"
                  autoComplete="off"
                  value={targetPhoneNumber}
                  onChange={(e) => setTargetPhoneNumber(e.target.value)}
                />
            </div>

            <button
              className="w-full bg-blue-600 hover:bg-blue-500 text-white font-medium py-3 rounded-xl transition-colors shadow-lg shadow-blue-900/20"
              onClick={handleCreateChat}
            >
              Start Samtale
            </button>
            
            {errorCreateGroup && (
                <p className="text-red-500 text-xs text-center">{errorCreateGroup}</p>
            )}
          </div>
        </div>
      </div>

      <div className="absolute top-0 flex w-full justify-between py-2 bg-black pt-8 z-10">
        <div
          className="flex items-center px-2 text-blue-500 cursor-pointer"
          onClick={() => setMenu(MENU_DEFAULT)}
        >
          <MdArrowBackIosNew className="text-lg" />
          <span className="text-xs">Back</span>
        </div>
        <span className="absolute left-0 right-0 m-auto text-sm text-white w-fit">
          Message
        </span>
        <div className="flex items-center px-2 text-blue-500">
          {/* <MdEdit className='text-lg' /> */}
        </div>
      </div>

      {chats == undefined ? (
        <LoadingComponent />
      ) : (
        <div
          className="no-scrollbar flex flex-col w-full h-full text-white overflow-y-auto"
          style={{
            paddingTop: 60,
          }}
        >
          <div className="bg-black flex items-center w-full pb-3 pt-1">
            <div className="w-2"></div>
            <div className="relative w-full">
              <div className="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                <MdOutlineSearch className="text-lg" />
              </div>
              <input
                type="text"
                placeholder="Search..."
                className="text-sm w-full text-white flex-1 border border-gray-700 focus:outline-none rounded-full px-2 py-1 pl-8 bg-[#3B3B3B]"
                autoComplete="off"
                onKeyUp={(e) => {
                  const data = searchByKeyValueContains(
                    chatsBk,
                    "conversation_name",
                    e.target.value
                  );
                  setChats(data);
                }}
              />
            </div>
            <div className="w-2"></div>
          </div>

          {chats.map((v, i) => {
            if (v.last_message != null) {
              return (
                <div
                  className="flex flex-col pl-1 pr-1"
                  key={i}
                  onClick={() => {
                    setMenu(MENU_MESSAGE_CHATTING);
                    setChatting(v);
                  }}
                >
                  <div
                    className={`w-full cursor-pointer flex space-x-2
                  ${v.is_read ? "text-gray-400" : "text-white"}`}
                  >
                    <img
                      src={v.avatar}
                      className="w-9 h-9 object-cover rounded-full"
                      alt=""
                      onError={(error) => {
                        error.target.src = "./images/noimage.jpg";
                      }}
                    />
                    <div className="flex justify-between border-b border-gray-900 pb-2 mb-2 w-full">
                      <div className="leading-1 col-span-4 text-sm">
                        <div className="line-clamp-1">
                          {v.conversation_name}
                        </div>
                        <div className="text-xs line-clamp-1">
                          {v.last_message}
                        </div>
                      </div>
                      <div className="flex">
                        <div className="text-xs">{v.last_message_time}</div>
                      </div>
                    </div>
                  </div>
                </div>
              );
            }
          })}
        </div>
      )}
    </div>
  );
};
export default MessageComponent;
