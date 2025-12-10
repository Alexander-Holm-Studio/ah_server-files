local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L0_1.success = "^2[SUCCESS]"
L0_1.info = "^5[INFO]"
L0_1.warning = "^3[WARNING]"
L0_1.error = "^1[ERROR]"
function L1_1(A0_2, A1_2, ...)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L2_2 = "^5[INFO]^7:"
  end
  L3_2 = print
  L4_2 = "^3[LB Lookup App] "
  L5_2 = L2_2
  L6_2 = "^7: "
  L7_2 = A1_2
  L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2
  L5_2, L6_2, L7_2 = ...
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
infoprint = L1_1
function L1_1(...)
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = Config
  L0_2 = L0_2.Debug
  if L0_2 then
    L0_2 = {}
    L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = ...
    L0_2[1] = L1_2
    L0_2[2] = L2_2
    L0_2[3] = L3_2
    L0_2[4] = L4_2
    L0_2[5] = L5_2
    L0_2[6] = L6_2
    L0_2[7] = L7_2
    L0_2[8] = L8_2
    L0_2[9] = L9_2
    L1_2 = ""
    L2_2 = 1
    L3_2 = #L0_2
    L4_2 = 1
    for L5_2 = L2_2, L3_2, L4_2 do
      L6_2 = type
      L7_2 = L0_2[L5_2]
      L6_2 = L6_2(L7_2)
      if "table" == L6_2 then
        L6_2 = L1_2
        L7_2 = json
        L7_2 = L7_2.encode
        L8_2 = L0_2[L5_2]
        L9_2 = {}
        L9_2.indent = true
        L7_2 = L7_2(L8_2, L9_2)
        L6_2 = L6_2 .. L7_2
        L1_2 = L6_2
      else
        L6_2 = type
        L7_2 = L0_2[L5_2]
        L6_2 = L6_2(L7_2)
        if "string" ~= L6_2 then
          L6_2 = L1_2
          L7_2 = tostring
          L8_2 = L0_2[L5_2]
          L7_2 = L7_2(L8_2)
          L6_2 = L6_2 .. L7_2
          L1_2 = L6_2
        else
          L6_2 = L1_2
          L7_2 = L0_2[L5_2]
          L6_2 = L6_2 .. L7_2
          L1_2 = L6_2
        end
      end
      L6_2 = #L0_2
      if L5_2 ~= L6_2 then
        L6_2 = L1_2
        L7_2 = " "
        L6_2 = L6_2 .. L7_2
        L1_2 = L6_2
      end
    end
    L2_2 = print
    L3_2 = "^6[LB Lookup App] ^3[Debug]^7: "
    L4_2 = L1_2
    L3_2 = L3_2 .. L4_2
    L2_2(L3_2)
  end
end
debugprint = L1_1
L1_1 = Config
L1_1 = L1_1.Framework
if "auto" == L1_1 then
  L1_1 = GetResourceState
  L2_1 = "es_extended"
  L1_1 = L1_1(L2_1)
  if "started" == L1_1 then
    L1_1 = Config
    L1_1.Framework = "esx"
  else
    L1_1 = GetResourceState
    L2_1 = "qb-core"
    L1_1 = L1_1(L2_1)
    if "started" == L1_1 then
      L1_1 = Config
      L1_1.Framework = "qb"
    else
      L1_1 = infoprint
      L2_1 = "error"
      L3_1 = "Could not detect framework. Please set Config.Framework in config.lua"
      L1_1(L2_1, L3_1)
    end
  end
end
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = string
  L1_2 = L1_2.match
  L3_2 = A0_2
  L2_2 = A0_2.gsub
  L4_2 = "%s+"
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = "^[0-9]+$"
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = nil ~= L1_2
  return L1_2
end
IsOnlyNumbers = L1_1
