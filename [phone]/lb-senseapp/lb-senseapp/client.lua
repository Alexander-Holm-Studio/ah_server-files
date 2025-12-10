local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = "lovense-app"
while true do
  L1_1 = GetResourceState
  L2_1 = "lb-phone"
  L1_1 = L1_1(L2_1)
  if "started" == L1_1 then
    break
  end
  L1_1 = Wait
  L2_1 = 500
  L1_1(L2_1)
end
L1_1 = {}
L2_1 = nil
L3_1 = nil
L4_1 = nil
function L5_1(...)
  local L0_2, L1_2, L2_2
  L0_2 = Config
  if L0_2 then
    L0_2 = Config
    L0_2 = L0_2.Debug
    if L0_2 then
      L0_2 = print
      L1_2 = "Lovense Shit"
      L2_2 = ...
      L0_2(L1_2, L2_2)
    end
  end
end
L6_1 = AddEventHandler
L7_1 = "playerSpawned"
function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = GetPlayerServerId
  L1_2 = PlayerId
  L1_2, L2_2, L3_2, L4_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2)
  L1_2 = GetPlayerName
  L2_2 = PlayerId
  L2_2, L3_2, L4_2 = L2_2()
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = {}
  L3_2 = "player_"
  L4_2 = L0_2
  L3_2 = L3_2 .. L4_2
  L2_2.identifier = L3_2
  L2_2.name = L1_2
  L1_1 = L2_2
  L2_2 = TriggerServerEvent
  L3_2 = "lovense:getConfig"
  L2_2(L3_2)
end
L6_1(L7_1, L8_1)
L6_1 = AddEventHandler
L7_1 = "onResourceStart"
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 == L1_2 then
    L1_2 = GetPlayerServerId
    L2_2 = PlayerId
    L2_2, L3_2, L4_2, L5_2 = L2_2()
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    L2_2 = GetPlayerName
    L3_2 = PlayerId
    L3_2, L4_2, L5_2 = L3_2()
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L3_2 = {}
    L4_2 = "player_"
    L5_2 = L1_2
    L4_2 = L4_2 .. L5_2
    L3_2.identifier = L4_2
    L3_2.name = L2_2
    L1_1 = L3_2
    L3_2 = TriggerServerEvent
    L4_2 = "lovense:getConfig"
    L3_2(L4_2)
  end
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "lovense:receiveConfig"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "lovense:receiveConfig"
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2.success
  if L1_2 then
    L1_2 = A0_2.config
    L2_1 = L1_2
    L1_2 = A0_2.config
    L1_2 = L1_2.qrData
    L1_2 = L1_2.sessionId
    L3_1 = L1_2
    L1_2 = L5_1
    L2_2 = string
    L2_2 = L2_2.format
    L3_2 = "Configuration received from server with session: %s"
    L4_2 = L3_1
    L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = exports
    L1_2 = L1_2["lb-phone"]
    L2_2 = L1_2
    L1_2 = L1_2.SendNotification
    L3_2 = {}
    L3_2.app = "Lovense"
    L3_2.title = "Connected"
    L3_2.content = "You can now control your Lovense toy."
    L1_2(L2_2, L3_2)
    L1_2 = SendNUIMessage
    L2_2 = {}
    L2_2.type = "getLovenseConfig"
    L2_2.success = true
    L3_2 = L2_1
    L2_2.config = L3_2
    L1_2(L2_2)
    L1_2 = L4_1
    if L1_2 then
      L1_2 = nil
      L4_1 = L1_2
    end
    L1_2 = SetTimeout
    L2_2 = 240000
    function L3_2()
      local L0_3, L1_3
      L0_3 = L5_1
      L1_3 = "QR code expiring soon, refreshing..."
      L0_3(L1_3)
      L0_3 = TriggerServerEvent
      L1_3 = "lovense:getConfig"
      L0_3(L1_3)
    end
    L1_2 = L1_2(L2_2, L3_2)
    L4_1 = L1_2
  else
    L1_2 = L5_1
    L2_2 = "Failed to receive configuration from server"
    L1_2(L2_2)
    L1_2 = SendNUIMessage
    L2_2 = {}
    L2_2.type = "getLovenseConfig"
    L2_2.success = false
    L2_2.error = "Failed to receive configuration from server"
    L1_2(L2_2)
  end
end
L6_1(L7_1, L8_1)
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = exports
  L0_2 = L0_2["lb-phone"]
  L1_2 = L0_2
  L0_2 = L0_2.AddCustomApp
  L2_2 = {}
  L3_2 = L0_1
  L2_2.identifier = L3_2
  L2_2.name = "Sense App"
  L2_2.description = "Control your sense toys remotely"
  L2_2.developer = "Abstract"
  L2_2.defaultApp = true
  L2_2.size = 500
  L2_2.color = "#FF58DB"
  L2_2.icon = "https://r2.fivemanage.com/pihbE4g0XErRDALLNN2KC/ChatGPTImageSep11202507_58_28PM.png"
  L3_2 = GetCurrentResourceName
  L3_2 = L3_2()
  L4_2 = "/ui/dist/index.html"
  L3_2 = L3_2 .. L4_2
  L2_2.ui = L3_2
  L0_2, L1_2 = L0_2(L1_2, L2_2)
  if L0_2 then
    L2_2 = L5_1
    L3_2 = "App added successfully to LB Phone"
    L2_2(L3_2)
  else
    L2_2 = L5_1
    L3_2 = "Failed to add app:"
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
  end
