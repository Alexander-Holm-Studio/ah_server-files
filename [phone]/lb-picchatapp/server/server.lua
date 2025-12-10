local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = {}
L1_1 = {}
L2_1 = {}
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = BaseCallback
  L4_2 = A0_2
  function L5_2(A0_3, A1_3, ...)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L2_3 = L1_1
    L2_3 = L2_3[A1_3]
    if not L2_3 then
      L3_3 = debugprint
      L4_3 = "^1%s^7: no account found for %s | %s"
      L5_3 = L4_3
      L4_3 = L4_3.format
      L6_3 = A0_2
      L7_3 = GetPlayerName
      L8_3 = A0_3
      L7_3 = L7_3(L8_3)
      L8_3 = A0_3
      L4_3, L5_3, L6_3, L7_3, L8_3 = L4_3(L5_3, L6_3, L7_3, L8_3)
      L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)
      L3_3 = A2_2
      return L3_3
    end
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A1_3
    L6_3 = L2_3
    L7_3, L8_3 = ...
    return L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)
  end
  L6_2 = A2_2
  L3_2(L4_2, L5_2, L6_2)
end
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = pairs
  L3_2 = L1_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if L7_2 == A0_2 then
      L8_2 = #L1_2
      L8_2 = L8_2 + 1
      L9_2 = {}
      L9_2.phoneNumber = L6_2
      L10_2 = exports
      L10_2 = L10_2["lb-phone"]
      L11_2 = L10_2
      L10_2 = L10_2.GetSourceFromNumber
      L12_2 = L6_2
      L10_2 = L10_2(L11_2, L12_2)
      L9_2.source = L10_2
      L1_2[L8_2] = L9_2
    end
  end
  return L1_2
end
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  L3_2 = L2_2
  if L3_2 then
    L3_2 = L3_2.settings
  end
  if L3_2 then
    L3_2 = L3_2.showLocation
  end
  if not L3_2 then
    return
  end
  L3_2 = GetEntityCoords
  L4_2 = GetPlayerPed
  L5_2 = L2_2.source
  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L4_2 = os
  L4_2 = L4_2.time
  L4_2 = L4_2()
  L4_2 = L4_2 * 1000
  L2_2.lastSeen = L4_2
  L4_2 = {}
  L5_2 = L3_2.x
  L4_2.x = L5_2
  L5_2 = L3_2.y
  L4_2.y = L5_2
  L2_2.location = L4_2
  if not A1_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "lb-picchat:updateLocation"
    L6_2 = -1
    L7_2 = A0_2
    L8_2 = L2_2.location
    L4_2(L5_2, L6_2, L7_2, L8_2)
  end
  L4_2 = L2_2.location
  return L4_2
end
UpdateLocation = L5_1
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "SELECT phone_number FROM lbpicchat_logged_in WHERE username = ?"
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  A1_2.app = "lb-picchat"
  L3_2 = 1
  L4_2 = #L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L2_2[L6_2]
    L7_2 = L7_2.phone_number
    L8_2 = exports
    L8_2 = L8_2["lb-phone"]
    L9_2 = L8_2
    L8_2 = L8_2.SendNotification
    L10_2 = L7_2
    L11_2 = A1_2
    L8_2(L9_2, L10_2, L11_2)
  end
end
function L6_1(A0_2, A1_2, ...)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = L4_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = #L2_2
  if 0 == L3_2 then
    L3_2 = debugprint
    L4_2 = "TriggerClientEventOnUser: No users logged in"
    L3_2(L4_2)
    return
  end
  L3_2 = msgpack
  L3_2 = L3_2.pack_args
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = ...
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L4_2 = #L3_2
  L5_2 = 1
  L6_2 = #L2_2
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = L2_2[L8_2]
    L9_2 = L9_2.source
    if L9_2 then
      L10_2 = pcall
      L11_2 = TriggerClientEventInternal
      L12_2 = A1_2
      L13_2 = tostring
      L14_2 = L9_2
      L13_2 = L13_2(L14_2)
      L14_2 = L3_2
      L15_2 = L4_2
      L10_2, L11_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
      if not L10_2 then
        L12_2 = debugprint
        L13_2 = "TriggerClientEventOnUser failed, event:"
        L14_2 = A1_2
        L15_2 = "error:"
        L16_2 = L11_2
        L12_2(L13_2, L14_2, L15_2, L16_2)
      end
    end
  end
end
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = [[
        SELECT
            f.username,
            f.friend,
            a.display_name AS `name`,
            a.avatar,
            a.points,
            a.location_x,
            a.location_y,
            a.settings,
            a.last_seen,
            s.link AS story_preview,
            v.viewer AS story_viewed,
            f.status,
            f.last_interaction_type,
            f.last_interaction_sender,
            f.last_interaction_opened,
            f.last_interaction_time,
            f.interaction_streak AS streaks,
            f.last_streak_time,
            f.last_streak_sender,
            f.points AS friendPoints,
            f.best_friend_username,
            f.best_friend_friend,
            f.friend_nickname,
            f.username_nickname,
            f.created_at AS `timestamp`

        FROM
            lbpicchat_friends f

        LEFT JOIN
            lbpicchat_accounts a ON a.username = (
                CASE
                    WHEN f.username = ? THEN f.friend
                    ELSE f.username
                END
            )

        LEFT JOIN
            lbpicchat_stories s ON s.id = a.story_id

        LEFT JOIN
            lbpicchat_stories_views v ON v.story_id = s.id AND v.viewer = ?

        WHERE
            f.username = ? OR f.friend = ?
    ]]
  L3_2 = {}
  L4_2 = A0_2
  L5_2 = A0_2
  L6_2 = A0_2
  L7_2 = A0_2
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L1_2[L5_2]
    L7_2 = L6_2.username
    if L7_2 == A0_2 then
      L7_2 = L6_2.friend
      if L7_2 then
        goto lbl_25
      end
    end
    L7_2 = L6_2.username
    ::lbl_25::
    L8_2 = L0_1
    L8_2 = L8_2[L7_2]
    if L8_2 then
      L9_2 = L8_2.settings
      if L9_2 then
        goto lbl_39
      end
    end
    L9_2 = L6_2.settings
    if L9_2 then
      L9_2 = json
      L9_2 = L9_2.decode
      L10_2 = L6_2.settings
      L9_2 = L9_2(L10_2)
    end
    ::lbl_39::
    L10_2 = L6_2.last_interaction_type
    if L10_2 then
      L10_2 = {}
      L11_2 = L6_2.last_interaction_type
      L10_2.type = L11_2
      L11_2 = L6_2.last_interaction_sender
      L10_2.sender = L11_2
      L11_2 = L6_2.last_interaction_opened
      L10_2.opened = L11_2
      L11_2 = L6_2.last_interaction_time
      L10_2.timestamp = L11_2
      L6_2.lastInteraction = L10_2
    end
    L10_2 = L6_2.last_streak_time
    if L10_2 then
      L10_2 = L6_2.streaks
      if L10_2 > 0 then
        L10_2 = {}
        L11_2 = L6_2.last_streak_time
        L10_2.time = L11_2
        L11_2 = L6_2.last_streak_sender
        L10_2.sender = L11_2
        L6_2.lastStreak = L10_2
      end
    end
    L10_2 = L6_2.story_preview
    if L10_2 then
      L10_2 = L6_2.story_preview
      L6_2.story = L10_2
      L6_2.story_preview = nil
    end
    L10_2 = L6_2.story_viewed
    if L10_2 then
      L10_2 = L6_2.story_viewed
      L10_2 = nil ~= L10_2
      L6_2.storyViewed = L10_2
      L6_2.story_viewed = nil
    end
    L10_2 = L6_2.username
    if L10_2 == A0_2 then
      L10_2 = L6_2.best_friend_username
      L6_2.bestFriend = L10_2
      L10_2 = L6_2.friend_nickname
      if not L10_2 then
        L10_2 = L6_2.name
      end
      L6_2.name = L10_2
    else
      L10_2 = L6_2.best_friend_friend
      L6_2.bestFriend = L10_2
      L10_2 = L6_2.username_nickname
      if not L10_2 then
        L10_2 = L6_2.name
      end
      L6_2.name = L10_2
    end
    L10_2 = L9_2
    if L10_2 then
      L10_2 = L10_2.showLocation
    end
    if L10_2 then
      if L8_2 then
        L10_2 = L9_2.liveUpdateLocation
        if L10_2 then
          L10_2 = UpdateLocation
          L11_2 = L7_2
          L10_2(L11_2)
        end
        L10_2 = L8_2.location
        L6_2.location = L10_2
      else
        L10_2 = L6_2.location_x
        if L10_2 then
          L10_2 = L6_2.location_y
          if L10_2 then
            L10_2 = {}
            L11_2 = L6_2.location_x
            L10_2.x = L11_2
            L11_2 = L6_2.location_y
            L10_2.y = L11_2
            L6_2.location = L10_2
          end
        end
      end
    end
    L10_2 = L8_2
    if L10_2 then
      L10_2 = L10_2.lastSeen
    end
    if not L10_2 then
      L10_2 = L6_2.last_seen
    end
    L6_2.lastSeen = L10_2
    L6_2.best_friend_username = nil
    L6_2.best_friend_friend = nil
    L6_2.last_seen = nil
    L6_2.settings = nil
    L6_2.location_x = nil
    L6_2.location_y = nil
    L6_2.last_interaction_type = nil
    L6_2.last_interaction_sender = nil
    L6_2.last_interaction_opened = nil
    L6_2.last_interaction_time = nil
  end
  return L1_2
