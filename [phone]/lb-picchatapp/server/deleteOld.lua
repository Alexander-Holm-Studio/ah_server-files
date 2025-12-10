local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = MySQL
L0_1 = L0_1.ready
L0_1 = L0_1.await
L0_1()
L0_1 = math
L0_1 = L0_1.floor
L1_1 = 3600000
L0_1 = L0_1(L1_1)
while true do
  L1_1 = MySQL
  L1_1 = L1_1.update
  L1_1 = L1_1.await
  L2_1 = "DELETE FROM lbpicchat_posts WHERE opened = 1 AND saved = 0 AND opened_at < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY)"
  L1_1 = L1_1(L2_1)
  L2_1 = MySQL
  L2_1 = L2_1.update
  L2_1 = L2_1.await
  L3_1 = "DELETE FROM lbpicchat_stories WHERE posted_at < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY)"
  L2_1 = L2_1(L3_1)
  L3_1 = MySQL
  L3_1 = L3_1.update
  L3_1 = L3_1.await
  L4_1 = "UPDATE lbpicchat_accounts SET location_x = NULL, location_y = NULL WHERE location_x IS NOT NULL AND last_seen < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY)"
  L3_1 = L3_1(L4_1)
  L4_1 = MySQL
  L4_1 = L4_1.update
  L4_1 = L4_1.await
  L5_1 = "UPDATE lbpicchat_friends SET interaction_streak = 0 WHERE interaction_streak != 0 AND last_streak_time IS NOT NULL AND last_streak_time < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL ? HOUR)"
  L6_1 = {}
  L7_1 = 36
  L6_1[1] = L7_1
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = debugprint
  L6_1 = "Deleted %s old stories"
  L7_1 = L6_1
  L6_1 = L6_1.format
  L8_1 = L2_1
  L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = debugprint
  L6_1 = "Deleted %s old posts"
  L7_1 = L6_1
  L6_1 = L6_1.format
  L8_1 = L1_1
  L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = debugprint
  L6_1 = "Reset %s streaks"
  L7_1 = L6_1
  L6_1 = L6_1.format
  L8_1 = L4_1
  L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = debugprint
  L6_1 = "Reset %s locations"
  L7_1 = L6_1
  L6_1 = L6_1.format
  L8_1 = L3_1
  L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = Wait
  L6_1 = L0_1
  L5_1(L6_1)
end