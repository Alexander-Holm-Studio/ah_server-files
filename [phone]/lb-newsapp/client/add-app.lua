local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
CURRENT_DEVICE = nil
L0_1 = GetCurrentResourceName
L0_1 = L0_1()
L1_1 = GetResourceMetadata
L2_1 = L0_1
L3_1 = "ui_page"
L4_1 = 0
L1_1 = L1_1(L2_1, L3_1, L4_1)
L2_1 = nil
L4_1 = L1_1
L3_1 = L1_1.sub
L5_1 = 1
L6_1 = 4
L3_1 = L3_1(L4_1, L5_1, L6_1)
if "http" == L3_1 then
  L3_1 = L1_1
  L4_1 = "/public"
  L3_1 = L3_1 .. L4_1
  L2_1 = L3_1
else
  L3_1 = "https://cfx-nui-"
  L4_1 = L0_1
  L5_1 = "/ui/dist"
  L3_1 = L3_1 .. L4_1 .. L5_1
  L2_1 = L3_1
end
L3_1 = {}
L3_1.identifier = "lb-newsapp"
L4_1 = Config
L4_1 = L4_1.DefaultApp
L4_1 = true == L4_1
L3_1.defaultApp = L4_1
L3_1.size = 24713
L4_1 = L
L5_1 = "APP.NAME"
L4_1 = L4_1(L5_1)
L3_1.name = L4_1
L4_1 = L
L5_1 = "APP.DESCRIPTION"
L4_1 = L4_1(L5_1)
L3_1.description = L4_1
L3_1.developer = "LB Scripts"
L5_1 = L1_1
L4_1 = L1_1.find
L6_1 = "http"
L4_1 = L4_1(L5_1, L6_1)
L4_1 = L1_1 or L4_1
if not L4_1 or not L1_1 then
  L4_1 = "https://cfx-nui-"
  L5_1 = L0_1
  L6_1 = "/"
  L7_1 = L1_1
  L4_1 = L4_1 .. L5_1 .. L6_1 .. L7_1
end
L3_1.ui = L4_1
L4_1 = L2_1
L5_1 = "/"
L6_1 = Config
L6_1 = L6_1.Icon
L4_1 = L4_1 .. L5_1 .. L6_1
L3_1.icon = L4_1
L3_1.fixBlur = true
function L4_1()
  local L0_2, L1_2
  L0_2 = GetInvokingResource
  L0_2 = L0_2()
  if "lb-phone" == L0_2 then
    CURRENT_DEVICE = "phone"
  elseif "lb-tablet" == L0_2 then
    CURRENT_DEVICE = "tablet"
  end
end
L3_1.onOpen = L4_1
function L4_1()
  local L0_2, L1_2
  CURRENT_DEVICE = nil
end
L3_1.onClose = L4_1
L4_1 = {}
L5_1 = {}
L6_1 = 1
L7_1 = Config
L7_1 = L7_1.Screenshots
L7_1 = L7_1.Phone
L7_1 = #L7_1
L8_1 = 1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = #L4_1
  L10_1 = L10_1 + 1
  L11_1 = L2_1
  L12_1 = "/"
  L13_1 = Config
  L13_1 = L13_1.Screenshots
  L13_1 = L13_1.Phone
  L13_1 = L13_1[L9_1]
  L11_1 = L11_1 .. L12_1 .. L13_1
  L4_1[L10_1] = L11_1
end
L6_1 = 1
L7_1 = Config
L7_1 = L7_1.Screenshots
L7_1 = L7_1.Tablet
L7_1 = #L7_1
L8_1 = 1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = #L4_1
  L10_1 = L10_1 + 1
  L11_1 = L2_1
  L12_1 = "/"
  L13_1 = Config
  L13_1 = L13_1.Screenshots
  L13_1 = L13_1.Tablet
  L13_1 = L13_1[L9_1]
  L11_1 = L11_1 .. L12_1 .. L13_1
  L4_1[L10_1] = L11_1
end
function L6_1()
  local L0_2, L1_2, L2_2
  L0_2 = Wait
  L1_2 = 500
  L0_2(L1_2)
  L0_2 = GetResourceState
  L1_2 = "lb-phone"
  L0_2 = L0_2(L1_2)
  if "started" == L0_2 then
    L0_2 = Config
    L0_2 = L0_2.LBPhone
    if L0_2 then
      L0_2 = L4_1
      L3_1.images = L0_2
      L0_2 = exports
      L0_2 = L0_2["lb-phone"]
      L1_2 = L0_2
      L0_2 = L0_2.AddCustomApp
      L2_2 = L3_1
      L0_2(L1_2, L2_2)
    end
  end
  L0_2 = GetResourceState
  L1_2 = "lb-tablet"
  L0_2 = L0_2(L1_2)
  if "started" == L0_2 then
    L0_2 = Config
    L0_2 = L0_2.LBTablet
    if L0_2 then
      L0_2 = L5_1
      L3_1.images = L0_2
      L0_2 = exports
      L0_2 = L0_2["lb-tablet"]
      L1_2 = L0_2
      L0_2 = L0_2.AddCustomApp
      L2_2 = L3_1
      L0_2(L1_2, L2_2)
    end
  end
end
L7_1 = AddEventHandler
L8_1 = "onResourceStart"
function L9_1(A0_2)
  local L1_2
  if "lb-phone" == A0_2 then
    L1_2 = Config
    L1_2 = L1_2.LBPhone
    if L1_2 then
      goto lbl_13
    end
  end
  if "lb-tablet" == A0_2 then
    L1_2 = Config
    L1_2 = L1_2.LBTablet
    ::lbl_13::
    if L1_2 then
      L1_2 = L6_1
      L1_2()
    end
  end
end
L7_1(L8_1, L9_1)
L7_1 = Citizen
L7_1 = L7_1.CreateThreadNow
function L8_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.LBPhone
  if L0_2 then
    L0_2 = GetResourceState
    L1_2 = "lb-phone"
    L0_2 = L0_2(L1_2)
    if "missing" ~= L0_2 then
      goto lbl_11
    end
  end
  do return end
  ::lbl_11::
  while true do
    L0_2 = GetResourceState
    L1_2 = "lb-phone"
    L0_2 = L0_2(L1_2)
    if "started" == L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 500
    L0_2(L1_2)
  end
  L0_2 = L6_1
  L0_2()
end
L7_1(L8_1)
L7_1 = Citizen
L7_1 = L7_1.CreateThreadNow
function L8_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.LBTablet
  if L0_2 then
    L0_2 = GetResourceState
    L1_2 = "lb-tablet"
    L0_2 = L0_2(L1_2)
    if "missing" ~= L0_2 then
      goto lbl_11
    end
  end
  do return end
  ::lbl_11::
  while true do
    L0_2 = GetResourceState
    L1_2 = "lb-tablet"
    L0_2 = L0_2(L1_2)
    if "started" == L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 500
    L0_2(L1_2)
  end
  L0_2 = L6_1
  L0_2()
end
L7_1(L8_1)