end
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = pairs
  L2_2 = L1_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    if L6_2 == A0_2 then
      return
    end
  end
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  L2_2 = L1_2.settings
  if L2_2 then
    L2_2 = json
    L2_2 = L2_2.encode
    L3_2 = L1_2.settings
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_23
    end
  end
  L2_2 = nil
  ::lbl_23::
  L3_2 = L1_2.location
  if L3_2 then
    L3_2 = {}
    L4_2 = math
    L4_2 = L4_2.floor
    L5_2 = L1_2.location
    L5_2 = L5_2.x
    L5_2 = L5_2 + 0.5
    L4_2 = L4_2(L5_2)
    L3_2.x = L4_2
    L4_2 = math
    L4_2 = L4_2.floor
    L5_2 = L1_2.location
    L5_2 = L5_2.y
    L5_2 = L5_2 + 0.5
    L4_2 = L4_2(L5_2)
    L3_2.y = L4_2
    if L3_2 then
      goto lbl_48
    end
  end
  L3_2 = {}
  ::lbl_48::
  L4_2 = MySQL
  L4_2 = L4_2.update
  L5_2 = "UPDATE lbpicchat_accounts SET display_name = ?, settings = ?, location_x = ?, location_y = ?, last_seen = CURRENT_TIMESTAMP WHERE username = ?"
  L6_2 = {}
  L7_2 = L1_2.name
  L8_2 = L2_2
  L9_2 = L3_2.x
  L10_2 = L3_2.y
  L11_2 = A0_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L6_2[5] = L11_2
  L4_2(L5_2, L6_2)
  L4_2 = L0_1
  L4_2[A0_2] = nil
  L4_2 = debugprint
  L5_2 = "Removed account from cache"
  L6_2 = A0_2
  L4_2(L5_2, L6_2)
  L4_2 = StopTrackingLocation
  if L4_2 then
    L4_2 = StopTrackingLocation
    L5_2 = A0_2
    L4_2(L5_2)
  end
end
function L9_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = MySQL
  L3_2 = L3_2.single
  L3_2 = L3_2.await
  L4_2 = [[
        SELECT
            a.username,
            a.phone_number,
            a.display_name,
            a.avatar,
            a.points,
            a.location,
            a.notifications,
            a.settings,
            a.last_seen,
            s.link AS story

        FROM
            lbpicchat_accounts a

        LEFT JOIN
            lbpicchat_stories s ON s.id = a.story_id

        WHERE
            a.username = ?
    ]]
  L5_2 = {}
  L6_2 = A1_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    return
  end
  L4_2 = {}
  L5_2 = L3_2.username
  L4_2.username = L5_2
  L5_2 = L3_2.phone_number
  L4_2.phoneNumber = L5_2
  L5_2 = L3_2.display_name
  L4_2.name = L5_2
  L5_2 = L3_2.points
  L4_2.points = L5_2
  L5_2 = L3_2.avatar
  L4_2.avatar = L5_2
  L5_2 = L3_2.notifications
  L4_2.notifications = L5_2
  L5_2 = L3_2.settings
  if L5_2 then
    L5_2 = json
    L5_2 = L5_2.decode
    L6_2 = L3_2.settings
    L5_2 = L5_2(L6_2)
  end
  L4_2.settings = L5_2
  L4_2.source = A0_2
  L5_2 = L3_2.last_seen
  L4_2.lastSeen = L5_2
  L5_2 = L3_2.story
  L4_2.story = L5_2
  L5_2 = L1_1
  L6_2 = L3_2.username
  L5_2[A2_2] = L6_2
  L6_2 = L3_2.username
  L5_2 = L0_1
  L5_2[L6_2] = L4_2
  L5_2 = StartTrackingLocation
  if L5_2 then
    L5_2 = L4_2.settings
    if L5_2 then
      L5_2 = L5_2.showLocation
    end
    if L5_2 then
      L5_2 = L4_2.settings
      L5_2 = L5_2.liveUpdateLocation
      if L5_2 then
        L5_2 = StartTrackingLocation
        L6_2 = A1_2
        L7_2 = A0_2
        L8_2 = A2_2
        L5_2(L6_2, L7_2, L8_2)
      end
    end
  end
  L5_2 = UpdateLocation
  L6_2 = A1_2
  L5_2(L6_2)
  L5_2 = L3_2
  L6_2 = L4_2
  return L5_2, L6_2
end
L10_1 = BaseCallback
L11_1 = "getLoggedIn"
function L12_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L1_1
  L2_2 = L2_2[A1_2]
  if L2_2 then
    L3_2 = L0_1
    L3_2 = L3_2[L2_2]
    L4_2 = UpdateLocation
    L5_2 = L2_2
    L4_2(L5_2)
    L4_2 = {}
    L4_2.account = L3_2
    L5_2 = L3_2.notifications
    L4_2.notificationCount = L5_2
    L5_2 = L7_1
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    L4_2.friends = L5_2
    return L4_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.scalar
  L3_2 = L3_2.await
  L4_2 = "SELECT username FROM lbpicchat_logged_in WHERE phone_number = ?"
  L5_2 = {}
  L6_2 = A1_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L2_2 = L3_2
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = L9_1
  L4_2 = A0_2
  L5_2 = L2_2
  L6_2 = A1_2
  L3_2, L4_2 = L3_2(L4_2, L5_2, L6_2)
  if not L3_2 or not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = {}
  L5_2.account = L4_2
  L6_2 = L3_2.notifications
  L5_2.notificationCount = L6_2
  L6_2 = L7_1
  L7_2 = L3_2.username
  L6_2 = L6_2(L7_2)
  L5_2.friends = L6_2
  return L5_2
end
L10_1(L11_1, L12_1)
L10_1 = BaseCallback
L11_1 = "createAccount"
function L12_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = A2_2.name
  L4_2 = A2_2.password
  L5_2 = A2_2.username
  L6_2 = L5_2
  L5_2 = L5_2.lower
  L5_2 = L5_2(L6_2)
  L6_2 = L1_1
  L6_2 = L6_2[A1_2]
  if L6_2 then
    L7_2 = L1_1
    L7_2[A1_2] = nil
    L7_2 = L8_1
    L8_2 = L6_2
    L7_2(L8_2)
  end
  if not (L3_2 and L4_2) or not L5_2 then
    if L4_2 then
      L7_2 = string
      L7_2 = L7_2.rep
      L8_2 = "*"
      L9_2 = #L4_2
      L7_2 = L7_2(L8_2, L9_2)
      if L7_2 then
        goto lbl_31
        L4_2 = L7_2 or L4_2
      end
    end
    L4_2 = nil
    ::lbl_31::
    L7_2 = debugprint
    L8_2 = "Invalid data"
    L9_2 = A2_2
    L7_2(L8_2, L9_2)
    L7_2 = {}
    L7_2.success = false
    L7_2.error = "invalid_data"
    return L7_2
  end
  L7_2 = CheckIfUsernameIsValid
  L8_2 = L5_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = debugprint
    L8_2 = "Invalid username"
    L9_2 = L5_2
    L7_2(L8_2, L9_2)
    L7_2 = {}
    L7_2.success = false
    L7_2.error = "invalid_username"
    return L7_2
  end
  L7_2 = MySQL
  L7_2 = L7_2.scalar
  L7_2 = L7_2.await
  L8_2 = "SELECT 1 FROM lbpicchat_accounts WHERE username = ?"
  L9_2 = {}
  L10_2 = L5_2
  L9_2[1] = L10_2
  L7_2 = L7_2(L8_2, L9_2)
  L7_2 = nil ~= L7_2
  if L7_2 then
    L8_2 = {}
    L8_2.success = false
    L8_2.error = "username_taken"
    return L8_2
  end
  L8_2 = MySQL
  L8_2 = L8_2.update
  L8_2 = L8_2.await
  L9_2 = "INSERT INTO lbpicchat_accounts (username, password, phone_number, display_name) VALUES (?, ?, ?, ?)"
  L10_2 = {}
  L11_2 = L5_2
  L12_2 = GetPasswordHash
  L13_2 = L4_2
  L12_2 = L12_2(L13_2)
  L13_2 = A1_2
  L14_2 = L3_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L8_2 = L8_2(L9_2, L10_2)
  L8_2 = L8_2 > 0
  if not L8_2 then
    L9_2 = {}
    L9_2.success = false
    L9_2.error = "unknown"
    return L9_2
  end
  L9_2 = Log
  L10_2 = A0_2
  L11_2 = "info"
  L12_2 = L
  L13_2 = "LOGS.CREATED_ACCOUNT"
  L12_2 = L12_2(L13_2)
  L13_2 = {}
  L13_2.phoneNumber = A1_2
  L13_2.username = L5_2
  L13_2.name = L3_2
  L9_2(L10_2, L11_2, L12_2, L13_2)
  L9_2 = L9_1
  L10_2 = A0_2
  L11_2 = L5_2
  L12_2 = A1_2
  L9_2(L10_2, L11_2, L12_2)
  L9_2 = MySQL
  L9_2 = L9_2.update
  L9_2 = L9_2.await
  L10_2 = "INSERT INTO lbpicchat_logged_in (phone_number, username) VALUES (?, ?)"
  L11_2 = {}
  L12_2 = A1_2
  L13_2 = L5_2
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L9_2(L10_2, L11_2)
  L9_2 = {}
  L9_2.success = true
  return L9_2
