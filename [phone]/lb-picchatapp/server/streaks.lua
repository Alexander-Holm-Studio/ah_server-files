local L0_1, L1_1
L0_1 = MySQL
L0_1 = L0_1.ready
L0_1 = L0_1.await
L0_1()
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = debugprint
  L3_2 = "update streak"
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = MySQL
  L2_2 = L2_2.update
  L2_2 = L2_2.await
  L3_2 = "UPDATE lbpicchat_friends SET last_streak_sender = ? WHERE ((username = ? AND friend = ?) OR (username = ? AND friend = ?)) AND (last_streak_sender != ? OR last_streak_sender IS NULL)"
  L4_2 = {}
  L5_2 = A0_2
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A1_2
  L9_2 = A0_2
  L10_2 = A0_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L4_2[5] = L9_2
  L4_2[6] = L10_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = L2_2 > 0
  if not L2_2 then
    return
  end
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = [[
        UPDATE
            lbpicchat_friends
        SET
            interaction_streak = interaction_streak + 1
        WHERE
            ((username = ? AND friend = ?) OR (username = ? AND friend = ?))
            AND DATEDIFF(CURRENT_TIMESTAMP, last_streak_time) > 0
    ]]
  L5_2 = {}
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A1_2
  L9_2 = A0_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L3_2(L4_2, L5_2)
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "UPDATE lbpicchat_friends SET last_streak_time = CURRENT_TIMESTAMP WHERE ((username = ? AND friend = ?) OR (username = ? AND friend = ?))"
  L5_2 = {}
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A1_2
  L9_2 = A0_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L3_2(L4_2, L5_2)
end
UpdateStreak = L0_1