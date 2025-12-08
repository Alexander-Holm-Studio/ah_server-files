import React, { useContext } from "react";
import { MENU_MESSAGE, MENU_SERVICE } from "../constant/menu";
import MenuContext from "../context/MenuContext";
import { IoSunny } from "react-icons/io5";

const HomeComponent = ({ isShow }) => {
  const { resolution, menus, profile, setMenu } = useContext(MenuContext);

  // Date logic for Calendar Widget
  const date = new Date();
  const dayName = date.toLocaleDateString('da-DK', { weekday: 'short' }).toUpperCase();
  const dayNumber = date.getDate();

  if (!profile || !menus) {
    return null;
  }

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
      {/* Status Bar Placeholder */}
      <div className="h-8 w-full shrink-0"></div>

      {/* Widgets Area */}
      <div className="px-6 pt-2 pb-6 flex space-x-4 justify-between shrink-0">
        {/* Weather Widget */}
        <div className="w-1/2 aspect-square rounded-3xl bg-gradient-to-br from-blue-400 to-blue-600 p-4 text-white flex flex-col justify-between shadow-lg backdrop-blur-sm bg-opacity-90 cursor-pointer hover:scale-[1.02] transition-transform">
           <div className="flex justify-between items-start">
              <div className="flex flex-col">
                 <span className="text-xs font-medium opacity-90">Los Santos</span>
                 <span className="text-3xl font-light mt-1">24°</span>
              </div>
              <IoSunny className="text-yellow-300 text-2xl" />
           </div>
           <span className="text-xs font-medium opacity-90">Mest solrigt</span>
        </div>

        {/* Calendar Widget */}
        <div className="w-1/2 aspect-square rounded-3xl bg-white/90 p-4 text-black flex flex-col items-center justify-center shadow-lg backdrop-blur-sm cursor-pointer hover:scale-[1.02] transition-transform">
           <span className="text-red-500 text-sm font-bold uppercase tracking-wide">{dayName}</span>
           <span className="text-5xl font-light -mt-1">{dayNumber}</span>
        </div>
      </div>

      {/* App Grid */}
      <div className="flex-1 px-4 overflow-y-auto no-scrollbar mt-2">
        <div className="grid grid-cols-4 gap-x-2 gap-y-4 justify-items-center">
          {menus?.MENUS?.map((v, i) => (
            <div
              onClick={() => setMenu(v.label)}
              key={i}
              className="flex flex-col items-center gap-1 cursor-pointer w-full group"
            >
              <div className="relative transition-transform group-active:scale-95">
                 <img 
                    className="w-[3.2rem] h-[3.2rem] rounded-[14px] shadow-sm object-cover" 
                    src={v.icon} 
                    alt={v.label} 
                 />
                 {v.label === MENU_SERVICE && profile?.unread_message_service > 0 && (
                    <span className="absolute -top-1.5 -right-1.5 bg-red-500 text-white text-[10px] font-bold px-1.5 py-0.5 rounded-full min-w-[20px] text-center border-2 border-white shadow-sm">
                      {profile.unread_message_service}
                    </span>
                 )}
              </div>
              <span className="text-[10px] text-white font-normal drop-shadow-md text-center leading-tight w-full tracking-wide px-0.5 break-words">
                {v.label}
              </span>
            </div>
          ))}
        </div>
      </div>

      {/* Dock */}
      <div className="px-4 pb-8 pt-2 shrink-0">
        <div className="w-full bg-white/20 backdrop-blur-2xl rounded-[2.2rem] p-3 flex justify-around items-center shadow-lg border border-white/10">
           {menus?.BOTTOM_MENUS?.map((v, i) => (
             <div
               onClick={() => setMenu(v.label)}
               key={i}
               className="relative flex flex-col items-center cursor-pointer transition-transform active:scale-95"
             >
               <img className="w-[3.2rem] h-[3.2rem] rounded-[14px] shadow-sm object-cover" src={v.icon} alt={v.label} />
                {v.label === MENU_MESSAGE && profile?.unread_message > 0 && (
                    <span className="absolute -top-1.5 -right-1.5 bg-red-500 text-white text-[10px] font-bold px-1.5 py-0.5 rounded-full min-w-[20px] text-center border-2 border-white shadow-sm">
                      {profile.unread_message}
                    </span>
                 )}
             </div>
           ))}
        </div>
      </div>
    </div>
  );
};
export default HomeComponent;