end
L10_1(L11_1, L12_1)
L10_1 = BaseCallback
L11_1 = "login"
function L12_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = "SELECT password FROM lbpicchat_accounts WHERE username = ?"
  L6_2 = {}
  L7_2 = A2_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = debugprint
    L6_2 = "Account not found"
    L7_2 = A2_2
    L5_2(L6_2, L7_2)
    L5_2 = {}
    L5_2.error = "invalid_username"
    return L5_2
  end
  L5_2 = VerifyPasswordHash
  L6_2 = A3_2
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "Incorrect password"
    L7_2 = A2_2
    L5_2(L6_2, L7_2)
    L5_2 = {}
    L5_2.error = "wrong_password"
    return L5_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.update
  L6_2 = "INSERT INTO lbpicchat_logged_in (phone_number, username) VALUES (?, ?) ON DUPLICATE KEY UPDATE username = VALUES(username)"
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L5_2(L6_2, L7_2)
  L5_2 = L1_1
  L5_2 = L5_2[A1_2]
  if L5_2 then
    L6_2 = L1_1
    L6_2[A1_2] = nil
    L6_2 = L8_1
    L7_2 = L5_2
    L6_2(L7_2)
  end
  L6_2 = L9_1
  L7_2 = A0_2
  L8_2 = A2_2
  L9_2 = A1_2
  L6_2, L7_2 = L6_2(L7_2, L8_2, L9_2)
  if not L6_2 or not L7_2 then
    L8_2 = false
    return L8_2
  end
  L8_2 = {}
  L8_2.account = L7_2
  L9_2 = L6_2.notifications
  L8_2.notificationCount = L9_2
  L9_2 = L7_1
  L10_2 = L6_2.username
  L9_2 = L9_2(L10_2)
  L8_2.friends = L9_2
  return L8_2
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "logout"
function L12_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM lbpicchat_logged_in WHERE phone_number = ?"
  L5_2 = {}
  L6_2 = A1_2
  L5_2[1] = L6_2
  L3_2(L4_2, L5_2)
  L3_2 = L1_1
  L3_2[A1_2] = nil
  L3_2 = L8_1
  L4_2 = A2_2
  L3_2(L4_2)
  L3_2 = true
  return L3_2
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "saveSettings"
function L12_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = L0_1
  L4_2 = L4_2[A2_2]
  L4_2.settings = A3_2
  if A3_2 then
    L5_2 = A3_2.showLocation
    if L5_2 then
      L5_2 = UpdateLocation
      L6_2 = A2_2
      L5_2(L6_2)
    else
      L4_2.location = nil
      L5_2 = TriggerClientEvent
      L6_2 = "lb-picchat:removeLocation"
      L7_2 = -1
      L8_2 = A2_2
      L5_2(L6_2, L7_2, L8_2)
    end
    L5_2 = MySQL
    L5_2 = L5_2.update
    L6_2 = "UPDATE lbpicchat_accounts SET settings = ? WHERE username = ?"
    L7_2 = {}
    L8_2 = json
    L8_2 = L8_2.encode
    L9_2 = A3_2
    L8_2 = L8_2(L9_2)
    L9_2 = A2_2
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L5_2(L6_2, L7_2)
    L5_2 = A3_2
    if L5_2 then
      L5_2 = L5_2.showLocation
    end
    if L5_2 then
      L5_2 = A3_2.liveUpdateLocation
      if L5_2 then
        L5_2 = StartTrackingLocation
        if L5_2 then
          L5_2 = StartTrackingLocation
          L6_2 = A2_2
          L7_2 = A0_2
          L8_2 = A1_2
          L5_2(L6_2, L7_2, L8_2)
        end
    end
    else
      L5_2 = StopTrackingLocation
      if L5_2 then
        L5_2 = StopTrackingLocation
        L6_2 = A2_2
        L5_2(L6_2)
      end
    end
  else
    L5_2 = StopTrackingLocation
    if L5_2 then
      L5_2 = StopTrackingLocation
      L6_2 = A2_2
      L5_2(L6_2)
    end
  end
  L5_2 = true
  return L5_2
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "setName"
function L12_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2
  L4_2 = L0_1
  L4_2 = L4_2[A2_2]
  L4_2.name = A3_2
  L4_2 = true
  return L4_2
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "setAvatar"
function L12_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = L0_1
  L4_2 = L4_2[A2_2]
  L4_2.avatar = A3_2
  L4_2 = MySQL
  L4_2 = L4_2.update
  L5_2 = "UPDATE lbpicchat_accounts SET avatar = ? WHERE username = ?"
  L6_2 = {}
  L7_2 = A3_2
  L8_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2(L5_2, L6_2)
  L4_2 = true
  return L4_2
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "deleteAccount"
function L12_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = Config
  L4_2 = L4_2.DeleteAccount
  if not L4_2 then
    L4_2 = debugprint
    L5_2 = "Delete account is disabled"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = "SELECT password FROM lbpicchat_accounts WHERE username = ?"
  L6_2 = {}
  L7_2 = A2_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = debugprint
    L6_2 = "Account not found"
    L7_2 = A2_2
    L5_2(L6_2, L7_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = VerifyPasswordHash
  L6_2 = A3_2
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "Incorrect password"
    L7_2 = A2_2
    L5_2(L6_2, L7_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.update
  L5_2 = L5_2.await
  L6_2 = "DELETE FROM lbpicchat_accounts WHERE username = ?"
  L7_2 = {}
  L8_2 = A2_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  L5_2 = L5_2 > 0
  if L5_2 then
    L6_2 = TriggerClientEvent
    L7_2 = "lb-picchat:accountDeleted"
    L8_2 = -1
    L9_2 = A2_2
    L6_2(L7_2, L8_2, L9_2)
    L6_2 = pairs
    L7_2 = L1_1
    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
    for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
      if L11_2 == A2_2 then
        L12_2 = L1_1
        L12_2[L10_2] = nil
        L12_2 = debugprint
        L13_2 = "Removed from logged in due to account deletion"
        L14_2 = L10_2
        L15_2 = L11_2
        L12_2(L13_2, L14_2, L15_2)
      end
    end
    L6_2 = L0_1
    L6_2[A2_2] = nil
    L6_2 = Log
    L7_2 = A0_2
    L8_2 = "info"
    L9_2 = L
    L10_2 = "LOGS.DELETED_ACCOUNT"
    L9_2 = L9_2(L10_2)
    L10_2 = {}
    L10_2.phoneNumber = A1_2
    L10_2.username = A2_2
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = MySQL
    L6_2 = L6_2.update
    L6_2 = L6_2.await
    L7_2 = "DELETE FROM lbpicchat_logged_in WHERE username = ? AND phone_number != ?"
    L8_2 = {}
    L9_2 = A2_2
    L10_2 = A1_2
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L6_2(L7_2, L8_2)
  end
  return L5_2
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "changePassword"
function L12_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L5_2 = Config
  L5_2 = L5_2.ChangePassword
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "Change password is disabled"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  if A3_2 == A4_2 then
    L5_2 = debugprint
    L6_2 = "Old and new password are the same"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.scalar
  L5_2 = L5_2.await
  L6_2 = "SELECT password FROM lbpicchat_accounts WHERE username = ?"
  L7_2 = {}
  L8_2 = A2_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L6_2 = debugprint
    L7_2 = "Account not found"
    L8_2 = A2_2
    L6_2(L7_2, L8_2)
    L6_2 = false
    return L6_2
  end
  L6_2 = VerifyPasswordHash
  L7_2 = A3_2
  L8_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2)
  if not L6_2 then
    L6_2 = debugprint
    L7_2 = "Incorrect password"
    L8_2 = A2_2
    L6_2(L7_2, L8_2)
    L6_2 = false
    return L6_2
  end
  L6_2 = MySQL
  L6_2 = L6_2.update
  L6_2 = L6_2.await
  L7_2 = "UPDATE lbpicchat_accounts SET password = ? WHERE username = ?"
  L8_2 = {}
  L9_2 = GetPasswordHash
  L10_2 = A4_2
  L9_2 = L9_2(L10_2)
  L10_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L6_2 = L6_2(L7_2, L8_2)
  L6_2 = L6_2 > 0
  if L6_2 then
    L7_2 = L6_1
    L8_2 = A2_2
    L9_2 = "lb-picchat:passwordChanged"
    L10_2 = A1_2
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = pairs
    L8_2 = L1_1
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      if L12_2 == A2_2 and L11_2 ~= A1_2 then
        L13_2 = L1_1
        L13_2[L11_2] = nil
        L13_2 = debugprint
        L14_2 = "Removed from logged in due to password change"
        L15_2 = L11_2
        L16_2 = L12_2
        L13_2(L14_2, L15_2, L16_2)
      end
    end
    L7_2 = MySQL
    L7_2 = L7_2.update
    L7_2 = L7_2.await
    L8_2 = "DELETE FROM lbpicchat_logged_in WHERE username = ? AND phone_number != ?"
    L9_2 = {}
    L10_2 = A2_2
    L11_2 = A1_2
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L7_2(L8_2, L9_2)
    L7_2 = Log
    L8_2 = A0_2
    L9_2 = "info"
    L10_2 = L
    L11_2 = "LOGS.CHANGED_PASSWORD"
    L10_2 = L10_2(L11_2)
    L11_2 = {}
    L11_2.phoneNumber = A1_2
    L11_2.username = A2_2
    L7_2(L8_2, L9_2, L10_2, L11_2)
  end
  return L6_2
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "searchUsers"
function L12_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if not A4_2 then
    A4_2 = 0
  end
  if A3_2 then
    L5_2 = #A3_2
    if not (L5_2 <= 2) then
      goto lbl_15
    end
  end
  L5_2 = debugprint
  L6_2 = "Too short search"
  L5_2(L6_2)
  L5_2 = {}
  do return L5_2 end
  ::lbl_15::
  L5_2 = "%"
  L6_2 = A3_2
  L7_2 = "%"
  L5_2 = L5_2 .. L6_2 .. L7_2
  A3_2 = L5_2
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = [[
        SELECT
            a.username,
            a.display_name AS `name`,
            a.avatar

        FROM
            lbpicchat_accounts a

        LEFT JOIN lbpicchat_friends f
            ON (f.username = a.username AND f.friend = ?)
            OR (f.username = ? AND f.friend = a.username)

        WHERE
            (a.display_name LIKE ? OR a.username LIKE ?)
            AND f.username IS NULL
            AND a.username != ?

        LIMIT ?, ?
    ]]
  L7_2 = {}
  L8_2 = A2_2
  L9_2 = A2_2
  L10_2 = A3_2
  L11_2 = A3_2
  L12_2 = A2_2
  L13_2 = A4_2 * 50
  L14_2 = 50
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L7_2[5] = L12_2
  L7_2[6] = L13_2
  L7_2[7] = L14_2
  return L5_2(L6_2, L7_2)
end
L13_1 = {}
L10_1(L11_1, L12_1, L13_1)
L10_1 = L3_1
L11_1 = "getContacts"
function L12_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = [[
        SELECT
            a.username,
            a.display_name AS `name`,
            a.avatar

        FROM phone_phone_contacts c

        JOIN lbpicchat_logged_in l
            ON l.phone_number = c.contact_phone_number

        JOIN lbpicchat_accounts a
            ON l.username = a.username

        LEFT JOIN lbpicchat_friends f
            ON (f.username = a.username AND f.friend = ?) OR (f.username = ? AND f.friend = a.username)

        WHERE
            c.phone_number = ? AND f.username IS NULL AND JSON_EXTRACT(a.settings, '$.showContact') != 'false'
    ]]
  L5_2 = {}
  L6_2 = A2_2
  L7_2 = A2_2
  L8_2 = A1_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  return L3_2(L4_2, L5_2)
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "addFriend"
function L12_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A3_2 == A2_2 then
    L4_2 = debugprint
    L5_2 = "Can't add yourself"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = "SELECT 1 FROM lbpicchat_friends WHERE (username = ? AND friend = ?) OR (username = ? AND friend = ?)"
  L6_2 = {}
  L7_2 = A2_2
  L8_2 = A3_2
  L9_2 = A3_2
  L10_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L4_2 = debugprint
    L5_2 = "Already friends/requested"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "INSERT IGNORE INTO lbpicchat_friends (username, friend) VALUES (?, ?)"
  L6_2 = {}
  L7_2 = A2_2
  L8_2 = A3_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 > 0
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = L0_1
  L5_2 = L5_2[A2_2]
  L6_2 = L6_1
  L7_2 = A3_2
  L8_2 = "lb-picchat:newFriendRequest"
  L9_2 = {}
  L9_2.username = A2_2
  L10_2 = L5_2.name
  L9_2.name = L10_2
  L10_2 = L5_2.avatar
  L9_2.avatar = L10_2
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = true
  return L6_2
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "acceptFriend"
function L12_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "UPDATE lbpicchat_friends SET status = 'accepted' WHERE username = ? AND friend = ? AND status = 'pending'"
  L6_2 = {}
  L7_2 = A3_2
  L8_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 > 0
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = L0_1
  L5_2 = L5_2[A2_2]
  L6_2 = L0_1
  L6_2 = L6_2[A3_2]
  L7_2 = L6_1
  L8_2 = A3_2
  L9_2 = "lb-picchat:acceptFriend"
  L10_2 = {}
  L10_2.username = A2_2
  L11_2 = L5_2.location
  L10_2.location = L11_2
  L11_2 = L5_2.story
  L10_2.story = L11_2
  L11_2 = L5_2
  if L11_2 then
    L11_2 = L11_2.lastSeen
  end
  if not L11_2 then
    L11_2 = os
    L11_2 = L11_2.time
    L11_2 = L11_2()
    L11_2 = L11_2 * 1000
  end
  L10_2.lastSeen = L11_2
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = {}
  L8_2 = L6_2
  if L8_2 then
    L8_2 = L8_2.story
  end
  L7_2.story = L8_2
  L8_2 = L6_2
  if L8_2 then
    L8_2 = L8_2.location
  end
  L7_2.location = L8_2
  L8_2 = L6_2
  if L8_2 then
    L8_2 = L8_2.lastSeen
  end
  if not L8_2 then
    L8_2 = MySQL
    L8_2 = L8_2.scalar
    L8_2 = L8_2.await
    L9_2 = "SELECT last_seen FROM lbpicchat_accounts WHERE username = ?"
    L10_2 = {}
    L11_2 = A3_2
    L10_2[1] = L11_2
    L8_2 = L8_2(L9_2, L10_2)
  end
  L7_2.lastSeen = L8_2
  return L7_2
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "removeFriend"
function L12_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "DELETE FROM lbpicchat_friends WHERE ((username = ? AND friend = ?) OR (username = ? AND friend = ?)) AND status != 'blocked'"
  L6_2 = {}
  L7_2 = A2_2
  L8_2 = A3_2
  L9_2 = A3_2
  L10_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 > 0
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.update
  L6_2 = "DELETE FROM lbpicchat_posts WHERE (sender = ? AND recipient = ?) OR (sender = ? AND recipient = ?)"
  L7_2 = {}
  L8_2 = A2_2
  L9_2 = A3_2
  L10_2 = A3_2
  L11_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L5_2(L6_2, L7_2)
  L5_2 = L6_1
  L6_2 = A3_2
  L7_2 = "lb-picchat:removeFriend"
  L8_2 = A2_2
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = true
  return L5_2
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "setFriendNickname"
function L12_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  L5_2 = MySQL
  L5_2 = L5_2.update
  L5_2 = L5_2.await
  L6_2 = [[
        UPDATE
            lbpicchat_friends
        SET
            friend_nickname = CASE WHEN username = @loggedInAs THEN @nickname ELSE friend_nickname END,
            username_nickname = CASE WHEN friend = @loggedInAs THEN @nickname ELSE username_nickname END
        WHERE
            (username = @loggedInAs AND friend = @friend)
            OR (username = @friend AND friend = @loggedInAs)
    ]]
  L7_2 = {}
  L7_2["@loggedInAs"] = A2_2
  L7_2["@friend"] = A3_2
  L7_2["@nickname"] = A4_2
  L5_2 = L5_2(L6_2, L7_2)
  L5_2 = L5_2 > 0
  return L5_2
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "toggleBestFriend"
function L12_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  A4_2 = true == A4_2
  L5_2 = MySQL
  L5_2 = L5_2.update
  L5_2 = L5_2.await
  L6_2 = [[
        UPDATE
            lbpicchat_friends
        SET
            best_friend_username = CASE WHEN username = @loggedInAs THEN @toggle ELSE best_friend_username END,
            best_friend_friend = CASE WHEN friend = @loggedInAs THEN @toggle ELSE best_friend_friend END
        WHERE
            (username = @loggedInAs AND friend = @friend)
            OR (username = @friend AND friend = @loggedInAs)
    ]]
  L7_2 = {}
  L7_2["@loggedInAs"] = A2_2
  L7_2["@friend"] = A3_2
  L7_2["@toggle"] = A4_2
  L5_2 = L5_2(L6_2, L7_2)
  L5_2 = L5_2 > 0
  return L5_2
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "getMessages"
function L12_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L5_2 = {}
  L6_2 = A2_2
  L7_2 = A3_2
  L8_2 = A3_2
  L9_2 = A2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L6_2 = ""
  if A4_2 then
    L6_2 = "AND id < ?"
    L7_2 = #L5_2
    L7_2 = L7_2 + 1
    L5_2[L7_2] = A4_2
  end
  L7_2 = [[
        SELECT
            id,
            sender,
            post_type,
            link,
            metadata,
            opened,
            saved,
            sent_at

        FROM
            lbpicchat_posts

        WHERE
            (sender = ? AND recipient = ?) OR (sender = ? AND recipient = ?) %s

        ORDER BY
            id DESC

        LIMIT 50
    ]]
  L8_2 = L7_2
  L7_2 = L7_2.format
  L9_2 = L6_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = L7_2
  L10_2 = L5_2
  return L8_2(L9_2, L10_2)
end
L10_1(L11_1, L12_1)
L10_1 = L3_1
L11_1 = "getSavedPosts"
function L12_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L5_2 = {}
  L6_2 = A2_2
  L7_2 = A3_2
  L8_2 = A3_2
  L9_2 = A2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L6_2 = ""
  if A4_2 then
    L6_2 = "AND id < ?"
    L7_2 = #L5_2
    L7_2 = L7_2 + 1
    L5_2[L7_2] = A4_2
  end
  L7_2 = #L5_2
  L7_2 = L7_2 + 1
  L8_2 = 50
  L5_2[L7_2] = L8_2
  L7_2 = [[
        SELECT
            id,
            post_type,
            sender,
            link,
            metadata,
            sent_at AS `timestamp`

        FROM
            lbpicchat_posts

        WHERE
            ((recipient = ? AND sender = ?) or (recipient = ? AND sender = ?)) AND saved = 1 %s

        ORDER BY
            id DESC

        LIMIT ?
    ]]
  L8_2 = L7_2
  L7_2 = L7_2.format
  L9_2 = L6_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = L7_2
  L10_2 = L5_2
  return L8_2(L9_2, L10_2)
end
L13_1 = {}
L10_1(L11_1, L12_1, L13_1)
L10_1 = L3_1
L11_1 = "getPosts"
function L12_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = [[
        SELECT
            id,
            link,
            metadata,
            sent_at

        FROM
            lbpicchat_posts

        WHERE
            sender = ? AND recipient = ? AND opened = 0 AND post_type = 'media'

        ORDER BY
            sent_at ASC
    ]]
  L6_2 = {}
  L7_2 = A3_2
  L8_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  return L4_2(L5_2, L6_2)
end
L13_1 = {}
L10_1(L11_1, L12_1, L13_1)
L10_1 = L3_1
L11_1 = "toggleSavePost"
function L12_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = MySQL
  L6_2 = L6_2.update
  L6_2 = L6_2.await
  L7_2 = "UPDATE lbpicchat_posts SET saved = ? WHERE (recipient = ? OR sender = ?) AND id = ?"
  L8_2 = {}
  L9_2 = true == A3_2
  L10_2 = A2_2
  L11_2 = A2_2
  L12_2 = A4_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L6_2 = L6_2(L7_2, L8_2)
  L6_2 = L6_2 > 0
  if not L6_2 then
    L7_2 = false
    return L7_2
  end
  L7_2 = L6_1
  L8_2 = A5_2
  L9_2 = "lb-picchat:toggleSavePost"
  L10_2 = A4_2
  L11_2 = A3_2
  L7_2(L8_2, L9_2, L10_2, L11_2)
  L7_2 = true
  return L7_2
end
L10_1(L11_1, L12_1)
function L10_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  A2_2 = true == A2_2
  A3_2 = true == A3_2
  if A2_2 then
    L4_2 = L2_1
    L4_2 = L4_2[A0_2]
    if not L4_2 then
      L4_2 = L2_1
      L5_2 = {}
      L5_2.username = A1_2
      L5_2.typing = A3_2
      L4_2[A0_2] = L5_2
  end
  elseif not A2_2 then
    L4_2 = L2_1
    L4_2[A0_2] = nil
  end
  L4_2 = L2_1
  L4_2 = L4_2[A0_2]
  if L4_2 then
    L5_2 = L4_2.username
    if L5_2 ~= A1_2 then
      L5_2 = L6_1
      L6_2 = L4_2.username
      L7_2 = "lb-picchat:toggleInChat"
      L8_2 = A0_2
      L9_2 = false
      L5_2(L6_2, L7_2, L8_2, L9_2)
      L5_2 = L4_2.typing
      if L5_2 then
        L5_2 = L6_1
        L6_2 = L4_2.username
        L7_2 = "lb-picchat:toggleTyping"
        L8_2 = A1_2
        L9_2 = false
        L5_2(L6_2, L7_2, L8_2, L9_2)
      end
      L4_2.username = A1_2
    end
  end
  if L4_2 then
    L4_2.typing = A3_2
  end
  L5_2 = L6_1
  L6_2 = A1_2
  L7_2 = "lb-picchat:toggleInChat"
  L8_2 = A0_2
  L9_2 = A2_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
  if nil ~= A3_2 then
    L5_2 = L6_1
    L6_2 = A1_2
    L7_2 = "lb-picchat:toggleTyping"
    L8_2 = A0_2
    L9_2 = A3_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = debugprint
  L6_2 = "inChat"
  L7_2 = L2_1
  L5_2(L6_2, L7_2)
  L5_2 = true
  return L5_2
end
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L2_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    return
  end
  L2_2 = L6_1
  L3_2 = L1_2.username
  L4_2 = "lb-picchat:toggleInChat"
  L5_2 = A0_2
  L6_2 = false
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = L1_2.typing
  if L2_2 then
    L2_2 = L6_1
    L3_2 = L1_2.username
    L4_2 = "lb-picchat:toggleTyping"
    L5_2 = A0_2
    L6_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
  L2_2 = L2_1
  L2_2[A0_2] = nil
end
L12_1 = L3_1
L13_1 = "toggleInChat"
function L14_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2
  L5_2 = L10_1
  L6_2 = A2_2
  L7_2 = A3_2
  L8_2 = A4_2
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = true
  return L5_2
end
L12_1(L13_1, L14_1)
L12_1 = L3_1
L13_1 = "toggleTyping"
function L14_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2
  L5_2 = L10_1
  L6_2 = A2_2
  L7_2 = A3_2
  L8_2 = true
  L9_2 = A4_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = true
  return L5_2
end
L12_1(L13_1, L14_1)
L12_1 = L3_1
L13_1 = "getChatStatus"
function L14_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L4_2 = L2_1
  L4_2 = L4_2[A3_2]
  if L4_2 then
    L5_2 = L4_2.username
    if L5_2 == A2_2 then
      L5_2 = {}
      L5_2.inChat = true
      L6_2 = L4_2.typing
      L5_2.typing = L6_2
      return L5_2
    end
  end
  L5_2 = false
  return L5_2
end
L12_1(L13_1, L14_1)
L12_1 = L3_1
L13_1 = "markPostsAsOpened"
function L14_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A3_2 then
    L5_2 = #A3_2
    if 0 ~= L5_2 and A4_2 then
      goto lbl_12
    end
  end
  L5_2 = debugprint
  L6_2 = "markPostsAsOpened: Invalid data"
  L5_2(L6_2)
  do return end
  ::lbl_12::
  L5_2 = MySQL
  L5_2 = L5_2.update
  L5_2 = L5_2.await
  L6_2 = "UPDATE lbpicchat_posts SET opened = 1, opened_at = CURRENT_TIMESTAMP WHERE recipient = ? AND opened = 0 AND id IN (?)"
  L7_2 = {}
  L8_2 = A2_2
  L9_2 = A3_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L5_2 > 0
  L7_2 = debugprint
  L8_2 = "markPostsAsOpened"
  L9_2 = L5_2
  L10_2 = L6_2
  L7_2(L8_2, L9_2, L10_2)
  if not L6_2 then
    L7_2 = false
    return L7_2
  end
  L7_2 = MySQL
  L7_2 = L7_2.scalar
  L7_2 = L7_2.await
  L8_2 = "SELECT MAX(id) FROM lbpicchat_posts WHERE (recipient = ? AND sender = ?) OR (recipient = ? AND sender = ?)"
  L9_2 = {}
  L10_2 = A2_2
  L11_2 = A4_2
  L12_2 = A4_2
  L13_2 = A2_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L7_2 = L7_2(L8_2, L9_2)
  if L7_2 then
    L8_2 = contains
    L9_2 = A3_2
    L10_2 = L7_2
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 then
      L8_2 = MySQL
      L8_2 = L8_2.update
      L9_2 = "UPDATE lbpicchat_friends SET last_interaction_opened = 1, last_interaction_time = CURRENT_TIMESTAMP WHERE (username = ? AND friend = ?) OR (username = ? AND friend = ?)"
      L10_2 = {}
      L11_2 = A2_2
      L12_2 = A4_2
      L13_2 = A4_2
      L14_2 = A2_2
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L10_2[4] = L14_2
      L8_2(L9_2, L10_2)
      L8_2 = L6_1
      L9_2 = A4_2
      L10_2 = "lb-picchat:openedLastPost"
      L11_2 = A2_2
      L8_2(L9_2, L10_2, L11_2)
    end
  end
  L8_2 = L6_1
  L9_2 = A4_2
  L10_2 = "lb-picchat:postsOpened"
  L11_2 = A3_2
  L8_2(L9_2, L10_2, L11_2)
  return L6_2
end
L12_1(L13_1, L14_1)
L12_1 = L3_1
L13_1 = "sendMessage"
function L14_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A5_2 then
    L6_2 = "<!ATTACHMENTS!>:"
    L7_2 = A5_2
    L6_2 = L6_2 .. L7_2
    A4_2 = L6_2
  end
  if A3_2 then
    L6_2 = type
    L7_2 = A3_2
    L6_2 = L6_2(L7_2)
    if "string" == L6_2 and A4_2 then
      L6_2 = type
      L7_2 = A4_2
      L6_2 = L6_2(L7_2)
      if "string" == L6_2 then
        L6_2 = #A3_2
        if 0 ~= L6_2 then
          L6_2 = #A4_2
          if 0 ~= L6_2 then
            goto lbl_29
          end
        end
      end
    end
  end
  L6_2 = false
  do return L6_2 end
  ::lbl_29::
  if A4_2 then
    L6_2 = exports
    L6_2 = L6_2["lb-phone"]
    L7_2 = L6_2
    L6_2 = L6_2.ContainsBlacklistedWord
    L8_2 = A0_2
    L9_2 = A4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    if L6_2 then
      L6_2 = Log
      L7_2 = A0_2
      L8_2 = "error"
      L9_2 = L
      L10_2 = "LOGS.MESSAGE_BLACKLISTED_WORD"
      L9_2 = L9_2(L10_2)
      L10_2 = {}
      L10_2.sender = A2_2
      L10_2.recipient = A3_2
      L10_2.message = A4_2
      L6_2(L7_2, L8_2, L9_2, L10_2)
      L6_2 = false
      return L6_2
    end
  end
  L6_2 = MySQL
  L6_2 = L6_2.insert
  L6_2 = L6_2.await
  L7_2 = "INSERT INTO lbpicchat_posts (sender, recipient, post_type, metadata) VALUES (?, ?, 'chat', ?)"
  L8_2 = {}
  L9_2 = A2_2
  L10_2 = A3_2
  L11_2 = A4_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L6_2 = L6_2(L7_2, L8_2)
  if not L6_2 then
    L7_2 = false
    return L7_2
  end
  L7_2 = MySQL
  L7_2 = L7_2.update
  L8_2 = "UPDATE lbpicchat_friends SET last_interaction_type = 'chat', last_interaction_sender = ?, last_interaction_opened = 0, last_interaction_time = CURRENT_TIMESTAMP WHERE (username = ? AND friend = ?) OR (username = ? AND friend = ?)"
  L9_2 = {}
  L10_2 = A2_2
  L11_2 = A2_2
  L12_2 = A3_2
  L13_2 = A3_2
  L14_2 = A2_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L9_2[5] = L14_2
  L7_2(L8_2, L9_2)
  L7_2 = L6_1
  L8_2 = A3_2
  L9_2 = "lb-picchat:newMessage"
  L10_2 = {}
  L10_2.id = L6_2
  L10_2.sender = A2_2
  L10_2.content = A4_2
  L10_2.attachments = A5_2
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = L0_1
  L7_2 = L7_2[A2_2]
  L8_2 = {}
  L9_2 = L7_2.name
  L8_2.name = L9_2
  L8_2.message = A4_2
  L9_2 = L5_1
  L10_2 = A3_2
  L11_2 = {}
  L12_2 = L
  L13_2 = "NOTIFICATIONS.MESSAGE.TITLE"
  L14_2 = L8_2
  L12_2 = L12_2(L13_2, L14_2)
  L11_2.title = L12_2
  L12_2 = L
  L13_2 = "NOTIFICATIONS.MESSAGE.CONTENT"
  L14_2 = L8_2
  L12_2 = L12_2(L13_2, L14_2)
  L11_2.content = L12_2
  L12_2 = L7_2.avatar
  L11_2.avatar = L12_2
  L9_2(L10_2, L11_2)
  L9_2 = Log
  L10_2 = A0_2
  L11_2 = "info"
  L12_2 = L
  L13_2 = "LOGS.SENT_MESSAGE"
  L12_2 = L12_2(L13_2)
  L13_2 = {}
  L13_2.sender = A2_2
  L13_2.recipient = A3_2
  L13_2.message = A4_2
  L13_2.attachments = A5_2
  L9_2(L10_2, L11_2, L12_2, L13_2)
  return L6_2
end
L12_1(L13_1, L14_1)
function L12_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = MySQL
  L4_2 = L4_2.insert
  L5_2 = "INSERT INTO lbpicchat_stories (username, link"
  if A3_2 then
    L6_2 = ", metadata"
    if L6_2 then
      goto lbl_10
    end
  end
  L6_2 = ""
  ::lbl_10::
  L7_2 = ") VALUES (?, ?"
  if A3_2 then
    L8_2 = ", ?"
    if L8_2 then
      goto lbl_17
    end
  end
  L8_2 = ""
  ::lbl_17::
  L9_2 = ")"
  L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2
  L6_2 = {}
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = A3_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    if not A0_3 then
      return
    end
    L2_3 = A1_2
    L1_3 = L0_1
    L1_3 = L1_3[L2_3]
    if L1_3 then
      L2_3 = A1_2
      L1_3 = L0_1
      L1_3 = L1_3[L2_3]
      L2_3 = A2_2
      L1_3.story = L2_3
    end
    L1_3 = MySQL
    L1_3 = L1_3.update
    L1_3 = L1_3.await
    L2_3 = "UPDATE lbpicchat_accounts SET story_id = ? WHERE username = ?"
    L3_3 = {}
    L4_3 = A0_3
    L5_3 = A1_2
    L3_3[1] = L4_3
    L3_3[2] = L5_3
    L1_3(L2_3, L3_3)
    L1_3 = TriggerClientEvent
    L2_3 = "lb-picchat:newStory"
    L3_3 = -1
    L4_3 = A1_2
    L5_3 = A0_3
    L6_3 = A2_2
    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
    L1_3 = Log
    L2_3 = A0_2
    L3_3 = "info"
    L4_3 = L
    L5_3 = "LOGS.ADDED_STORY"
    L4_3 = L4_3(L5_3)
    L5_3 = {}
    L6_3 = A1_2
    L5_3.username = L6_3
    L6_3 = A2_2
    L5_3.link = L6_3
    L6_3 = A3_2
    L5_3.metadata = L6_3
    L6_3 = A2_2
    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
  end
  L4_2(L5_2, L6_2, L7_2)
end
L13_1 = L3_1
L14_1 = "sendPost"
function L15_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  if A3_2 then
    L7_2 = type
    L8_2 = A3_2
    L7_2 = L7_2(L8_2)
    if "table" == L7_2 then
      L7_2 = #A3_2
      if 0 ~= L7_2 then
        goto lbl_16
      end
    end
  end
  L7_2 = debugprint
  L8_2 = "No recipients"
  L7_2(L8_2)
  L7_2 = false
  do return L7_2 end
  ::lbl_16::
  if A4_2 then
    L7_2 = type
    L8_2 = A4_2
    L7_2 = L7_2(L8_2)
    if "string" == L7_2 then
      goto lbl_28
    end
  end
  L7_2 = debugprint
  L8_2 = "No link"
  L7_2(L8_2)
  L7_2 = false
  do return L7_2 end
  ::lbl_28::
  if A6_2 then
    L7_2 = exports
    L7_2 = L7_2["lb-phone"]
    L8_2 = L7_2
    L7_2 = L7_2.ContainsBlacklistedWord
    L9_2 = A0_2
    L10_2 = A6_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    if L7_2 then
      L7_2 = Log
      L8_2 = A0_2
      L9_2 = "error"
      L10_2 = L
      L11_2 = "LOGS.POST_BLACKLISTED_WORD"
      L10_2 = L10_2(L11_2)
      L11_2 = {}
      L11_2.sender = A2_2
      L11_2.recipients = A3_2
      L11_2.link = A4_2
      L11_2.metadata = A6_2
      L7_2(L8_2, L9_2, L10_2, L11_2)
      L7_2 = false
      return L7_2
    end
  end
  L7_2 = false
  L8_2 = 1
  L9_2 = #A3_2
  L10_2 = 1
  for L11_2 = L8_2, L9_2, L10_2 do
    L12_2 = A3_2[L11_2]
    if L12_2 == A2_2 then
      L7_2 = true
      L13_2 = L12_1
      L14_2 = A0_2
      L15_2 = A2_2
      L16_2 = A4_2
      L17_2 = A6_2
      L13_2(L14_2, L15_2, L16_2, L17_2)
      L13_2 = table
      L13_2 = L13_2.remove
      L14_2 = A3_2
      L15_2 = L11_2
      L13_2(L14_2, L15_2)
      break
    end
  end
  L8_2 = #A3_2
  if L8_2 > 0 or L7_2 then
    L8_2 = #A3_2
    if L7_2 then
      L8_2 = L8_2 + 1
    end
    L9_2 = L0_1
    L9_2 = L9_2[A2_2]
    L10_2 = L9_2.points
    L10_2 = L10_2 + L8_2
    L9_2.points = L10_2
    L9_2 = MySQL
    L9_2 = L9_2.update
    L10_2 = "UPDATE lbpicchat_accounts SET points = points + ? WHERE username = ?"
    L11_2 = {}
    L12_2 = L8_2
    L13_2 = A2_2
    L11_2[1] = L12_2
    L11_2[2] = L13_2
    L9_2(L10_2, L11_2)
  end
  L8_2 = #A3_2
  if 0 == L8_2 then
    if L7_2 then
      L8_2 = true
      return L8_2
    end
    L8_2 = debugprint
    L9_2 = "No recipients"
    L8_2(L9_2)
    L8_2 = false
    return L8_2
  end
  L8_2 = "INSERT INTO lbpicchat_posts (sender, recipient, post_type, link "
  if A6_2 then
    L9_2 = ", metadata"
    if L9_2 then
      goto lbl_119
    end
  end
  L9_2 = ""
  ::lbl_119::
  L10_2 = ")"
  L11_2 = " VALUES (?, ?, 'media', ?"
  if A6_2 then
    L12_2 = ", ?"
    if L12_2 then
      goto lbl_127
    end
  end
  L12_2 = ""
  ::lbl_127::
  L13_2 = ")"
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
  L9_2 = "UPDATE lbpicchat_friends SET last_interaction_type = ?, last_interaction_sender = ?, last_interaction_opened = 0, last_interaction_time = CURRENT_TIMESTAMP, points = points + 1 WHERE (username = ? AND friend = ?) OR (username = ? AND friend = ?)"
  L10_2 = {}
  L11_2 = L0_1
  L11_2 = L11_2[A2_2]
  L12_2 = L
  L13_2 = "NOTIFICATIONS.SENT_MEDIA."
  if A5_2 then
    L14_2 = "video"
    if L14_2 then
      goto lbl_142
    end
  end
  L14_2 = "photo"
  ::lbl_142::
  L15_2 = L14_2
  L14_2 = L14_2.upper
  L14_2 = L14_2(L15_2)
  L13_2 = L13_2 .. L14_2
  L12_2 = L12_2(L13_2)
  L13_2 = {}
  L14_2 = L11_2.name
  L13_2.name = L14_2
  L13_2.mediaType = L12_2
  L14_2 = {}
  L15_2 = L
  L16_2 = "NOTIFICATIONS.SENT_MEDIA.TITLE"
  L17_2 = L13_2
  L15_2 = L15_2(L16_2, L17_2)
  L14_2.title = L15_2
  L15_2 = L
  L16_2 = "NOTIFICATIONS.SENT_MEDIA.CONTENT"
  L17_2 = L13_2
  L15_2 = L15_2(L16_2, L17_2)
  L14_2.content = L15_2
  L15_2 = L11_2.avatar
  L14_2.avatar = L15_2
  L15_2 = 1
  L16_2 = #A3_2
  L17_2 = 1
  for L18_2 = L15_2, L16_2, L17_2 do
    L19_2 = A3_2[L18_2]
    L20_2 = {}
    if A5_2 then
      L21_2 = "video"
      if L21_2 then
        goto lbl_178
      end
    end
    L21_2 = "image"
    ::lbl_178::
    L22_2 = A2_2
    L23_2 = A2_2
    L24_2 = L19_2
    L25_2 = L19_2
    L26_2 = A2_2
    L20_2[1] = L21_2
    L20_2[2] = L22_2
    L20_2[3] = L23_2
    L20_2[4] = L24_2
    L20_2[5] = L25_2
    L20_2[6] = L26_2
    L10_2[L18_2] = L20_2
    L20_2 = L5_1
    L21_2 = L19_2
    L22_2 = L14_2
    L20_2(L21_2, L22_2)
    L20_2 = MySQL
    L20_2 = L20_2.insert
    L21_2 = L8_2
    L22_2 = {}
    L23_2 = A2_2
    L24_2 = L19_2
    L25_2 = A4_2
    L26_2 = A6_2
    L22_2[1] = L23_2
    L22_2[2] = L24_2
    L22_2[3] = L25_2
    L22_2[4] = L26_2
    function L23_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3
      L1_3 = L6_1
      L2_3 = L19_2
      L3_3 = "lb-picchat:newPost"
      L4_3 = {}
      L4_3.id = A0_3
      L5_3 = A2_2
      L4_3.sender = L5_3
      L5_3 = A4_2
      L4_3.link = L5_3
      L5_3 = A6_2
      L4_3.metadata = L5_3
      L5_3 = A5_2
      L4_3.isVideo = L5_3
      L1_3(L2_3, L3_3, L4_3)
    end
    L20_2(L21_2, L22_2, L23_2)
    L20_2 = Citizen
    L20_2 = L20_2.CreateThreadNow
    function L21_2()
      local L0_3, L1_3, L2_3
      L0_3 = UpdateStreak
      L1_3 = A2_2
      L2_3 = L19_2
      L0_3(L1_3, L2_3)
    end
    L20_2(L21_2)
  end
  L15_2 = MySQL
  L15_2 = L15_2.update
  L16_2 = "UPDATE lbpicchat_accounts SET points = points + 1 WHERE username IN (?)"
  L17_2 = {}
  L18_2 = A3_2
  L17_2[1] = L18_2
  L15_2(L16_2, L17_2)
  L15_2 = MySQL
  L15_2 = L15_2.rawExecute
  L16_2 = L9_2
  L17_2 = L10_2
  L15_2(L16_2, L17_2)
  L15_2 = Log
  L16_2 = A0_2
  L17_2 = "info"
  L18_2 = L
  L19_2 = "LOGS.SENT_POST"
  L18_2 = L18_2(L19_2)
  L19_2 = {}
  L19_2.sender = A2_2
  L19_2.recipients = A3_2
  L19_2.link = A4_2
  L19_2.metadata = A6_2
  L20_2 = A4_2
  L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
  L15_2 = true
  return L15_2
end
L13_1(L14_1, L15_1)
L13_1 = L3_1
L14_1 = "removeStory"
function L15_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "DELETE FROM lbpicchat_stories WHERE id = ? AND username = ?"
  L6_2 = {}
  L7_2 = A3_2
  L8_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 > 0
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = L0_1
  L5_2 = L5_2[A2_2]
  L6_2 = MySQL
  L6_2 = L6_2.single
  L6_2 = L6_2.await
  L7_2 = "SELECT id, link FROM lbpicchat_stories WHERE username = ? ORDER BY id DESC LIMIT 1"
  L8_2 = {}
  L9_2 = A2_2
  L8_2[1] = L9_2
  L6_2 = L6_2(L7_2, L8_2)
  if not L6_2 then
    L5_2.story = nil
    L7_2 = MySQL
    L7_2 = L7_2.update
    L8_2 = "UPDATE lbpicchat_accounts SET story_id = NULL WHERE username = ?"
    L9_2 = {}
    L10_2 = A2_2
    L9_2[1] = L10_2
    L7_2(L8_2, L9_2)
  else
    L7_2 = L5_2.story
    L8_2 = L6_2.link
    if L7_2 ~= L8_2 then
      L7_2 = L6_2.link
      L5_2.story = L7_2
      L7_2 = MySQL
      L7_2 = L7_2.update
      L8_2 = "UPDATE lbpicchat_accounts SET story_id = ? WHERE username = ?"
      L9_2 = {}
      L10_2 = L6_2.id
      L11_2 = A2_2
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L7_2(L8_2, L9_2)
    end
  end
  L7_2 = true
  return L7_2
end
L13_1(L14_1, L15_1)
L13_1 = L3_1
L14_1 = "getStoryViewers"
function L15_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = [[
        SELECT
            v.viewer AS username,
            a.display_name AS `name`,
            a.avatar AS avatar,
            v.viewed_at AS `timestamp`

        FROM
            lbpicchat_stories_views v

        LEFT JOIN
            lbpicchat_accounts a
            ON a.username = v.viewer

        WHERE
            v.story_id = ?
    ]]
  L6_2 = {}
  L7_2 = A3_2
  L6_2[1] = L7_2
  return L4_2(L5_2, L6_2)
end
L13_1(L14_1, L15_1)
L13_1 = L3_1
L14_1 = "getStories"
function L15_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = [[
        SELECT
            s.id,
            s.link,
            s.metadata,
            s.posted_at,
            v.viewer
            %s

        FROM
            lbpicchat_stories s

        LEFT JOIN lbpicchat_stories_views v
            ON v.story_id = s.id AND v.viewer = ?

        WHERE
            s.username = ?
    ]]
  if A3_2 == A2_2 then
    L6_2 = L4_2
    L5_2 = L4_2.format
    L7_2 = ", (SELECT COUNT(1) FROM lbpicchat_stories_views WHERE story_id = s.id) AS views"
    L5_2 = L5_2(L6_2, L7_2)
    L4_2 = L5_2
  else
    L6_2 = L4_2
    L5_2 = L4_2.format
    L7_2 = ""
    L5_2 = L5_2(L6_2, L7_2)
    L4_2 = L5_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = L4_2
  L7_2 = {}
  L8_2 = A2_2
  L9_2 = A3_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = 1
  L7_2 = #L5_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = L5_2[L9_2]
    L11_2 = L10_2.viewer
    L11_2 = nil ~= L11_2
    L10_2.viewed = L11_2
    L10_2.viewer = nil
    L11_2 = L10_2.metadata
    if L11_2 then
      L11_2 = json
      L11_2 = L11_2.decode
      L12_2 = L10_2.metadata
      L11_2 = L11_2(L12_2)
      if L11_2 then
        goto lbl_45
      end
    end
    L11_2 = nil
    ::lbl_45::
    L10_2.metadata = L11_2
    L11_2 = L10_2.posted_at
    L10_2.timestamp = L11_2
    L10_2.posted_at = nil
  end
  return L5_2
end
L16_1 = {}
L13_1(L14_1, L15_1, L16_1)
L13_1 = L3_1
L14_1 = "markStoriesAsViewed"
function L15_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L5_2 = #A3_2
  if 0 == L5_2 then
    L5_2 = debugprint
    L6_2 = "No stories viewed, not marking them as viewed"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  if A4_2 == A2_2 then
    L5_2 = debugprint
    L6_2 = "Cannot view own story"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = {}
  L6_2 = "INSERT IGNORE INTO lbpicchat_stories_views (viewer, poster, story_id) VALUES (?, ?, ?)"
  L7_2 = 1
  L8_2 = #A3_2
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = {}
    L12_2 = A2_2
    L13_2 = A4_2
    L14_2 = A3_2[L10_2]
    L11_2[1] = L12_2
    L11_2[2] = L13_2
    L11_2[3] = L14_2
    L5_2[L10_2] = L11_2
  end
  L7_2 = MySQL
  L7_2 = L7_2.rawExecute
  L8_2 = L6_2
  L9_2 = L5_2
  L7_2(L8_2, L9_2)
  L7_2 = true
  return L7_2
end
L13_1(L14_1, L15_1)
L13_1 = AddEventHandler
L14_1 = "onResourceStop"
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 ~= L1_2 then
    return
  end
  L1_2 = {}
  L1_1 = L1_2
  L1_2 = pairs
  L2_2 = L0_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2 in L1_2, L2_2, L3_2, L4_2 do
    L6_2 = L8_1
    L7_2 = L5_2
    L6_2(L7_2)
  end
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNetEvent
L14_1 = "lb-picchat:openedApp"
function L15_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = source
  L1_2 = exports
  L1_2 = L1_2["lb-phone"]
  L2_2 = L1_2
  L1_2 = L1_2.GetEquippedPhoneNumber
  L3_2 = L0_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = L1_2 or L2_2
  if L1_2 then
    L2_2 = L1_1
    L2_2 = L2_2[L1_2]
  end
  L3_2 = L2_2 or L3_2
  if L2_2 then
    L3_2 = L0_1
    L3_2 = L3_2[L2_2]
  end
  if not L3_2 then
    return
  end
  L4_2 = StartTrackingLocation
  if L4_2 then
    L4_2 = L3_2.settings
    if L4_2 then
      L4_2 = L3_2.settings
      L4_2 = L4_2.showLocation
      if L4_2 then
        L4_2 = L3_2.settings
        L4_2 = L4_2.liveUpdateLocation
        if L4_2 then
          L4_2 = StartTrackingLocation
          L5_2 = L2_2
          L6_2 = L0_2
          L7_2 = L1_2
          L4_2(L5_2, L6_2, L7_2)
        end
      end
    end
  end
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNetEvent
L14_1 = "lb-picchat:closedApp"
function L15_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = source
  L1_2 = exports
  L1_2 = L1_2["lb-phone"]
  L2_2 = L1_2
  L1_2 = L1_2.GetEquippedPhoneNumber
  L3_2 = L0_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = L1_2 or L2_2
  if L1_2 then
    L2_2 = L1_1
    L2_2 = L2_2[L1_2]
  end
  if not L2_2 then
    return
  end
  L3_2 = L11_1
  L4_2 = L2_2
  L3_2(L4_2)
end
L13_1(L14_1, L15_1)
L13_1 = AddEventHandler
L14_1 = "playerDropped"
function L15_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = source
  L1_2 = exports
  L1_2 = L1_2["lb-phone"]
  L2_2 = L1_2
  L1_2 = L1_2.GetEquippedPhoneNumber
  L3_2 = L0_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = L1_2 or L2_2
  if L1_2 then
    L2_2 = L1_1
    L2_2 = L2_2[L1_2]
  end
  if not L2_2 then
    return
  end
  L3_2 = L1_1
  L3_2[L1_2] = nil
  L3_2 = L8_1
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = L11_1
  L4_2 = L2_2
  L3_2(L4_2)
end
L13_1(L14_1, L15_1)
L13_1 = PerformHttpRequest
L14_1 = "https://loaf-scripts.com/versions/"
function L15_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  if A1_2 then
    L3_2 = print
    L4_2 = A1_2
    L3_2(L4_2)
  end
end
L16_1 = "POST"
L17_1 = json
L17_1 = L17_1.encode
L18_1 = {}
L18_1.resource = "lb-picchat"
L19_1 = GetResourceMetadata
L20_1 = GetCurrentResourceName
L20_1 = L20_1()
L21_1 = "version"
L22_1 = 0
L19_1 = L19_1(L20_1, L21_1, L22_1)
if not L19_1 then
  L19_1 = "0.0.0"
end
L18_1.version = L19_1
L17_1 = L17_1(L18_1)
L18_1 = {}
L18_1["Content-Type"] = "application/json"
L13_1(L14_1, L15_1, L16_1, L17_1, L18_1)