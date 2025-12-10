local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = "lb-picchat"
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
L1_1 = Wait
L2_1 = 1000
L1_1(L2_1)
L1_1 = exports
L1_1 = L1_1["lb-phone"]
L2_1 = L1_1
L1_1 = L1_1.IsOpen
L1_1 = L1_1(L2_1)
L2_1 = false
L3_1 = false
L4_1 = false
L5_1 = GetResourceMetadata
L6_1 = GetCurrentResourceName
L6_1 = L6_1()
L7_1 = "ui_page"
L8_1 = 0
L5_1 = L5_1(L6_1, L7_1, L8_1)
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = exports
  L0_2 = L0_2["lb-phone"]
  L1_2 = L0_2
  L0_2 = L0_2.AddCustomApp
  L2_2 = {}
  L3_2 = L0_1
  L2_2.identifier = L3_2
  L3_2 = Config
  L3_2 = L3_2.App
  if L3_2 then
    L3_2 = L3_2.Name
  end
  if not L3_2 then
    L3_2 = "PicChat"
  end
  L2_2.name = L3_2
  L3_2 = Config
  L3_2 = L3_2.App
  if L3_2 then
    L3_2 = L3_2.Description
  end
  if not L3_2 then
    L3_2 = "Social media platform for sharing photos and chatting with friends."
  end
  L2_2.description = L3_2
  L2_2.developer = "LB"
  L3_2 = Config
  L3_2 = L3_2.App
  if L3_2 then
    L3_2 = L3_2.Default
  end
  L2_2.defaultApp = L3_2
  L2_2.size = 59812
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
  L3_2 = L5_1
  L4_2 = L3_2
  L3_2 = L3_2.find
  L5_2 = "http"
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = L5_1
    if L3_2 then
      goto lbl_62
    end
  end
  L3_2 = GetCurrentResourceName
  L3_2 = L3_2()
  L4_2 = "/"
  L5_2 = L5_1
  L3_2 = L3_2 .. L4_2 .. L5_2
  ::lbl_62::
  L2_2.ui = L3_2
  L3_2 = L5_1
  L4_2 = L3_2
  L3_2 = L3_2.find
  L5_2 = "http"
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = L5_1
    L4_2 = "PicChat.png"
    L3_2 = L3_2 .. L4_2
    if L3_2 then
      goto lbl_79
    end
  end
  L3_2 = "https://cfx-nui-"
  L4_2 = GetCurrentResourceName
  L4_2 = L4_2()
  L5_2 = "/ui/dist/PicChat.png"
  L3_2 = L3_2 .. L4_2 .. L5_2
  ::lbl_79::
  L2_2.icon = L3_2
  L2_2.fixBlur = true
  function L3_2()
    local L0_3, L1_3
    L0_3 = true
    L2_1 = L0_3
    L0_3 = TriggerServerEvent
    L1_3 = "lb-picchat:openedApp"
    L0_3(L1_3)
  end
  L2_2.onOpen = L3_2
  function L3_2()
    local L0_3, L1_3, L2_3
    L0_3 = TriggerServerEvent
    L1_3 = "lb-picchat:closedApp"
    L0_3(L1_3)
    L0_3 = exports
    L0_3 = L0_3["lb-phone"]
    L1_3 = L0_3
    L0_3 = L0_3.DisableWalkableCam
    L0_3(L1_3)
    L0_3 = exports
    L0_3 = L0_3["lb-phone"]
    L1_3 = L0_3
    L0_3 = L0_3.ToggleFlashlight
    L2_3 = false
    L0_3(L1_3, L2_3)
    L0_3 = false
    L2_1 = L0_3
    L0_3 = false
    L3_1 = L0_3
  end
  L2_2.onClose = L3_2
  L0_2, L1_2 = L0_2(L1_2, L2_2)
  if not L0_2 then
    L2_2 = print
    L3_2 = "Could not add app:"
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
  end
  L2_2 = debugprint
  L3_2 = "Added app"
  L4_2 = L0_2
  L5_2 = L1_2
  L2_2(L3_2, L4_2, L5_2)
