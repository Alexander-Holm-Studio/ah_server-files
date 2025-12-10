local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = Config
if L0_1 then
  L0_1 = Config
  L0_1 = L0_1.Lovense
  if L0_1 then
    goto lbl_10
  end
end
do return end
::lbl_10::
L0_1 = {}
L1_1 = "TOKEN"
L2_1 = "KEY"
L3_1 = "IV"
L4_1 = "API_URL"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L1_1 = ipairs
L2_1 = L0_1
L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1)
for L5_1, L6_1 in L1_1, L2_1, L3_1, L4_1 do
  L7_1 = Config
  L7_1 = L7_1.Lovense
  L7_1 = L7_1[L6_1]
  if L7_1 then
    L7_1 = Config
    L7_1 = L7_1.Lovense
    L7_1 = L7_1[L6_1]
    if "" ~= L7_1 then
      goto lbl_32
    end
  end
  do return end
  ::lbl_32::
end
function L1_1(...)
  local L0_2, L1_2, L2_2
  L0_2 = Config
  L0_2 = L0_2.Debug
  if L0_2 then
    L0_2 = print
    L1_2 = "Lovense Shit"
    L2_2 = ...
    L0_2(L1_2, L2_2)
  end
end
L2_1 = {}
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  L1_2 = ""
  L2_2 = 1
  L3_2 = 8
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = math
    L6_2 = L6_2.random
    L7_2 = 1
    L8_2 = #L0_2
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = L1_2
    L8_2 = string
    L8_2 = L8_2.sub
    L9_2 = L0_2
    L10_2 = L6_2
    L11_2 = L6_2
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L7_2 = L7_2 .. L8_2
    L1_2 = L7_2
  end
  return L1_2
end
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = L3_1
  L2_2 = L2_2()
  L3_2 = os
  L3_2 = L3_2.time
  L3_2 = L3_2()
  L4_2 = L3_2 + 300
  L5_2 = string
  L5_2 = L5_2.format
  L6_2 = "%s_%s_%s"
  L8_2 = A0_2
  L7_2 = A0_2.sub
  L9_2 = 1
  L10_2 = 8
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = L2_2
  L9_2 = L3_2
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L6_2 = L2_1
  L7_2 = {}
  L7_2.playerId = A0_2
  L7_2.playerName = A1_2
  L7_2.timestamp = L3_2
  L7_2.expiry = L4_2
  L7_2.lastActivity = L3_2
  L6_2[L2_2] = L7_2
  L6_2 = {}
  L7_2 = Config
  L7_2 = L7_2.Lovense
  L7_2 = L7_2.TOKEN
  L6_2.token = L7_2
  L7_2 = Config
  L7_2 = L7_2.Lovense
  L7_2 = L7_2.KEY
  L6_2.key = L7_2
  L7_2 = Config
  L7_2 = L7_2.Lovense
  L7_2 = L7_2.IV
  L6_2.iv = L7_2
  L6_2.player = A0_2
  L6_2.playerName = A1_2
  L6_2.sessionId = L2_2
  L6_2.uniqueId = L5_2
  L6_2.timestamp = L3_2
  L6_2.expiry = L4_2
  return L6_2
end
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = os
  L0_2 = L0_2.time
  L0_2 = L0_2()
  L1_2 = {}
  L2_2 = pairs
  L3_2 = L2_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.expiry
    if L0_2 > L8_2 then
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = L1_2
      L10_2 = L6_2
      L8_2(L9_2, L10_2)
    end
  end
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L2_1
    L8_2[L7_2] = nil
    L8_2 = L1_1
    L9_2 = string
    L9_2 = L9_2.format
    L10_2 = "Cleaned up expired session: %s"
    L11_2 = L7_2
    L9_2, L10_2, L11_2 = L9_2(L10_2, L11_2)
    L8_2(L9_2, L10_2, L11_2)
  end
