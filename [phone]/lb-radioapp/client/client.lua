local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
while true do
  L0_1 = GetResourceState
  L1_1 = "lb-phone"
  L0_1 = L0_1(L1_1)
  if "started" == L0_1 then
    break
  end
  L0_1 = Wait
  L1_1 = 500
  L0_1(L1_1)
end
L0_1 = GetResourceMetadata
L1_1 = GetCurrentResourceName
L1_1 = L1_1()
L2_1 = "ui_page"
L3_1 = 0
L0_1 = L0_1(L1_1, L2_1, L3_1)
L1_1 = json
L1_1 = L1_1.decode
L2_1 = GetResourceKvpString
L3_1 = "radio_history"
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = "[]"
end
L1_1 = L1_1(L2_1)
L2_1 = GetResourceKvpString
L3_1 = "radio_lastChannel"
L2_1 = L2_1(L3_1)
L3_1 = Config
L3_1 = L3_1.LockedChannels
L4_1 = false
L5_1 = false
L6_1 = nil
function L7_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L4_1
  if L0_2 then
    L0_2 = L5_1
    if L0_2 then
      goto lbl_15
    end
  end
  L0_2 = L6_1
  if L0_2 then
    L0_2 = ClearInterval
    L1_2 = L6_1
    L0_2 = L0_2(L1_2)
    L6_1 = L0_2
    return
  end
  ::lbl_15::
  L0_2 = IsConnected
  L0_2 = L0_2()
  if L0_2 then
    L0_2 = L2_1
    if L0_2 then
      L0_2 = GetMembers
      L1_2 = tonumber
      L2_2 = L2_1
      L1_2, L2_2, L3_2 = L1_2(L2_2)
      L0_2 = L0_2(L1_2, L2_2, L3_2)
      L1_2 = SendAppMessage
      L2_2 = "setConnectedUsers"
      L3_2 = L0_2
      L1_2(L2_2, L3_2)
    end
  end
end
L8_1 = RegisterNetEvent
L9_1 = "lb-phone:phoneToggled"
function L10_1(A0_2)
  local L1_2, L2_2, L3_2
  L5_1 = A0_2
  L1_2 = L5_1
  if L1_2 then
    L1_2 = L4_1
    if L1_2 then
      L1_2 = SetInterval
      L2_2 = L7_1
      L3_2 = 5000
      L1_2 = L1_2(L2_2, L3_2)
      L6_1 = L1_2
    end
  end
end
L8_1(L9_1, L10_1)
function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = Wait
  L1_2 = 500
  L0_2(L1_2)
  L0_2 = exports
  L0_2 = L0_2["lb-phone"]
  L1_2 = L0_2
  L0_2 = L0_2.AddCustomApp
  L2_2 = {}
  L2_2.identifier = "radio-app"
  L3_2 = L
  L4_2 = "title"
  L3_2 = L3_2(L4_2)
  L2_2.name = L3_2
  L3_2 = L
  L4_2 = "description"
  L3_2 = L3_2(L4_2)
  L2_2.description = L3_2
  L2_2.developer = "LB"
  L3_2 = Config
  L3_2 = L3_2.AutoInstall
  L3_2 = true == L3_2
  L2_2.defaultApp = L3_2
  L2_2.size = 79400
  L3_2 = L0_1
  L4_2 = L3_2
  L3_2 = L3_2.find
  L5_2 = "http"
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = L0_1
    if L3_2 then
      goto lbl_40
    end
  end
  L3_2 = GetCurrentResourceName
  L3_2 = L3_2()
  L4_2 = "/ui/dist/index.html"
  L3_2 = L3_2 .. L4_2
  ::lbl_40::
  L2_2.ui = L3_2
  L3_2 = L0_1
  L4_2 = L3_2
  L3_2 = L3_2.find
  L5_2 = "http"
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = L0_1
    L4_2 = "/public/icon.svg"
    L3_2 = L3_2 .. L4_2
    if L3_2 then
      goto lbl_57
    end
  end
  L3_2 = "https://cfx-nui-"
  L4_2 = GetCurrentResourceName
  L4_2 = L4_2()
  L5_2 = "/ui/dist/icon.svg"
  L3_2 = L3_2 .. L4_2 .. L5_2
  ::lbl_57::
  L2_2.icon = L3_2
  L3_2 = {}
  L4_2 = "https://cfx-nui-"
  L5_2 = GetCurrentResourceName
  L5_2 = L5_2()
  L6_2 = "/ui/dist/screenshot-light.png"
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = "https://cfx-nui-"
  L6_2 = GetCurrentResourceName
  L6_2 = L6_2()
  L7_2 = "/ui/dist/screenshot-dark.png"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L2_2.images = L3_2
  L2_2.fixBlur = true
  function L3_2()
    local L0_3, L1_3, L2_3
    L0_3 = true
    L4_1 = L0_3
    L0_3 = true
    L5_1 = L0_3
    L0_3 = L6_1
    if not L0_3 then
      L0_3 = SetInterval
      L1_3 = L7_1
      L2_3 = 5000
      L0_3 = L0_3(L1_3, L2_3)
      L6_1 = L0_3
    end
  end
  L2_2.onOpen = L3_2
  function L3_2()
    local L0_3, L1_3
    L0_3 = false
    L4_1 = L0_3
  end
  L2_2.onClose = L3_2
  L0_2, L1_2 = L0_2(L1_2, L2_2)
  if not L0_2 then
    L2_2 = print
    L3_2 = "Failed to add radio app to phone: "
    L4_2 = L1_2
    L3_2 = L3_2 .. L4_2
    L2_2(L3_2)
  end