end
L7_1 = L6_1
L7_1()
L7_1 = AddEventHandler
L8_1 = "onResourceStart"
function L9_1(A0_2)
  local L1_2
  if "lb-phone" == A0_2 then
    L1_2 = L6_1
    L1_2()
  end
end
L7_1(L8_1, L9_1)
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = AwaitCallback
  L2_2 = "getPosts"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L1_2[L5_2]
    L7_2 = L6_2.metadata
    if L7_2 then
      L7_2 = json
      L7_2 = L7_2.decode
      L8_2 = L6_2.metadata
      L7_2 = L7_2(L8_2)
    end
    L6_2.metadata = L7_2
    L7_2 = L6_2.sent_at
    L6_2.timestamp = L7_2
    L6_2.sent_at = nil
  end
  return L1_2
end
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = AwaitCallback
  L3_2 = "getMessages"
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = 1
  L4_2 = #L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L2_2[L6_2]
    L8_2 = L7_2.post_type
    if "chat" == L8_2 then
      L8_2 = L7_2.metadata
      if L8_2 then
        L8_2 = L7_2.metadata
        L9_2 = L8_2
        L8_2 = L8_2.sub
        L10_2 = 1
        L11_2 = "<!ATTACHMENTS!>:"
        L11_2 = #L11_2
        L8_2 = L8_2(L9_2, L10_2, L11_2)
        if "<!ATTACHMENTS!>:" == L8_2 then
          L8_2 = L7_2.metadata
          L9_2 = L8_2
          L8_2 = L8_2.gsub
          L10_2 = "<!ATTACHMENTS!>:"
          L11_2 = ""
          L8_2 = L8_2(L9_2, L10_2, L11_2)
          L7_2.metadata = L8_2
          L8_2 = json
          L8_2 = L8_2.decode
          L9_2 = L7_2.metadata
          L8_2 = L8_2(L9_2)
          L7_2.attachments = L8_2
          L7_2.metadata = nil
        end
      end
    end
    L8_2 = {}
    L9_2 = L7_2.id
    L8_2.id = L9_2
    L9_2 = L7_2.sender
    L8_2.sender = L9_2
    L9_2 = L7_2.post_type
    L8_2.type = L9_2
    L9_2 = L7_2.post_type
    if "chat" == L9_2 then
      L9_2 = L7_2.metadata
      if L9_2 then
        goto lbl_55
      end
      L9_2 = ""
      if L9_2 then
        goto lbl_55
      end
    end
    L9_2 = nil
    ::lbl_55::
    L8_2.content = L9_2
    L9_2 = L7_2.link
    L8_2.attachment = L9_2
    L9_2 = L7_2.attachments
    L8_2.attachments = L9_2
    L9_2 = L7_2.post_type
    if "media" == L9_2 then
      L9_2 = L7_2.metadata
      if L9_2 then
        L9_2 = json
        L9_2 = L9_2.decode
        L10_2 = L7_2.metadata
        L9_2 = L9_2(L10_2)
        if L9_2 then
          goto lbl_73
        end
      end
    end
    L9_2 = nil
    ::lbl_73::
    L8_2.metadata = L9_2
    L9_2 = L7_2.opened
    L8_2.opened = L9_2
    L9_2 = L7_2.saved
    L8_2.saved = L9_2
    L9_2 = L7_2.sent_at
    L8_2.timestamp = L9_2
    L2_2[L6_2] = L8_2
  end
  return L2_2
