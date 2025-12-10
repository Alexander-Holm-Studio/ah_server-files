local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:removeFriend"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = debugprint
  L2_2 = "removeFriend"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = SendReactMessage
  L2_2 = "removeFriend"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:acceptFriend"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2.location
  if L1_2 then
    L1_2 = FormatLocation
    L2_2 = A0_2.location
    L1_2 = L1_2(L2_2)
  end
  A0_2.location = L1_2
  L1_2 = debugprint
  L2_2 = "acceptFriend"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = SendReactMessage
  L2_2 = "acceptFriend"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:newFriendRequest"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = debugprint
  L2_2 = "newFriendRequest"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = SendReactMessage
  L2_2 = "newFriendRequest"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:toggleSavePost"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = debugprint
  L3_2 = "toggleSavePost"
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = SendReactMessage
  L3_2 = "toggleSave"
  L4_2 = {}
  L4_2.id = A0_2
  L4_2.state = A1_2
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:postsOpened"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = debugprint
  L2_2 = "postsOpened"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = SendReactMessage
  L2_2 = "viewedPosts"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:openedLastPost"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = debugprint
  L2_2 = "openedLastPost"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = SendReactMessage
  L2_2 = "openedLastPost"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:newMessage"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = debugprint
  L2_2 = "newMessage"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = SendReactMessage
  L2_2 = "newMessage"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:newPost"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = debugprint
  L2_2 = "newPost"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = type
  L2_2 = A0_2.metadata
  L1_2 = L1_2(L2_2)
  if "string" == L1_2 then
    L1_2 = json
    L1_2 = L1_2.decode
    L2_2 = A0_2.metadata
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_17
    end
  end
  L1_2 = A0_2.metadata
  ::lbl_17::
  A0_2.metadata = L1_2
  L1_2 = SendReactMessage
  L2_2 = "newPost"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:newStory"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = debugprint
  L4_2 = "newStory"
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = SendReactMessage
  L4_2 = "newStory"
  L5_2 = {}
  L5_2.username = A0_2
  L5_2.id = A1_2
  L5_2.link = A2_2
  L3_2(L4_2, L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:passwordChanged"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = exports
  L1_2 = L1_2["lb-phone"]
  L2_2 = L1_2
  L1_2 = L1_2.GetEquippedPhoneNumber
  L1_2 = L1_2(L2_2)
  if L1_2 == A0_2 then
    L1_2 = debugprint
    L2_2 = "passwordChanged, not logging out as number matches"
    L3_2 = A0_2
    return L1_2(L2_2, L3_2)
  end
  L1_2 = SendReactMessage
  L2_2 = "logout"
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:accountDeleted"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "accountDeleted"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:toggleTyping"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendReactMessage
  L3_2 = "toggleTyping"
  L4_2 = {}
  L4_2.username = A0_2
  L4_2.toggle = A1_2
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:toggleInChat"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendReactMessage
  L3_2 = "toggleInChat"
  L4_2 = {}
  L4_2.username = A0_2
  L4_2.toggle = A1_2
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:updateLocation"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = debugprint
  L3_2 = "updateLocation"
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = SendReactMessage
  L3_2 = "updateLocation"
  L4_2 = {}
  L4_2.username = A0_2
  L5_2 = FormatLocation
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  L4_2.location = L5_2
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:removeLocation"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = debugprint
  L2_2 = "removeLocation"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = SendReactMessage
  L2_2 = "removeLocation"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "lb-picchat:updateLocations"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = debugprint
  L2_2 = "updateLocations"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = 1
  L2_2 = #A0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = A0_2[L4_2]
    L6_2 = FormatLocation
    L7_2 = A0_2[L4_2]
    L7_2 = L7_2.location
    L6_2 = L6_2(L7_2)
    L5_2.location = L6_2
  end
  L1_2 = SendReactMessage
  L2_2 = "updateLocations"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)