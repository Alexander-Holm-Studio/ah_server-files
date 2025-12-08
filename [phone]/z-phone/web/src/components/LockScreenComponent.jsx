import React, { useContext, useEffect, useState } from "react";
import { MENU_DEFAULT } from "../constant/menu";
import MenuContext from "../context/MenuContext";
import { IoFlashlight, IoCamera } from "react-icons/io5";

const LockScreenComponent = ({ isShow }) => {
  const { time, profile, setMenu } = useContext(MenuContext);
  const [isOpen, setIsOpen] = useState(false);

  // Date logic
  const date = new Date();
  const dayName = date.toLocaleDateString('da-DK', { weekday: 'long' });
  const monthName = date.toLocaleDateString('da-DK', { month: 'long' });
  const dayNumber = date.getDate();
  const formattedDate = `${dayName}, ${dayNumber}. ${monthName}`;

  if (!profile) {
    return null;
  }

  useEffect(() => {
    setIsOpen(false);
  }, [isShow]);

  useEffect(() => {
    if (isOpen) {
      setTimeout(() => {
        setMenu(MENU_DEFAULT);
      }, 500); // Faster transition
    }
  }, [isOpen]);

  return (
    <div
      className="relative flex flex-col w-full h-full overflow-hidden"
      style={{
        backgroundImage: `url(${profile.wallpaper})`,
        backgroundSize: "cover",
        backgroundPosition: "center",
        display: isShow ? "flex" : "none",
      }}
    >
      <div 
        className={`flex-1 flex flex-col justify-between pb-8 pt-12 transition-transform duration-500 ease-in-out ${isOpen ? "-translate-y-full opacity-0" : "translate-y-0 opacity-100"}`}
      >
        {/* Top Section: Date & Time */}
        <div className="flex flex-col items-center text-white drop-shadow-md">
          {/* Lock Icon (Optional, can be added if needed) */}
          {/* <IoLockClosed className="text-xl mb-2 opacity-80" /> */}
          
          <p className="text-lg font-medium opacity-90 capitalize tracking-wide">
            {formattedDate}
          </p>
          <h1 className="text-[5.5rem] font-bold leading-none tracking-tight -mt-2 font-sans">
            {time}
          </h1>
        </div>

        {/* Bottom Section: Shortcuts & Home Indicator */}
        <div className="flex flex-col items-center w-full px-8 space-y-6">
          
          {/* Shortcuts */}
          <div className="flex justify-between w-full">
            {/* Flashlight */}
            <div className="w-12 h-12 rounded-full bg-black/40 backdrop-blur-md flex items-center justify-center cursor-pointer active:bg-white/20 transition-colors shadow-lg">
              <IoFlashlight className="text-white text-xl" />
            </div>

            {/* Camera */}
            <div className="w-12 h-12 rounded-full bg-black/40 backdrop-blur-md flex items-center justify-center cursor-pointer active:bg-white/20 transition-colors shadow-lg">
              <IoCamera className="text-white text-xl" />
            </div>
          </div>

          {/* Home Indicator / Swipe Text */}
          <div 
            className="flex flex-col items-center cursor-pointer"
            onClick={() => setIsOpen(true)}
          >
            <p className="text-white/70 text-xs font-medium mb-2 animate-pulse">
              Swipe op for at åbne
            </p>
            <div className="w-32 h-1.5 bg-white rounded-full shadow-sm"></div>
          </div>
        </div>
      </div>
    </div>
  );
};
export default LockScreenComponent;