end
L7_1 = CreateThread
function L8_1()
  local L0_2, L1_2
  L0_2 = Wait
  L1_2 = 2000
  L0_2(L1_2)
  L0_2 = L6_1
  L0_2()
end
L7_1(L8_1)
L7_1 = RegisterNUICallback
L8_1 = "getPlayerInfo"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = {}
  L3_2.success = true
  L4_2 = L1_1
  L3_2.data = L4_2
  L2_2(L3_2)
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNUICallback
L8_1 = "getLovenseConfig"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L2_1
  if L2_2 then
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.type = "getLovenseConfig"
    L3_2.success = true
    L4_2 = L2_1
    L3_2.config = L4_2
    L2_2(L3_2)
    L2_2 = A1_2
    L3_2 = {}
    L3_2.success = true
    L4_2 = L2_1
    L3_2.config = L4_2
    L2_2(L3_2)
  else
    L2_2 = TriggerServerEvent
    L3_2 = "lovense:getConfig"
    L2_2(L3_2)
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.type = "getLovenseConfig"
    L3_2.success = false
    L3_2.error = "Config bs not working, requesting from server..."
    L2_2(L3_2)
    L2_2 = A1_2
    L3_2 = {}
    L3_2.success = false
    L3_2.error = "Config bs not working, requesting from server..."
    L2_2(L3_2)
  end
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNUICallback
L8_1 = "refreshQRCode"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L5_1
  L3_2 = "Refreshing QR code..."
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "lovense:getConfig"
  L2_2(L3_2)
  L2_2 = A1_2
  L3_2 = {}
  L3_2.success = true
  L2_2(L3_2)
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNUICallback
L8_1 = "lovenseConnected"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L5_1
  L3_2 = "Lovense UI reported connection established"
  L2_2(L3_2)
  L2_2 = exports
  L2_2 = L2_2["lb-phone"]
  L3_2 = L2_2
  L2_2 = L2_2.SendNotification
  L4_2 = {}
  L4_2.app = "lovense-app"
  L4_2.title = "Lovense Connected"
  L4_2.content = "You are now in control of your Lovense toy."
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = {}
  L3_2.success = true
  L2_2(L3_2)
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNUICallback
L8_1 = "vibrate"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2.level
  if not L2_2 then
    L2_2 = 0
  end
  L3_2 = A0_2.duration
  if not L3_2 then
    L3_2 = 0
  end
  L4_2 = TriggerServerEvent
  L5_2 = "lovense:logCommand"
  L6_2 = {}
  L6_2.type = "vibrate"
  L6_2.level = L2_2
  L6_2.duration = L3_2
  L7_2 = L3_1
  L6_2.sessionId = L7_2
  L4_2(L5_2, L6_2)
  L4_2 = A1_2
  L5_2 = {}
  L5_2.success = true
  L4_2(L5_2)
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNUICallback
L8_1 = "sendPreset"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2.preset
  if not L2_2 then
    L2_2 = "unknown"
  end
  L3_2 = A0_2.duration
  if not L3_2 then
    L3_2 = 9
  end
  L4_2 = TriggerServerEvent
  L5_2 = "lovense:logCommand"
  L6_2 = {}
  L6_2.type = "preset"
  L6_2.preset = L2_2
  L6_2.duration = L3_2
  L7_2 = L3_1
  L6_2.sessionId = L7_2
  L4_2(L5_2, L6_2)
  L4_2 = A1_2
  L5_2 = {}
  L5_2.success = true
  L4_2(L5_2)
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNUICallback
L8_1 = "sendNotification"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2.message
  if not L2_2 then
    L2_2 = "No message"
  end
  L3_2 = exports
  L3_2 = L3_2["lb-phone"]
  L4_2 = L3_2
  L3_2 = L3_2.SendNotification
  L5_2 = {}
  L5_2.app = "Lovense"
  L5_2.title = "Lovense"
  L5_2.content = L2_2
  L3_2(L4_2, L5_2)
  L3_2 = A1_2
  L4_2 = {}
  L4_2.success = true
  L3_2(L4_2)
end
L7_1(L8_1, L9_1)
L7_1 = AddEventHandler
L8_1 = "onResourceStop"
function L9_1(A0_2)
  local L1_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 == L1_2 then
    L1_2 = L4_1
    if L1_2 then
      L1_2 = nil
      L4_1 = L1_2
    end
  end
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNUICallback
L8_1 = "inviteUser"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = tonumber
  L3_2 = A0_2 or L3_2
  if A0_2 then
    L3_2 = A0_2.targetId
  end
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = A1_2
    L4_2 = {}
    L4_2.success = false
    L4_2.error = "invalid_target"
    L3_2(L4_2)
    return
  end
  L3_2 = TriggerServerEvent
  L4_2 = "lovense:inviteUser"
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  L3_2 = A1_2
  L4_2 = {}
  L4_2.success = true
  L3_2(L4_2)
end
L7_1(L8_1, L9_1)
