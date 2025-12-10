local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = "lb-phone-lookup"
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = Locales
  L2_2 = Config
  L2_2 = L2_2.Locale
  L1_2 = L1_2[L2_2]
  if L1_2 then
    L1_2 = L1_2[A0_2]
  end
  if not L1_2 then
    L1_2 = A0_2
  end
  return L1_2
end
while true do
  L2_1 = GetResourceState
  L3_1 = "lb-phone"
  L2_1 = L2_1(L3_1)
  if "started" == L2_1 then
    break
  end
  L2_1 = Wait
  L3_1 = 500
  L2_1(L3_1)
end
L2_1 = Wait
L3_1 = 500
L2_1(L3_1)
L2_1 = GetResourceMetadata
L3_1 = GetCurrentResourceName
L3_1 = L3_1()
L4_1 = "ui_page"
L5_1 = 0
L2_1 = L2_1(L3_1, L4_1, L5_1)
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = exports
  L0_2 = L0_2["lb-phone"]
  L1_2 = L0_2
  L0_2 = L0_2.AddCustomApp
  L2_2 = {}
  L3_2 = L0_1
  L2_2.identifier = L3_2
  L3_2 = L1_1
  L4_2 = "APP_NAME"
  L3_2 = L3_2(L4_2)
  L2_2.name = L3_2
  L3_2 = L1_1
  L4_2 = "DESCRIPTION"
  L3_2 = L3_2(L4_2)
  L2_2.description = L3_2
  L2_2.developer = "LB"
  L2_2.defaultApp = false
  L2_2.size = 59812
  L3_2 = {}
  L4_2 = "https://cfx-nui-"
  L5_2 = GetCurrentResourceName
  L5_2 = L5_2()
  L6_2 = "/ui/images/light_mode_person.png"
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = "https://cfx-nui-"
  L6_2 = GetCurrentResourceName
  L6_2 = L6_2()
  L7_2 = "/ui/images/light_mode_vehicle.png"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L6_2 = "https://cfx-nui-"
  L7_2 = GetCurrentResourceName
  L7_2 = L7_2()
  L8_2 = "/ui/images/dark_mode_person.png"
  L6_2 = L6_2 .. L7_2 .. L8_2
  L7_2 = "https://cfx-nui-"
  L8_2 = GetCurrentResourceName
  L8_2 = L8_2()
  L9_2 = "/ui/images/dark_mode_vehicle.png"
  L7_2 = L7_2 .. L8_2 .. L9_2
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L2_2.images = L3_2
  L3_2 = L2_1
  L4_2 = L3_2
  L3_2 = L3_2.find
  L5_2 = "http"
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = L2_1
    if L3_2 then
      goto lbl_57
    end
  end
  L3_2 = GetCurrentResourceName
  L3_2 = L3_2()
  L4_2 = "/"
  L5_2 = L2_1
  L3_2 = L3_2 .. L4_2 .. L5_2
  ::lbl_57::
  L2_2.ui = L3_2
  L3_2 = L2_1
  L4_2 = L3_2
  L3_2 = L3_2.find
  L5_2 = "http"
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = L2_1
    L4_2 = "images/icon.png"
    L3_2 = L3_2 .. L4_2
    if L3_2 then
      goto lbl_74
    end
  end
  L3_2 = "https://cfx-nui-"
  L4_2 = GetCurrentResourceName
  L4_2 = L4_2()
  L5_2 = "/ui/dist/images/icon.png"
  L3_2 = L3_2 .. L4_2 .. L5_2
  ::lbl_74::
  L2_2.icon = L3_2
  L2_2.fixBlur = true
  L0_2, L1_2 = L0_2(L1_2, L2_2)
  if not L0_2 then
    L2_2 = print
    L3_2 = "Could not add app:"
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
  end
end
L4_1 = L3_1
L4_1()
L4_1 = AddEventHandler
L5_1 = "onResourceStart"
function L6_1(A0_2)
  local L1_2
  if "lb-phone" == A0_2 then
    L1_2 = L3_1
    L1_2()
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNUICallback
L5_1 = "Lookup"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2.action
  if "search" == L2_2 then
    L3_2 = AwaitCallback
    L4_2 = "lookupapp:search"
    L5_2 = A0_2.query
    L6_2 = A0_2.type
    L7_2 = A0_2.page
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    L4_2 = A0_2.type
    if "vehicle" == L4_2 then
      L4_2 = FormatVehicles
      L5_2 = L3_2.data
      L4_2 = L4_2(L5_2)
      L3_2.data = L4_2
    end
    L4_2 = A1_2
    L5_2 = L3_2
    L4_2(L5_2)
  elseif "getConfig" == L2_2 then
    L3_2 = A1_2
    L4_2 = Config
    L3_2(L4_2)
  elseif "getLocales" == L2_2 then
    L3_2 = A1_2
    L4_2 = Locales
    L5_2 = Config
    L5_2 = L5_2.Locale
    L4_2 = L4_2[L5_2]
    L3_2(L4_2)
  end
end
L4_1(L5_1, L6_1)