end
L6_1 = RegisterNetEvent
L7_1 = "lovense:getConfig"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "lovense:getConfig"
function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = source
  L1_2 = GetPlayerIdentifier
  L2_2 = L0_2
  L3_2 = 0
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = GetPlayerName
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  if not L1_2 then
    return
  end
  L3_2 = L4_1
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = TriggerClientEvent
  L5_2 = "lovense:receiveConfig"
  L6_2 = L0_2
  L7_2 = {}
  L7_2.success = true
  L8_2 = {}
  L9_2 = Config
  L9_2 = L9_2.Lovense
  L9_2 = L9_2.API_URL
  L8_2.apiUrl = L9_2
  L9_2 = Config
  L9_2 = L9_2.Lovense
  L9_2 = L9_2.DEFAULT_PLAYER_NAME
  L8_2.defaultPlayerName = L9_2
  L8_2.qrData = L3_2
  L9_2 = Config
  L9_2 = L9_2.Debug
  L8_2.debug = L9_2
  L7_2.config = L8_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L1_1
  L5_2 = string
  L5_2 = L5_2.format
  L6_2 = "Unique config sent to player %s (%s) with session %s"
  L7_2 = L2_2 or L7_2
  if not L2_2 then
    L7_2 = "Unknown"
  end
  L8_2 = L1_2
  L9_2 = L3_2.sessionId
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "lovense:logCommand"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "lovense:logCommand"
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = source
  L2_2 = GetPlayerIdentifier
  L3_2 = L1_2
  L4_2 = 0
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = GetPlayerName
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L4_2 = A0_2.type
  if "vibrate" == L4_2 then
    L4_2 = L1_1
    L5_2 = string
    L5_2 = L5_2.format
    L6_2 = "Player %s (%s) vibrated toy at level %d for %d seconds"
    L7_2 = L3_2 or L7_2
    if not L3_2 then
      L7_2 = "Unknown"
    end
    L8_2 = L2_2 or L8_2
    if not L2_2 then
      L8_2 = "Unknown"
    end
    L9_2 = A0_2.level
    if not L9_2 then
      L9_2 = 0
    end
    L10_2 = A0_2.duration
    if not L10_2 then
      L10_2 = 0
    end
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  else
    L4_2 = A0_2.type
    if "preset" == L4_2 then
      L4_2 = L1_1
      L5_2 = string
      L5_2 = L5_2.format
      L6_2 = "Player %s (%s) sent preset %s for %d seconds"
      L7_2 = L3_2 or L7_2
      if not L3_2 then
        L7_2 = "Unknown"
      end
      L8_2 = L2_2 or L8_2
      if not L2_2 then
        L8_2 = "Unknown"
      end
      L9_2 = A0_2.preset
      if not L9_2 then
        L9_2 = "unknown"
      end
      L10_2 = A0_2.duration
      if not L10_2 then
        L10_2 = 0
      end
      L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    end
  end
end
L6_1(L7_1, L8_1)
L6_1 = AddEventHandler
L7_1 = "playerDropped"
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = GetPlayerIdentifier
  L2_2 = source
  L3_2 = 0
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = GetPlayerName
  L3_2 = source
  L2_2 = L2_2(L3_2)
  if L1_2 then
    L3_2 = pairs
    L4_2 = L2_1
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L8_2.playerId
      if L9_2 == L1_2 then
        L9_2 = L2_1
        L9_2[L7_2] = nil
        L9_2 = L1_1
        L10_2 = string
        L10_2 = L10_2.format
        L11_2 = "Cleaned up session %s for disconnected player %s"
        L12_2 = L7_2
        L13_2 = L2_2
        L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2, L13_2)
        L9_2(L10_2, L11_2, L12_2, L13_2)
      end
    end
    L3_2 = L1_1
    L4_2 = string
    L4_2 = L4_2.format
    L5_2 = "Player %s (%s) disconnected: %s"
    L6_2 = L2_2 or L6_2
    if not L2_2 then
      L6_2 = "Unknown"
    end
    L7_2 = L1_2
    L8_2 = A0_2 or L8_2
    if not A0_2 then
      L8_2 = "Unknown reason"
    end
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
end
L6_1(L7_1, L8_1)
L6_1 = CreateThread
function L7_1()
  local L0_2, L1_2
  while true do
    L0_2 = Wait
    L1_2 = 60000
    L0_2(L1_2)
    L0_2 = L5_1
    L0_2()
  end
end
L6_1(L7_1)
L6_1 = RegisterNetEvent
L7_1 = "lovense:inviteUser"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "lovense:inviteUser"
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = source
  if not A0_2 then
    return
  end
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = GetPlayerName
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = "Player"
  end
  L4_2 = GetPlayerPed
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if 0 ~= L4_2 then
    L4_2 = exports
    L4_2 = L4_2["lb-phone"]
    L5_2 = L4_2
    L4_2 = L4_2.SendNotification
    L6_2 = L2_2
    L7_2 = {}
    L7_2.app = "Lovense"
    L7_2.title = "Lovense Invite"
    L8_2 = L3_2
    L9_2 = " invited you to connect their Lovense controls"
    L8_2 = L8_2 .. L9_2
    L7_2.content = L8_2
    L4_2(L5_2, L6_2, L7_2)
  end
end
L6_1(L7_1, L8_1)
