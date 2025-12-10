local L0_1, L1_1, L2_1, L3_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = Config
  L1_2 = L1_2.VisibleInformation
  if L1_2 then
    L1_2 = L1_2.PhoneNumber
  end
  if not L1_2 then
    return
  end
  L1_2 = 1
  L2_2 = #A0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = A0_2[L4_2]
    L6_2 = exports
    L6_2 = L6_2["lb-phone"]
    L7_2 = L6_2
    L6_2 = L6_2.GetEquippedPhoneNumber
    L8_2 = A0_2[L4_2]
    L8_2 = L8_2.identifier
    L6_2 = L6_2(L7_2, L8_2)
    L5_2.number = L6_2
  end
end
L1_1 = RegisterCallback
L2_1 = "lookupapp:search"
function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L4_2 = type
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if "string" == L4_2 then
    L4_2 = type
    L5_2 = A3_2
    L4_2 = L4_2(L5_2)
    if "number" == L4_2 then
      goto lbl_14
    end
  end
  L4_2 = {}
  do return L4_2 end
  ::lbl_14::
  if "person" == A2_2 then
    L4_2 = SearchPeople
    L5_2 = A1_2
    L6_2 = A3_2
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = L0_1
    L6_2 = L4_2
    L5_2(L6_2)
    L5_2 = {}
    L5_2.data = L4_2
    L6_2 = GetTotalUserCount
    L6_2 = 0 == A3_2 and L6_2
    L5_2.count = L6_2
    return L5_2
  elseif "vehicle" == A2_2 then
    L4_2 = SearchVehicles
    L5_2 = A1_2
    L6_2 = A3_2
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = L0_1
    L6_2 = L4_2
    L5_2(L6_2)
    L5_2 = {}
    L5_2.data = L4_2
    L6_2 = GetTotalVehicleCount
    L6_2 = 0 == A3_2 and L6_2
    L5_2.count = L6_2
    return L5_2
  end
  L4_2 = {}
  return L4_2
end
L1_1(L2_1, L3_1)