end
L9_1 = L8_1
L9_1()
L9_1 = AddEventHandler
L10_1 = "onResourceStart"
function L11_1(A0_2)
  local L1_2
  if "lb-phone" == A0_2 then
    L1_2 = L8_1
    L1_2()
  end
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "lb-phone:settingsUpdated"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2
  if L1_2 then
    L1_2 = L1_2.sound
  end
  if L1_2 then
    L1_2 = L1_2.volume
  end
  if L1_2 then
    L2_2 = SetVolume
    L3_2 = math
    L3_2 = L3_2.floor
    L4_2 = L1_2 * 100
    L4_2 = L4_2 + 0.5
    L3_2, L4_2 = L3_2(L4_2)
    L2_2(L3_2, L4_2)
  end
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNUICallback
L10_1 = "Radio"
function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = A0_2.action
  if "getHistory" == L2_2 then
    L3_2 = A1_2
    L4_2 = L1_1
    L3_2(L4_2)
  elseif "getLastChannel" == L2_2 then
    L3_2 = A1_2
    L4_2 = L2_1
    L3_2(L4_2)
  elseif "isConnected" == L2_2 then
    L3_2 = IsConnected
    L3_2 = L3_2()
    if L3_2 then
      L4_2 = A1_2
      L5_2 = {}
      L5_2.connected = true
      L6_2 = GetMembers
      L7_2 = tonumber
      L8_2 = L2_1
      L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L7_2(L8_2)
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      L5_2.connectedUsers = L6_2
      return L4_2(L5_2)
    end
    L4_2 = A1_2
    L5_2 = {}
    L5_2.connected = false
    L5_2.connectedUsers = 0
    L4_2(L5_2)
  elseif "removeHistory" == L2_2 then
    L3_2 = A0_2.frequency
    L4_2 = A0_2.decimalFreq
    L5_2 = 1
    L6_2 = L1_1
    L6_2 = #L6_2
    L7_2 = 1
    for L8_2 = L5_2, L6_2, L7_2 do
      L9_2 = L1_1
      L9_2 = L9_2[L8_2]
      L9_2 = L9_2[1]
      if L9_2 == L3_2 then
        L9_2 = L1_1
        L9_2 = L9_2[L8_2]
        L9_2 = L9_2[2]
        if L9_2 == L4_2 then
          L9_2 = table
          L9_2 = L9_2.remove
          L10_2 = L1_1
          L11_2 = L8_2
          L9_2(L10_2, L11_2)
          break
        end
      end
    end
    L5_2 = SetResourceKvp
    L6_2 = "radio_history"
    L7_2 = json
    L7_2 = L7_2.encode
    L8_2 = L1_1
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L7_2(L8_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L5_2 = A1_2
    L6_2 = L1_1
    L5_2(L6_2)
  elseif "clearHistory" == L2_2 then
    L3_2 = {}
    L1_1 = L3_2
    L3_2 = SetResourceKvp
    L4_2 = "radio_history"
    L5_2 = json
    L5_2 = L5_2.encode
    L6_2 = L1_1
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L5_2(L6_2)
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L3_2 = A1_2
    L4_2 = true
    L3_2(L4_2)
  elseif "connectChannel" == L2_2 then
    L3_2 = A0_2.frequency
    L4_2 = A0_2.decimalFreq
    L5_2 = GetJob
    L5_2 = L5_2()
    L6_2 = tonumber
    L7_2 = L3_2
    L8_2 = "."
    L9_2 = L4_2
    L7_2 = L7_2 .. L8_2 .. L9_2
    L6_2 = L6_2(L7_2)
    L7_2 = 1
    L8_2 = L3_1
    L8_2 = #L8_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L3_1
      L11_2 = L11_2[L10_2]
      L12_2 = L11_2.range
      L12_2 = L12_2[1]
      if L6_2 >= L12_2 then
        L12_2 = L11_2.range
        L12_2 = L12_2[2]
        if L6_2 <= L12_2 then
          L12_2 = L11_2.jobs
          L12_2 = L12_2[L5_2]
          if not L12_2 then
            L12_2 = exports
            L12_2 = L12_2["lb-phone"]
            L13_2 = L12_2
            L12_2 = L12_2.SendNotification
            L14_2 = {}
            L14_2.app = "radio-app"
            L15_2 = L
            L16_2 = "no_access"
            L15_2 = L15_2(L16_2)
            L14_2.title = L15_2
            L12_2(L13_2, L14_2)
            L12_2 = A1_2
            L13_2 = false
            L12_2(L13_2)
            return
          end
        end
      end
    end
    L7_2 = 1
    L8_2 = L1_1
    L8_2 = #L8_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L1_1
      L11_2 = L11_2[L10_2]
      L11_2 = L11_2[1]
      if L11_2 == L3_2 then
        L11_2 = L1_1
        L11_2 = L11_2[L10_2]
        L11_2 = L11_2[2]
        if L11_2 == L4_2 then
          L11_2 = table
          L11_2 = L11_2.remove
          L12_2 = L1_1
          L13_2 = L10_2
          L11_2(L12_2, L13_2)
          break
        end
      end
    end
    L7_2 = table
    L7_2 = L7_2.insert
    L8_2 = L1_1
    L9_2 = 1
    L10_2 = {}
    L11_2 = L3_2
    L12_2 = L4_2
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = L3_2
    L8_2 = "."
    L9_2 = L4_2
    L7_2 = L7_2 .. L8_2 .. L9_2
    L2_1 = L7_2
    L7_2 = SetResourceKvp
    L8_2 = "radio_history"
    L9_2 = json
    L9_2 = L9_2.encode
    L10_2 = L1_1
    L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L9_2(L10_2)
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L7_2 = SetResourceKvp
    L8_2 = "radio_lastChannel"
    L9_2 = L2_1
    L7_2(L8_2, L9_2)
    L7_2 = JoinRadio
    L8_2 = tonumber
    L9_2 = L2_1
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L8_2(L9_2)
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L7_2 = Wait
    L8_2 = 100
    L7_2(L8_2)
    L7_2 = A1_2
    L8_2 = {}
    L9_2 = L1_1
    L8_2.history = L9_2
    L9_2 = GetMembers
    L10_2 = tonumber
    L11_2 = L2_1
    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L10_2(L11_2)
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L8_2.members = L9_2
    L7_2(L8_2)
  elseif "getConnectedUsers" == L2_2 then
    L3_2 = A1_2
    L4_2 = GetMembers
    L5_2 = tonumber
    L6_2 = L2_1
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L5_2(L6_2)
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  elseif "setVolume" == L2_2 then
    L3_2 = SetVolume
    L4_2 = A0_2.volume
    L3_2(L4_2)
    L3_2 = A1_2
    L4_2 = "ok"
    L3_2(L4_2)
  elseif "disconnect" == L2_2 then
    L3_2 = LeaveRadio
    L3_2()
    L3_2 = A1_2
    L4_2 = "ok"
    L3_2(L4_2)
  elseif "getLocales" == L2_2 then
    L3_2 = A1_2
    L4_2 = GetAllLocales
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L4_2()
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  end
end
L9_1(L10_1, L11_1)