end
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = {}
  L2_2 = A0_2.x
  L1_2.x = L2_2
  L2_2 = A0_2.y
  L1_2.y = L2_2
  L2_2 = GetGroundZFor_3dCoord
  L3_2 = A0_2.x
  L4_2 = A0_2.y
  L5_2 = 1000.0
  L6_2 = false
  L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L4_2 = GetStreetNameAtCoord
  L5_2 = A0_2.x
  L6_2 = A0_2.y
  L7_2 = L3_2 or L7_2
  if not L2_2 or not L3_2 then
    L7_2 = 100.0
  end
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = L4_2 or L5_2
  if L4_2 then
    L5_2 = GetStreetNameFromHashKey
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
  end
  L6_2 = GetNameOfZone
  L7_2 = A0_2.x
  L8_2 = A0_2.y
  L9_2 = L3_2 or L9_2
  if not L2_2 or not L3_2 then
    L9_2 = 100.0
  end
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2 or L7_2
  if L6_2 then
    L7_2 = GetLabelText
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
  end
  if L5_2 then
    L1_2.street = L5_2
  end
  if L7_2 then
    L1_2.zone = L7_2
  end
  return L1_2
end
FormatLocation = L9_1
function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = AwaitCallback
  L1_2 = "getLoggedIn"
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = 1
  L2_2 = L0_2.friends
  L2_2 = #L2_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L0_2.friends
    L5_2 = L5_2[L4_2]
    L6_2 = L5_2.location
    if L6_2 then
      L6_2 = FormatLocation
      L7_2 = L5_2.location
      L6_2 = L6_2(L7_2)
    end
    L5_2.location = L6_2
  end
  return L0_2
end
function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = {}
  L3_2 = AwaitCallback
  L4_2 = "getSavedPosts"
  L5_2 = A0_2
  L6_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = 1
  L5_2 = #L3_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L3_2[L7_2]
    L9_2 = L8_2.post_type
    if "chat" == L9_2 then
      L9_2 = L8_2.metadata
      if L9_2 then
        L9_2 = L8_2.metadata
        L10_2 = L9_2
        L9_2 = L9_2.sub
        L11_2 = 1
        L12_2 = "<!ATTACHMENTS!>:"
        L12_2 = #L12_2
        L9_2 = L9_2(L10_2, L11_2, L12_2)
        if "<!ATTACHMENTS!>:" == L9_2 then
          L9_2 = L8_2.metadata
          L10_2 = L9_2
          L9_2 = L9_2.gsub
          L11_2 = "<!ATTACHMENTS!>:"
          L12_2 = ""
          L9_2 = L9_2(L10_2, L11_2, L12_2)
          L8_2.metadata = L9_2
          L9_2 = json
          L9_2 = L9_2.decode
          L10_2 = L8_2.metadata
          L9_2 = L9_2(L10_2)
          L10_2 = 1
          L11_2 = #L9_2
          L12_2 = 1
          for L13_2 = L10_2, L11_2, L12_2 do
            L14_2 = #L2_2
            L14_2 = L14_2 + 1
            L15_2 = {}
            L16_2 = L8_2.sender
            L15_2.sender = L16_2
            L16_2 = L9_2[L13_2]
            L15_2.link = L16_2
            L2_2[L14_2] = L15_2
          end
      end
    end
    else
      L9_2 = L8_2.post_type
      if "media" == L9_2 then
        L9_2 = #L2_2
        L9_2 = L9_2 + 1
        L10_2 = {}
        L11_2 = L8_2.id
        L10_2.id = L11_2
        L11_2 = L8_2.sender
        L10_2.sender = L11_2
        L11_2 = L8_2.link
        L10_2.link = L11_2
        L11_2 = L8_2.metadata
        if L11_2 then
          L11_2 = json
          L11_2 = L11_2.decode
          L12_2 = L8_2.metadata
          L11_2 = L11_2(L12_2)
        end
        L10_2.metadata = L11_2
        L2_2[L9_2] = L10_2
      end
    end
  end
  return L2_2
end
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = 1
  L1_2 = 32
  L2_2 = 1
  for L3_2 = L0_2, L1_2, L2_2 do
    L4_2 = IsPedheadshotValid
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = UnregisterPedheadshot
      L5_2 = L3_2
      L4_2(L5_2)
    end
  end
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = RegisterPedheadshot
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = GetGameTimer
  L2_2 = L2_2()
  L2_2 = L2_2 + 5000
  while true do
    L3_2 = IsPedheadshotReady
    L4_2 = L1_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = IsPedheadshotValid
      L4_2 = L1_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        break
      end
    end
    L3_2 = Wait
    L4_2 = 0
    L3_2(L4_2)
    L3_2 = GetGameTimer
    L3_2 = L3_2()
    if L2_2 <= L3_2 then
      return
    end
  end
  L3_2 = GetPedheadshotTxdString
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L4_2 = string
  L4_2 = L4_2.format
  L5_2 = "https://nui-img/%s/%s"
  L6_2 = L3_2
  L7_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = SendReactMessage
  L6_2 = "uploadAvatar"
  L7_2 = L4_2
  L5_2(L6_2, L7_2)
end
function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = GetEntityCoords
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = GetVehiclePedIsIn
  L3_2 = L0_2
  L4_2 = false
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = math
  L3_2 = L3_2.floor
  L4_2 = L1_2.z
  L4_2 = L4_2 + 0.5
  L3_2 = L3_2(L4_2)
  L4_2 = GetStreetNameAtCoord
  L5_2 = L1_2.x
  L6_2 = L1_2.y
  L7_2 = L1_2.z
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = L4_2 or L5_2
  if L4_2 then
    L5_2 = GetStreetNameFromHashKey
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
  end
  L6_2 = GetNameOfZone
  L7_2 = L1_2.x
  L8_2 = L1_2.y
  L9_2 = L1_2.z
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2 or L7_2
  if L6_2 then
    L7_2 = GetLabelText
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
  end
  L8_2 = {}
  if L2_2 then
    L9_2 = DoesEntityExist
    L10_2 = L2_2
    L9_2 = L9_2(L10_2)
    if L9_2 then
      L9_2 = GetEntitySpeed
      L10_2 = L2_2
      L9_2 = L9_2(L10_2)
      if L9_2 and L9_2 > 1 then
        L10_2 = {}
        L11_2 = math
        L11_2 = L11_2.floor
        L12_2 = L9_2 * 3.6
        L12_2 = L12_2 + 0.5
        L11_2 = L11_2(L12_2)
        L10_2.kph = L11_2
        L11_2 = math
        L11_2 = L11_2.floor
        L12_2 = L9_2 * 2.236936
        L12_2 = L12_2 + 0.5
        L11_2 = L11_2(L12_2)
        L10_2.mph = L11_2
        L8_2.speed = L10_2
      end
    end
  end
  if L5_2 then
    L8_2.street = L5_2
  end
  if L7_2 then
    L8_2.zone = L7_2
  end
  L9_2 = {}
  L9_2.meters = L3_2
  L10_2 = math
  L10_2 = L10_2.floor
  L11_2 = L3_2 * 3.2808399
  L11_2 = L11_2 + 0.5
  L10_2 = L10_2(L11_2)
  L9_2.feet = L10_2
  L8_2.altitude = L9_2
  return L8_2
end
function L13_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L3_1
  if not L0_2 then
    return
  end
  L0_2 = exports
  L0_2 = L0_2["lb-phone"]
  L1_2 = L0_2
  L0_2 = L0_2.IsSelfieCam
  L0_2 = L0_2(L1_2)
  L1_2 = exports
  L1_2 = L1_2["lb-phone"]
  L2_2 = L1_2
  L1_2 = L1_2.ToggleSelfieCam
  L3_2 = not L0_2
  L1_2(L2_2, L3_2)
end
function L14_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  while true do
    L1_2 = L4_1
    if not L1_2 then
      break
    end
    L1_2 = L2_1
    if L1_2 then
      L1_2 = L1_1
      if L1_2 then
        L1_2 = GetEntityCoords
        L2_2 = L0_2
        L1_2 = L1_2(L2_2)
        L2_2 = SendReactMessage
        L3_2 = "updateCoords"
        L4_2 = {}
        L5_2 = L1_2.x
        L4_2.x = L5_2
        L5_2 = L1_2.y
        L4_2.y = L5_2
        L2_2(L3_2, L4_2)
      end
    end
    L1_2 = Wait
    L2_2 = 100
    L1_2(L2_2)
  end
end
L15_1 = RegisterNUICallback
L16_1 = "PicChat"
function L17_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = A0_2.action
  if "getConfig" == L2_2 then
    L3_2 = A1_2
    L4_2 = {}
    L5_2 = Config
    L5_2 = L5_2.DeleteAccount
    L4_2.deleteAccount = L5_2
    L5_2 = Config
    L5_2 = L5_2.ChangePassword
    L4_2.changePassword = L5_2
    L5_2 = Config
    L5_2 = L5_2.Debug
    L4_2.debug = L5_2
    L5_2 = Config
    L5_2 = L5_2.Units
    L4_2.units = L5_2
    return L3_2(L4_2)
  elseif "getLocales" == L2_2 then
    L3_2 = A1_2
    L4_2 = GetLocales
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L4_2()
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  elseif "toggleUpdateCoords" == L2_2 then
    L3_2 = A1_2
    L4_2 = "ok"
    L3_2(L4_2)
    L3_2 = A0_2.toggle
    L3_2 = true == L3_2
    L4_2 = L4_1
    if L4_2 == L3_2 then
      return
    end
    L4_1 = L3_2
    L4_2 = L14_1
    return L4_2()
  end
  if "getLoggedIn" == L2_2 then
    L3_2 = A1_2
    L4_2 = L9_1
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L4_2()
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  elseif "createAccount" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "createAccount"
    L5_2 = A1_2
    L6_2 = A0_2.data
    return L3_2(L4_2, L5_2, L6_2)
  elseif "login" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "login"
    L5_2 = A1_2
    L6_2 = A0_2.data
    L6_2 = L6_2.username
    L7_2 = A0_2.data
    L7_2 = L7_2.password
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "logout" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "logout"
    L5_2 = A1_2
    return L3_2(L4_2, L5_2)
  elseif "saveSettings" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "saveSettings"
    L5_2 = A1_2
    L6_2 = A0_2.settings
    return L3_2(L4_2, L5_2, L6_2)
  elseif "setName" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "setName"
    L5_2 = A1_2
    L6_2 = A0_2.name
    return L3_2(L4_2, L5_2, L6_2)
  elseif "updateAvatar" == L2_2 then
    L3_2 = L11_1
    L3_2()
    L3_2 = A1_2
    L4_2 = "ok"
    return L3_2(L4_2)
  elseif "setAvatar" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "setAvatar"
    L5_2 = A1_2
    L6_2 = A0_2.url
    return L3_2(L4_2, L5_2, L6_2)
  elseif "changePassword" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "changePassword"
    L5_2 = A1_2
    L6_2 = A0_2.oldPassword
    L7_2 = A0_2.newPassword
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "deleteAccount" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "deleteAccount"
    L5_2 = A1_2
    L6_2 = A0_2.password
    return L3_2(L4_2, L5_2, L6_2)
  end
  if "toggleCameraView" == L2_2 then
    L3_2 = A0_2.toggle
    L3_2 = true == L3_2
    L3_1 = L3_2
    L3_2 = A0_2.toggle
    if L3_2 then
      L3_2 = exports
      L3_2 = L3_2["lb-phone"]
      L4_2 = L3_2
      L3_2 = L3_2.EnableWalkableCam
      L3_2(L4_2)
    else
      L3_2 = exports
      L3_2 = L3_2["lb-phone"]
      L4_2 = L3_2
      L3_2 = L3_2.DisableWalkableCam
      L3_2(L4_2)
      L3_2 = exports
      L3_2 = L3_2["lb-phone"]
      L4_2 = L3_2
      L3_2 = L3_2.ToggleFlashlight
      L5_2 = false
      L3_2(L4_2, L5_2)
    end
    L3_2 = A1_2
    L4_2 = "ok"
    return L3_2(L4_2)
  elseif "flipCamera" == L2_2 then
    L3_2 = L13_1
    L3_2()
    L3_2 = A1_2
    L4_2 = "ok"
    return L3_2(L4_2)
  elseif "toggleFlash" == L2_2 then
    L3_2 = L3_1
    if not L3_2 then
      L3_2 = debugprint
      L4_2 = "toggleFlash: not in camera"
      L3_2(L4_2)
      L3_2 = A1_2
      L4_2 = false
      return L3_2(L4_2)
    end
    L3_2 = exports
    L3_2 = L3_2["lb-phone"]
    L4_2 = L3_2
    L3_2 = L3_2.ToggleFlashlight
    L5_2 = A0_2.toggle
    L5_2 = true == L5_2
    L3_2(L4_2, L5_2)
    L3_2 = A1_2
    L4_2 = "ok"
    return L3_2(L4_2)
  elseif "getMediaMetadata" == L2_2 then
    L3_2 = A1_2
    L4_2 = L12_1
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L4_2()
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  if "searchUsers" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "searchUsers"
    L5_2 = A1_2
    L6_2 = A0_2.search
    L7_2 = A0_2.page
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "getContacts" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "getContacts"
    L5_2 = A1_2
    return L3_2(L4_2, L5_2)
  elseif "addFriend" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "addFriend"
    L5_2 = A1_2
    L6_2 = A0_2.username
    return L3_2(L4_2, L5_2, L6_2)
  elseif "acceptFriend" == L2_2 then
    L3_2 = AwaitCallback
    L4_2 = "acceptFriend"
    L5_2 = A0_2.username
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = debugprint
    L5_2 = L3_2
    L4_2(L5_2)
    if L3_2 then
      L4_2 = L3_2.location
      if L4_2 then
        L4_2 = FormatLocation
        L5_2 = L3_2.location
        L4_2 = L4_2(L5_2)
      end
      L3_2.location = L4_2
    end
    L4_2 = A1_2
    L5_2 = L3_2
    return L4_2(L5_2)
  elseif "removeFriend" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "removeFriend"
    L5_2 = A1_2
    L6_2 = A0_2.username
    return L3_2(L4_2, L5_2, L6_2)
  elseif "setFriendNickname" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "setFriendNickname"
    L5_2 = A1_2
    L6_2 = A0_2.username
    L7_2 = A0_2.name
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "toggleBestFriend" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "toggleBestFriend"
    L5_2 = A1_2
    L6_2 = A0_2.username
    L7_2 = A0_2.toggle
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  end
  if "getPosts" == L2_2 then
    L3_2 = A1_2
    L4_2 = L7_1
    L5_2 = A0_2.username
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L4_2(L5_2)
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  elseif "sendPost" == L2_2 then
    L3_2 = A0_2.data
    L3_2 = L3_2.usernames
    L4_2 = A0_2.data
    L4_2 = L4_2.link
    L5_2 = A0_2.data
    L5_2 = L5_2.metadata
    L6_2 = A0_2.data
    L6_2 = L6_2.isVideo
    L6_2 = true == L6_2
    L7_2 = TriggerCallback
    L8_2 = "sendPost"
    L9_2 = A1_2
    L10_2 = L3_2
    L11_2 = L4_2
    L12_2 = L6_2
    if L5_2 then
      L13_2 = json
      L13_2 = L13_2.encode
      L14_2 = L5_2
      L13_2 = L13_2(L14_2)
      if L13_2 then
        goto lbl_327
      end
    end
    L13_2 = nil
    ::lbl_327::
    return L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  elseif "viewedPosts" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "markPostsAsOpened"
    L5_2 = A1_2
    L6_2 = A0_2.posts
    L7_2 = A0_2.username
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "toggleSave" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "toggleSavePost"
    L5_2 = A1_2
    L6_2 = A0_2.state
    L7_2 = A0_2.id
    L8_2 = A0_2.username
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  elseif "toggleTyping" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "toggleTyping"
    L5_2 = A1_2
    L6_2 = A0_2.username
    L7_2 = A0_2.state
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "toggleInChat" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "toggleInChat"
    L5_2 = A1_2
    L6_2 = A0_2.username
    L7_2 = A0_2.state
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "getChatStatus" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "getChatStatus"
    L5_2 = A1_2
    L6_2 = A0_2.username
    return L3_2(L4_2, L5_2, L6_2)
  elseif "sendMessage" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "sendMessage"
    L5_2 = A1_2
    L6_2 = A0_2.username
    L7_2 = A0_2.content
    L8_2 = A0_2.attachments
    if L8_2 then
      L8_2 = json
      L8_2 = L8_2.encode
      L9_2 = A0_2.attachments
      L8_2 = L8_2(L9_2)
    end
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  elseif "getMessages" == L2_2 then
    L3_2 = A1_2
    L4_2 = L8_1
    L5_2 = A0_2.username
    L6_2 = A0_2.lastId
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L4_2(L5_2, L6_2)
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  elseif "getSavedPosts" == L2_2 then
    L3_2 = A1_2
    L4_2 = L10_1
    L5_2 = A0_2.username
    L6_2 = A0_2.lastId
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L4_2(L5_2, L6_2)
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  elseif "getStories" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "getStories"
    L5_2 = A1_2
    L6_2 = A0_2.username
    return L3_2(L4_2, L5_2, L6_2)
  elseif "viewedStories" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "markStoriesAsViewed"
    L5_2 = A1_2
    L6_2 = A0_2.stories
    L7_2 = A0_2.username
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "removeStory" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "removeStory"
    L5_2 = A1_2
    L6_2 = A0_2.id
    return L3_2(L4_2, L5_2, L6_2)
  elseif "getStoryViewers" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "getStoryViewers"
    L5_2 = A1_2
    L6_2 = A0_2.id
    return L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = debugprint
  L4_2 = "Unknown action:"
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
end
L15_1(L16_1, L17_1)
L15_1 = RegisterNetEvent
L16_1 = "lb-phone:phoneToggled"
function L17_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_1 = A0_2
  L1_2 = L2_1
  if not L1_2 then
    return
  end
  if A0_2 then
    L1_2 = L3_1
    if L1_2 then
      L1_2 = exports
      L1_2 = L1_2["lb-phone"]
      L2_2 = L1_2
      L1_2 = L1_2.EnableWalkableCam
      L1_2(L2_2)
    end
  else
    L1_2 = exports
    L1_2 = L1_2["lb-phone"]
    L2_2 = L1_2
    L1_2 = L1_2.DisableWalkableCam
    L1_2(L2_2)
    L1_2 = exports
    L1_2 = L1_2["lb-phone"]
    L2_2 = L1_2
    L1_2 = L1_2.ToggleFlashlight
    L3_2 = false
    L1_2(L2_2, L3_2)
  end
end
L15_1(L16_1, L17_1)
L15_1 = AddEventHandler
L16_1 = "lb-phone:keyPressed"
function L17_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L3_1
  if L1_2 then
    L1_2 = L2_1
    if L1_2 then
      L1_2 = L1_1
      if L1_2 then
        goto lbl_11
      end
    end
  end
  do return end
  ::lbl_11::
  if "FlipCamera" == A0_2 then
    L1_2 = L13_1
    L1_2()
  elseif "TakePhoto" == A0_2 then
    L1_2 = SendReactMessage
    L2_2 = "takePhoto"
    L1_2(L2_2)
  elseif "ToggleFlash" == A0_2 then
    L1_2 = SendReactMessage
    L2_2 = "toggleFlash"
    L1_2(L2_2)
  elseif "LeftMode" == A0_2 then
    L1_2 = SendReactMessage
    L2_2 = "changeMode"
    L3_2 = "left"
    L1_2(L2_2, L3_2)
  elseif "RightMode" == A0_2 then
    L1_2 = SendReactMessage
    L2_2 = "changeMode"
    L3_2 = "right"
    L1_2(L2_2, L3_2)
  end
end
L15_1(L16_1, L17_1)