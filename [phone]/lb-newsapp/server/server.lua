local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = MySQL
L0_1 = L0_1.ready
L0_1 = L0_1.await
L0_1()
L0_1 = {}
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = setmetatable
L5_1 = L0_1
L6_1 = {}
function L7_1(A0_2, A1_2)
  local L2_2
  L2_2 = L1_1
  L2_2 = L2_2[A1_2]
  return L2_2
end
L6_1.__index = L7_1
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = math
  L3_2 = L3_2.max
  L4_2 = A2_2
  L5_2 = 0
  L3_2 = L3_2(L4_2, L5_2)
  A2_2 = L3_2
  L3_2 = L1_1
  L3_2 = L3_2[A1_2]
  if L3_2 then
    L3_2 = MySQL
    L3_2 = L3_2.update
    L4_2 = "UPDATE lb_news_categories SET article_count = ? WHERE category = ?"
    L5_2 = {}
    L6_2 = A2_2
    L7_2 = A1_2
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L3_2(L4_2, L5_2)
  else
    L3_2 = debugprint
    L4_2 = "Creating category: "
    L5_2 = A1_2
    L6_2 = " with "
    L7_2 = tostring
    L8_2 = A2_2
    L7_2 = L7_2(L8_2)
    L8_2 = " articles"
    L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2
    L3_2(L4_2)
    L3_2 = MySQL
    L3_2 = L3_2.update
    L4_2 = "INSERT INTO lb_news_categories (category, article_count) VALUES (?, ?) ON DUPLICATE KEY UPDATE article_count = ?"
    L5_2 = {}
    L6_2 = A1_2
    L7_2 = A2_2
    L8_2 = A2_2
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L3_2(L4_2, L5_2)
  end
  L3_2 = L1_1
  L3_2[A1_2] = A2_2
end
L6_1.__newindex = L7_1
L4_1(L5_1, L6_1)
L4_1 = MySQL
L4_1 = L4_1.query
L5_1 = "SELECT category, article_count FROM lb_news_categories"
L6_1 = {}
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = 1
  L2_2 = #A0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = A0_2[L4_2]
    L7_2 = L5_2.category
    L6_2 = L1_1
    L8_2 = L5_2.article_count
    L6_2[L7_2] = L8_2
  end
end
L4_1(L5_1, L6_1, L7_1)
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT id, author, category, title, content, published_at, updated_at FROM lb_news_articles WHERE published = 1 ORDER BY updated_at DESC LIMIT 10"
  L0_2 = L0_2(L1_2)
  L1_2 = 1
  L2_2 = #L0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L0_2[L4_2]
    L7_2 = L5_2.author
    L6_2 = L2_1
    L6_2 = L6_2[L7_2]
    if not L6_2 then
      L6_2 = {}
      L6_2.display_name = "??"
    end
    L5_2.author = L6_2
  end
  L3_1 = L0_2
end
L5_1 = MySQL
L5_1 = L5_1.query
L6_1 = "SELECT id, avatar, display_name, email, phone_number FROM lb_news_profiles"
L7_1 = {}
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = 1
  L2_2 = #A0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = A0_2[L4_2]
    L7_2 = L5_2.id
    L6_2 = L2_1
    L6_2[L7_2] = L5_2
  end
  L1_2 = L4_1
  L1_2()
end
L5_1(L6_1, L7_1, L8_1)
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = table
  L1_2 = L1_2.insert
  L2_2 = L3_1
  L3_2 = 1
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L3_1
  L1_2 = #L1_2
  if L1_2 > 10 then
    L1_2 = table
    L1_2 = L1_2.remove
    L2_2 = L3_1
    L1_2(L2_2)
  end
end
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = 1
  L3_2 = L3_1
  L3_2 = #L3_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L3_1
    L6_2 = L6_2[L5_2]
    L6_2 = L6_2.id
    if L6_2 == A0_2 then
      L6_2 = L3_1
      L6_2[L5_2] = A1_2
      L6_2 = table
      L6_2 = L6_2.insert
      L7_2 = L3_1
      L8_2 = 1
      L9_2 = table
      L9_2 = L9_2.remove
      L10_2 = L3_1
      L11_2 = L5_2
      L9_2, L10_2, L11_2 = L9_2(L10_2, L11_2)
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
      L6_2 = true
      return L6_2
    end
  end
  L2_2 = false
  return L2_2
end
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = 1
  L1_2 = L3_1
  L1_2 = #L1_2
  L2_2 = 1
  for L3_2 = L0_2, L1_2, L2_2 do
    L4_2 = L3_1
    L4_2 = L4_2[L3_2]
    L5_2 = L4_2.author
    L5_2 = L5_2.id
    L6_2 = L2_1
    L6_2 = L6_2[L5_2]
    if not L6_2 then
      L6_2 = {}
      L6_2.display_name = "??"
    end
    L4_2.author = L6_2
  end
end
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = false
  L2_2 = 1
  L3_2 = L3_1
  L3_2 = #L3_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L3_1
    L6_2 = L6_2[L5_2]
    L6_2 = L6_2.id
    if L6_2 == A0_2 then
      L1_2 = true
    end
  end
  if not L1_2 then
    return
  end
  L2_2 = L4_1
  L2_2()
end
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = Config
  L1_2 = L1_2.Notifications
  if "all" ~= L1_2 then
    L1_2 = Config
    L1_2 = L1_2.Notifications
    if "online" ~= L1_2 then
      L1_2 = debugprint
      L2_2 = "Notifications are disabled"
      L1_2(L2_2)
      return
    end
  end
  L1_2 = A0_2.content
  L2_2 = A0_2.title
  L3_2 = nil
  L4_2 = 1
  L5_2 = #L1_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L1_2[L7_2]
    L8_2 = L8_2.type
    if "media" == L8_2 then
      L8_2 = 1
      L9_2 = L1_2[L7_2]
      L9_2 = L9_2.content
      L9_2 = #L9_2
      L10_2 = 1
      for L11_2 = L8_2, L9_2, L10_2 do
        L12_2 = L1_2[L7_2]
        L12_2 = L12_2.content
        L12_2 = L12_2[L11_2]
        L12_2 = L12_2.type
        if "image" == L12_2 then
          L12_2 = L1_2[L7_2]
          L12_2 = L12_2.content
          L12_2 = L12_2[L11_2]
          L3_2 = L12_2.src
          break
        end
      end
    end
  end
  L4_2 = Config
  L4_2 = L4_2.LBPhone
  if L4_2 then
    L4_2 = Config
    L4_2 = L4_2.NotifyPhone
    if L4_2 then
      L4_2 = GetResourceState
      L5_2 = "lb-phone"
      L4_2 = L4_2(L5_2)
      if "started" == L4_2 then
        L4_2 = exports
        L4_2 = L4_2["lb-phone"]
        L5_2 = L4_2
        L4_2 = L4_2.NotifyEveryone
        L6_2 = Config
        L6_2 = L6_2.Notifications
        L7_2 = {}
        L7_2.app = "lb-newsapp"
        L8_2 = L
        L9_2 = "PUBLISHED_NOTIFICATION.TITLE"
        L8_2 = L8_2(L9_2)
        L7_2.title = L8_2
        L8_2 = L
        L9_2 = "PUBLISHED_NOTIFICATION.DESCRIPTION"
        L10_2 = {}
        L10_2.title = L2_2
        L8_2 = L8_2(L9_2, L10_2)
        L7_2.content = L8_2
        L7_2.thumbnail = L3_2
        L4_2(L5_2, L6_2, L7_2)
      end
    end
  end
  L4_2 = Config
  L4_2 = L4_2.LBTablet
  if L4_2 then
    L4_2 = Config
    L4_2 = L4_2.NotifyTablet
    if L4_2 then
      L4_2 = GetResourceState
      L5_2 = "lb-tablet"
      L4_2 = L4_2(L5_2)
      if "started" == L4_2 then
        L4_2 = exports
        L4_2 = L4_2["lb-tablet"]
        L5_2 = L4_2
        L4_2 = L4_2.NotifyEveryone
        L6_2 = {}
        L6_2.app = "lb-newsapp"
        L7_2 = L
        L8_2 = "PUBLISHED_NOTIFICATION.TITLE"
        L7_2 = L7_2(L8_2)
        L6_2.title = L7_2
        L7_2 = L
        L8_2 = "PUBLISHED_NOTIFICATION.DESCRIPTION"
        L9_2 = {}
        L9_2.title = L2_2
        L7_2 = L7_2(L8_2, L9_2)
        L6_2.content = L7_2
        L6_2.thumbnail = L3_2
        L7_2 = Config
        L7_2 = L7_2.Notifications
        L7_2 = "all" == L7_2
        L4_2(L5_2, L6_2, L7_2)
      end
    end
  end
end
function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = GetIdentifier
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  if not A1_2 then
    L3_2 = nil
    L4_2 = nil
    L5_2 = pcall
    function L6_2()
      local L0_3, L1_3, L2_3
      L0_3 = exports
      L0_3 = L0_3["lb-phone"]
      L1_3 = L0_3
      L0_3 = L0_3.GetEquippedPhoneNumber
      L2_3 = A0_2
      L0_3 = L0_3(L1_3, L2_3)
      L3_2 = L0_3
      L0_3 = L3_2
      if L0_3 then
        L0_3 = exports
        L0_3 = L0_3["lb-phone"]
        L1_3 = L0_3
        L0_3 = L0_3.GetEmailAddress
        L2_3 = L3_2
        L0_3 = L0_3(L1_3, L2_3)
        if not L0_3 then
          L0_3 = nil
        end
        L4_2 = L0_3
      end
    end
    L5_2(L6_2)
    L5_2 = GetCharacterName
    L6_2 = A0_2
    L5_2, L6_2 = L5_2(L6_2)
    L7_2 = L5_2
    L8_2 = " "
    L9_2 = L6_2
    L7_2 = L7_2 .. L8_2 .. L9_2
    L8_2 = {}
    L8_2.display_name = L7_2
    L8_2.email = L4_2
    L8_2.phone_number = L3_2
    A1_2 = L8_2
  end
  A1_2.id = L2_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = [[
        INSERT INTO lb_news_profiles (id, display_name, email, phone_number) VALUES (@identifier, @displayName, @email, @phoneNumber)
        on duplicate key update display_name = @displayName, email = @email, phone_number = @phoneNumber, avatar = @avatar
    ]]
  L5_2 = {}
  L6_2 = A1_2.id
  L5_2["@identifier"] = L6_2
  L6_2 = A1_2.display_name
  L5_2["@displayName"] = L6_2
  L6_2 = A1_2.email
  L5_2["@email"] = L6_2
  L6_2 = A1_2.phone_number
  L5_2["@phoneNumber"] = L6_2
  L6_2 = A1_2.avatar
  L5_2["@avatar"] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L5_2 = A1_2.id
    L4_2 = L2_1
    L4_2[L5_2] = A1_2
  end
  L4_2 = L7_1
  L4_2()
  return L3_2
end
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L2_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = L2_1
    L1_2 = L1_2[A0_2]
    return L1_2
  end
  L1_2 = MySQL
  L1_2 = L1_2.single
  L1_2 = L1_2.await
  L2_2 = "SELECT avatar, display_name, email, phone_number FROM lb_news_profiles WHERE id = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L2_2 = L2_1
    L2_2[A0_2] = L1_2
  end
  return L1_2
end
function L12_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = BaseCallback
  L4_2 = A0_2
  function L5_2(A0_3, A1_3, ...)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L2_3 = HasPermission
    L3_3 = A0_3
    L4_3 = "create"
    L2_3 = L2_3(L3_3, L4_3)
    if not L2_3 then
      L2_3 = A2_2
      return L2_3
    end
    L2_3 = GetIdentifier
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    if not L2_3 then
      L3_3 = A2_2
      return L3_3
    end
    L3_3 = L2_1
    L3_3 = L3_3[L2_3]
    if not L3_3 then
      L3_3 = MySQL
      L3_3 = L3_3.single
      L3_3 = L3_3.await
      L4_3 = "SELECT avatar, display_name, email, phone_number FROM lb_news_profiles WHERE id = ?"
      L5_3 = {}
      L6_3 = L2_3
      L5_3[1] = L6_3
      L3_3 = L3_3(L4_3, L5_3)
      if L3_3 then
        L4_3 = L2_1
        L4_3[L2_3] = L3_3
      else
        L4_3 = L10_1
        L5_3 = A0_3
        L4_3 = L4_3(L5_3)
        if not L4_3 then
          L4_3 = A2_2
          return L4_3
        end
      end
    end
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A1_3
    L6_3 = L2_3
    L7_3 = ...
    return L3_3(L4_3, L5_3, L6_3, L7_3)
  end
  L6_2 = A2_2
  L3_2(L4_2, L5_2, L6_2)
end
L13_1 = L12_1
L14_1 = "getProfile"
function L15_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = L2_1
  L3_2 = L3_2[A2_2]
  L4_2 = {}
  L4_2.profile = L3_2
  L5_2 = MySQL
  L5_2 = L5_2.scalar
  L5_2 = L5_2.await
  L6_2 = "SELECT COUNT(1) FROM lb_news_articles WHERE author = ? AND published = 1"
  L7_2 = {}
  L8_2 = A2_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L5_2 = 0
  end
  L4_2.articleCount = L5_2
  L5_2 = MySQL
  L5_2 = L5_2.scalar
  L5_2 = L5_2.await
  L6_2 = "SELECT COUNT(1) FROM lb_news_articles WHERE author = ? AND published = 0"
  L7_2 = {}
  L8_2 = A2_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L5_2 = 0
  end
  L4_2.draftCount = L5_2
  return L4_2
end
L16_1 = false
L13_1(L14_1, L15_1, L16_1)
L13_1 = L12_1
L14_1 = "updateProfile"
function L15_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  A3_2.id = A2_2
  L4_2 = L10_1
  L5_2 = A0_2
  L6_2 = A3_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = Log
  L5_2 = A0_2
  L6_2 = "UpdateProfile"
  L7_2 = "info"
  L8_2 = L
  L9_2 = "LOGS.UPDATED_PROFILE"
  L8_2 = L8_2(L9_2)
  L9_2 = {}
  L9_2.identifier = A2_2
  L10_2 = A3_2.display_name
  L9_2.displayName = L10_2
  L10_2 = A3_2.email
  L9_2.email = L10_2
  L10_2 = A3_2.phone_number
  L9_2.phoneNumber = L10_2
  L10_2 = A3_2.avatar
  L9_2.avatar = L10_2
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = true
  return L4_2
end
L16_1 = false
L13_1(L14_1, L15_1, L16_1)
L13_1 = L12_1
L14_1 = "createArticle"
function L15_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L7_2 = json
  L7_2 = L7_2.encode
  L8_2 = A5_2
  L7_2 = L7_2(L8_2)
  L8_2 = ContainsBlacklistedWord
  L9_2 = A0_2
  L10_2 = L7_2
  L8_2 = L8_2(L9_2, L10_2)
  if not L8_2 then
    L8_2 = ContainsBlacklistedWord
    L9_2 = A0_2
    L10_2 = A4_2
    L8_2 = L8_2(L9_2, L10_2)
    if not L8_2 then
      goto lbl_22
    end
  end
  L8_2 = {}
  L8_2.success = false
  L8_2.reason = "BLACKLISTED_WORD"
  do return L8_2 end
  ::lbl_22::
  L8_2 = L0_1
  L8_2 = L8_2[A3_2]
  if not L8_2 then
    L8_2 = HasPermission
    L9_2 = A0_2
    L10_2 = "categories"
    L8_2 = L8_2(L9_2, L10_2)
    if not L8_2 then
      L8_2 = {}
      L8_2.success = false
      L8_2.reason = "INVALID_CATEGORY"
      return L8_2
    end
    L8_2 = ContainsBlacklistedWord
    L9_2 = A0_2
    L10_2 = A3_2
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 then
      L8_2 = {}
      L8_2.success = false
      L8_2.reason = "BLACKLISTED_WORD"
      return L8_2
    end
    L8_2 = Log
    L9_2 = A0_2
    L10_2 = "CreateCategory"
    L11_2 = "info"
    L12_2 = L
    L13_2 = "LOGS.CREATED_CATEGORY"
    L14_2 = {}
    L14_2.category = A3_2
    L12_2, L13_2, L14_2, L15_2, L16_2 = L12_2(L13_2, L14_2)
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    if true == A6_2 then
      L8_2 = 1
      if L8_2 then
        goto lbl_65
      end
    end
    L8_2 = 0
    ::lbl_65::
    L9_2 = L0_1
    L9_2[A3_2] = L8_2
  elseif A6_2 then
    L8_2 = L0_1
    L9_2 = L8_2[A3_2]
    L9_2 = L9_2 + 1
    L8_2[A3_2] = L9_2
  end
  L8_2 = MySQL
  L8_2 = L8_2.insert
  L8_2 = L8_2.await
  L9_2 = "INSERT INTO lb_news_articles (author, category, title, content, published, notified) VALUES (?, ?, ?, ?, ?, ?)"
  L10_2 = {}
  L11_2 = A2_2
  L12_2 = A3_2
  L13_2 = A4_2
  L14_2 = L7_2
  L15_2 = true == A6_2
  L16_2 = true == A6_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L10_2[5] = L15_2
  L10_2[6] = L16_2
  L8_2 = L8_2(L9_2, L10_2)
  if not L8_2 then
    L9_2 = {}
    L9_2.success = false
    L9_2.reason = "UNKNOWN_ERROR"
    return L9_2
  end
  if A6_2 then
    L9_2 = {}
    L10_2 = L2_1
    L10_2 = L10_2[A2_2]
    L9_2.author = L10_2
    L9_2.id = L8_2
    L9_2.category = A3_2
    L9_2.title = A4_2
    L9_2.content = L7_2
    L10_2 = os
    L10_2 = L10_2.time
    L10_2 = L10_2()
    L10_2 = L10_2 * 1000
    L9_2.published_at = L10_2
    L10_2 = os
    L10_2 = L10_2.time
    L10_2 = L10_2()
    L10_2 = L10_2 * 1000
    L9_2.updated_at = L10_2
    L10_2 = L5_1
    L11_2 = L9_2
    L10_2(L11_2)
    L10_2 = TriggerClientEvent
    L11_2 = "lb-newsapp:newArticle"
    L12_2 = -1
    L13_2 = L9_2
    L10_2(L11_2, L12_2, L13_2)
    L10_2 = TriggerEvent
    L11_2 = "lb-newsapp:newArticle"
    L12_2 = L9_2
    L10_2(L11_2, L12_2)
    L10_2 = L9_1
    L11_2 = {}
    L11_2.title = A4_2
    L11_2.content = A5_2
    L12_2 = L9_2.author
    L11_2.author = L12_2
    L10_2(L11_2)
    L10_2 = Config
    L10_2 = L10_2.DiscordNotifications
    if L10_2 then
      L10_2 = L10_2.newArticle
    end
    if L10_2 then
      L10_2 = DiscordNotification
      L11_2 = "new"
      L12_2 = {}
      L12_2.title = A4_2
      L12_2.content = A5_2
      L13_2 = L9_2.author
      L12_2.author = L13_2
      L10_2(L11_2, L12_2)
    end
  end
  L9_2 = Log
  L10_2 = A0_2
  L11_2 = "CreateArticle"
  L12_2 = "info"
  L13_2 = L
  L14_2 = "LOGS.CREATED_ARTICLE"
  L15_2 = {}
  L15_2.id = L8_2
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = {}
  L14_2.category = A3_2
  L14_2.title = A4_2
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  L9_2 = {}
  L9_2.success = true
  L9_2.id = L8_2
  return L9_2
end
L16_1 = {}
L16_1.success = false
L16_1.reason = "UNKNOWN_ERROR"
L13_1(L14_1, L15_1, L16_1)
L13_1 = L12_1
L14_1 = "updateArticle"
function L15_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2)
  local L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L8_2 = MySQL
  L8_2 = L8_2.single
  L8_2 = L8_2.await
  L9_2 = "SELECT category, published, notified, published_at FROM lb_news_articles WHERE id = ? AND author = ?"
  L10_2 = {}
  L11_2 = A3_2
  L12_2 = A2_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L8_2 = L8_2(L9_2, L10_2)
  if not L8_2 then
    L9_2 = {}
    L9_2.success = false
    L9_2.reason = "NOT_FOUND"
    return L9_2
  end
  L9_2 = L8_2.category
  L10_2 = L8_2.published
  if L9_2 ~= A4_2 then
    L11_2 = L0_1
    L11_2 = L11_2[A4_2]
    if L11_2 then
      L11_2 = L0_1
      L12_2 = L11_2[A4_2]
      L12_2 = L12_2 + 1
      L11_2[A4_2] = L12_2
    else
      L11_2 = HasPermission
      L12_2 = A0_2
      L13_2 = "categories"
      L11_2 = L11_2(L12_2, L13_2)
      if not L11_2 then
        L11_2 = {}
        L11_2.success = false
        L11_2.reason = "INVALID_CATEGORY"
        return L11_2
      end
      if A7_2 then
        L11_2 = 1
        if L11_2 then
          goto lbl_49
        end
      end
      L11_2 = 0
      ::lbl_49::
      L12_2 = L0_1
      L13_2 = L0_1
      L13_2 = L13_2[A4_2]
      if not L13_2 then
        L13_2 = 0
      end
      L13_2 = L13_2 + L11_2
      L12_2[A4_2] = L13_2
    end
    if L10_2 then
      L11_2 = L0_1
      L12_2 = L11_2[L9_2]
      L12_2 = L12_2 - 1
      L11_2[L9_2] = L12_2
    end
  elseif L10_2 and not A7_2 then
    L11_2 = L0_1
    L12_2 = L11_2[L9_2]
    L12_2 = L12_2 - 1
    L11_2[L9_2] = L12_2
  elseif not L10_2 and A7_2 then
    L11_2 = L0_1
    L12_2 = L11_2[A4_2]
    L12_2 = L12_2 + 1
    L11_2[A4_2] = L12_2
  end
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = A6_2
  L11_2 = L11_2(L12_2)
  L12_2 = ContainsBlacklistedWord
  L13_2 = A0_2
  L14_2 = L11_2
  L12_2 = L12_2(L13_2, L14_2)
  if not L12_2 then
    L12_2 = ContainsBlacklistedWord
    L13_2 = A0_2
    L14_2 = A5_2
    L12_2 = L12_2(L13_2, L14_2)
    if not L12_2 then
      goto lbl_106
    end
  end
  L12_2 = {}
  L12_2.success = false
  L12_2.reason = "BLACKLISTED_WORD"
  do return L12_2 end
  ::lbl_106::
  L12_2 = MySQL
  L12_2 = L12_2.update
  L12_2 = L12_2.await
  L13_2 = "UPDATE lb_news_articles SET category = ?, title = ?, content = ?, published = ?, notified = ? WHERE id = ? AND author = ?"
  L14_2 = {}
  L15_2 = A4_2
  L16_2 = A5_2
  L17_2 = L11_2
  L18_2 = true == A7_2
  L19_2 = L8_2.notified
  L19_2 = false == L19_2 and true == A7_2 or L19_2
  L20_2 = A3_2
  L21_2 = A2_2
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L14_2[3] = L17_2
  L14_2[4] = L18_2
  L14_2[5] = L19_2
  L14_2[6] = L20_2
  L14_2[7] = L21_2
  L12_2 = L12_2(L13_2, L14_2)
  L12_2 = L12_2 > 0
  if not L12_2 then
    L13_2 = {}
    L13_2.success = false
    L13_2.reason = "NOT_ALLOWED"
    return L13_2
  end
  if A7_2 then
    L13_2 = {}
    L14_2 = L2_1
    L14_2 = L14_2[A2_2]
    L13_2.author = L14_2
    L13_2.id = A3_2
    L13_2.category = A4_2
    L13_2.title = A5_2
    L13_2.content = L11_2
    if L10_2 then
      L14_2 = L8_2.published_at
      if L14_2 then
        goto lbl_164
      end
    end
    L14_2 = os
    L14_2 = L14_2.time
    L14_2 = L14_2()
    L14_2 = L14_2 * 1000
    ::lbl_164::
    L13_2.published_at = L14_2
    L14_2 = os
    L14_2 = L14_2.time
    L14_2 = L14_2()
    L14_2 = L14_2 * 1000
    L13_2.updated_at = L14_2
    L14_2 = L6_1
    L15_2 = A3_2
    L16_2 = L13_2
    L14_2 = L14_2(L15_2, L16_2)
    if not L14_2 then
      L14_2 = L5_1
      L15_2 = L13_2
      L14_2(L15_2)
    end
    if L10_2 then
      L14_2 = TriggerClientEvent
      L15_2 = "lb-newsapp:articleUpdated"
      L16_2 = -1
      L17_2 = L13_2
      L14_2(L15_2, L16_2, L17_2)
      L14_2 = TriggerEvent
      L15_2 = "lb-newsapp:articleUpdated"
      L16_2 = L13_2
      L14_2(L15_2, L16_2)
    else
      L14_2 = MySQL
      L14_2 = L14_2.update
      L14_2 = L14_2.await
      L15_2 = "UPDATE lb_news_articles SET published_at = CURRENT_TIMESTAMP WHERE id = ?"
      L16_2 = {}
      L17_2 = A3_2
      L16_2[1] = L17_2
      L14_2(L15_2, L16_2)
      L14_2 = TriggerClientEvent
      L15_2 = "lb-newsapp:newArticle"
      L16_2 = -1
      L17_2 = L13_2
      L14_2(L15_2, L16_2, L17_2)
      L14_2 = TriggerEvent
      L15_2 = "lb-newsapp:newArticle"
      L16_2 = L13_2
      L14_2(L15_2, L16_2)
    end
    L14_2 = L8_2.notified
    if not L14_2 then
      L14_2 = L9_1
      L15_2 = {}
      L15_2.title = A5_2
      L15_2.content = A6_2
      L16_2 = L13_2.author
      L15_2.author = L16_2
      L14_2(L15_2)
      L14_2 = Config
      L14_2 = L14_2.DiscordNotifications
      if L14_2 then
        L14_2 = L14_2.articleUpdated
      end
      if L14_2 then
        L14_2 = DiscordNotification
        L15_2 = "new"
        L16_2 = {}
        L16_2.title = A5_2
        L16_2.content = A6_2
        L17_2 = L13_2.author
        L16_2.author = L17_2
        L14_2(L15_2, L16_2)
      end
    else
      L14_2 = Config
      L14_2 = L14_2.DiscordNotifications
      if L14_2 then
        L14_2 = L14_2.articleUpdated
      end
      if L14_2 then
        L14_2 = DiscordNotification
        L15_2 = "update"
        L16_2 = {}
        L16_2.title = A5_2
        L16_2.content = A6_2
        L17_2 = L13_2.author
        L16_2.author = L17_2
        L14_2(L15_2, L16_2)
      end
    end
  elseif L10_2 then
    L13_2 = L8_1
    L14_2 = A3_2
    L13_2(L14_2)
    L13_2 = TriggerEvent
    L14_2 = "lb-newsapp:articleUnpublished"
    L15_2 = A3_2
    L13_2(L14_2, L15_2)
    L13_2 = TriggerClientEvent
    L14_2 = "lb-newsapp:articleRemoved"
    L15_2 = -1
    L16_2 = A3_2
    L13_2(L14_2, L15_2, L16_2)
  end
  L13_2 = Log
  L14_2 = A0_2
  L15_2 = "UpdateArticle"
  L16_2 = "info"
  L17_2 = L
  L18_2 = "LOGS.UPDATED_ARTICLE"
  L19_2 = {}
  L19_2.id = A3_2
  L17_2 = L17_2(L18_2, L19_2)
  L18_2 = {}
  L18_2.category = A4_2
  L18_2.title = A5_2
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L13_2 = {}
  L13_2.success = true
  L13_2.oldPublished = L10_2
  return L13_2
end
L16_1 = {}
L16_1.success = false
L16_1.reason = "UNKNOWN_ERROR"
L13_1(L14_1, L15_1, L16_1)
L13_1 = L12_1
L14_1 = "deleteArticle"
function L15_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = MySQL
  L4_2 = L4_2.single
  L4_2 = L4_2.await
  L5_2 = "SELECT category, title, published FROM lb_news_articles WHERE id = ? AND author = ?"
  L6_2 = {}
  L7_2 = A3_2
  L8_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = {}
    L5_2.success = false
    L5_2.reason = "NOT_FOUND"
    return L5_2
  end
  L5_2 = L4_2.category
  L6_2 = L4_2.published
  L7_2 = L4_2.title
  L8_2 = MySQL
  L8_2 = L8_2.update
  L8_2 = L8_2.await
  L9_2 = "DELETE FROM lb_news_articles WHERE id = ? AND author = ?"
  L10_2 = {}
  L11_2 = A3_2
  L12_2 = A2_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L8_2 = L8_2(L9_2, L10_2)
  L8_2 = L8_2 > 0
  if not L8_2 then
    L9_2 = {}
    L9_2.success = false
    L9_2.reason = "NOT_ALLOWED"
    return L9_2
  end
  if L6_2 then
    L9_2 = L8_1
    L10_2 = A3_2
    L9_2(L10_2)
    L9_2 = TriggerClientEvent
    L10_2 = "lb-newsapp:articleRemoved"
    L11_2 = -1
    L12_2 = A3_2
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = TriggerEvent
    L10_2 = "lb-newsapp:articleDeleted"
    L11_2 = A3_2
    L9_2(L10_2, L11_2)
    if L5_2 then
      L9_2 = L0_1
      L9_2 = L9_2[L5_2]
      if L9_2 then
        L9_2 = L0_1
        L10_2 = L9_2[L5_2]
        L10_2 = L10_2 - 1
        L9_2[L5_2] = L10_2
      end
    end
  end
  L9_2 = Log
  L10_2 = A0_2
  L11_2 = "DeleteArticle"
  L12_2 = "info"
  L13_2 = L
  L14_2 = "LOGS.DELETED_ARTICLE"
  L15_2 = {}
  L15_2.id = A3_2
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = {}
  L14_2.category = L5_2
  L14_2.title = L7_2
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  L9_2 = {}
  L9_2.success = true
  L9_2.published = L6_2
  return L9_2
end
L16_1 = {}
L16_1.success = false
L16_1.reason = "UNKNOWN_ERROR"
L13_1(L14_1, L15_1, L16_1)
L13_1 = BaseCallback
L14_1 = "unpublishOther"
function L15_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "unpublish"
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = IsAdmin
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L3_2 = {}
      L3_2.success = false
      L3_2.reason = "NOT_ALLOWED"
      return L3_2
    end
  end
  L3_2 = MySQL
  L3_2 = L3_2.single
  L3_2 = L3_2.await
  L4_2 = "SELECT category, published, author, title FROM lb_news_articles WHERE id = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = {}
    L4_2.success = false
    L4_2.reason = "NOT_FOUND"
    return L4_2
  end
  L4_2 = L3_2.category
  L5_2 = L3_2.published
  L6_2 = L3_2.author
  L7_2 = L3_2.title
  if not L5_2 then
    L8_2 = {}
    L8_2.success = false
    L8_2.reason = "NOT_PUBLISHED"
    return L8_2
  end
  L8_2 = MySQL
  L8_2 = L8_2.update
  L8_2 = L8_2.await
  L9_2 = "UPDATE lb_news_articles SET published = 0 WHERE id = ? AND published = 1"
  L10_2 = {}
  L11_2 = A2_2
  L10_2[1] = L11_2
  L8_2 = L8_2(L9_2, L10_2)
  L8_2 = L8_2 > 0
  if not L8_2 then
    L9_2 = {}
    L9_2.success = false
    L9_2.reason = "UNKNOWN_ERROR"
    return L9_2
  end
  L9_2 = L8_1
  L10_2 = A2_2
  L9_2(L10_2)
  L9_2 = TriggerClientEvent
  L10_2 = "lb-newsapp:articleRemoved"
  L11_2 = -1
  L12_2 = A2_2
  L9_2(L10_2, L11_2, L12_2)
  if L4_2 then
    L9_2 = L0_1
    L9_2 = L9_2[L4_2]
    if L9_2 then
      L9_2 = L0_1
      L10_2 = L9_2[L4_2]
      L10_2 = L10_2 - 1
      L9_2[L4_2] = L10_2
    end
  end
  L9_2 = nil
  L10_2 = GetSourceFromIdentifier
  L11_2 = L6_2
  L10_2 = L10_2(L11_2)
  L11_2 = pcall
  function L12_2()
    local L0_3, L1_3, L2_3
    L0_3 = L10_2
    if L0_3 then
      L0_3 = exports
      L0_3 = L0_3["lb-phone"]
      L1_3 = L0_3
      L0_3 = L0_3.GetEquippedPhoneNumber
      L2_3 = L10_2
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        goto lbl_16
      end
    end
    L0_3 = exports
    L0_3 = L0_3["lb-phone"]
    L1_3 = L0_3
    L0_3 = L0_3.GetEquippedPhoneNumber
    L2_3 = L6_2
    L0_3 = L0_3(L1_3, L2_3)
    ::lbl_16::
    L9_2 = L0_3
  end
  L11_2(L12_2)
  if L10_2 then
    L11_2 = TriggerClientEvent
    L12_2 = "lb-news:unpublished"
    L13_2 = L10_2
    L14_2 = A2_2
    L11_2(L12_2, L13_2, L14_2)
  end
  if L9_2 then
    L11_2 = exports
    L11_2 = L11_2["lb-phone"]
    L12_2 = L11_2
    L11_2 = L11_2.SendNotification
    L13_2 = L9_2
    L14_2 = {}
    L14_2.app = "lb-newsapp"
    L15_2 = L
    L16_2 = "UNPUBLISHED_NOTIFICATION.TITLE"
    L15_2 = L15_2(L16_2)
    L14_2.title = L15_2
    L15_2 = L
    L16_2 = "UNPUBLISHED_NOTIFICATION.DESCRIPTION"
    L17_2 = {}
    L17_2.title = L7_2
    L15_2 = L15_2(L16_2, L17_2)
    L14_2.content = L15_2
    L11_2(L12_2, L13_2, L14_2)
  else
    L11_2 = Config
    L11_2 = L11_2.LBTablet
    if L11_2 then
      L11_2 = GetResourceState
      L12_2 = "lb-tablet"
      L11_2 = L11_2(L12_2)
      if "started" == L11_2 then
        L11_2 = exports
        L11_2 = L11_2["lb-tablet"]
        L12_2 = L11_2
        L11_2 = L11_2.SendNotification
        L13_2 = {}
        L13_2.tabletId = L6_2
        L13_2.source = L10_2
        L13_2.app = "lb-newsapp"
        L14_2 = L
        L15_2 = "UNPUBLISHED_NOTIFICATION.TITLE"
        L14_2 = L14_2(L15_2)
        L13_2.title = L14_2
        L14_2 = L
        L15_2 = "UNPUBLISHED_NOTIFICATION.DESCRIPTION"
        L16_2 = {}
        L16_2.title = L7_2
        L14_2 = L14_2(L15_2, L16_2)
        L13_2.content = L14_2
        L11_2(L12_2, L13_2)
      end
    end
  end
  L11_2 = Log
  L12_2 = A0_2
  L13_2 = "UnpublishOther"
  L14_2 = "info"
  L15_2 = L
  L16_2 = "LOGS.UNPUBLISH_OTHER"
  L17_2 = {}
  L17_2.id = A2_2
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = {}
  L16_2.category = L4_2
  L16_2.title = L7_2
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  L11_2 = {}
  L11_2.success = true
  return L11_2
end
L16_1 = {}
L16_1.success = false
L16_1.reason = "UNKNOWN_ERROR"
L13_1(L14_1, L15_1, L16_1)
L13_1 = BaseCallback
L14_1 = "getCategories"
function L15_1(A0_2, A1_2)
  local L2_2
  L2_2 = L1_1
  return L2_2
end
L16_1 = {}
L13_1(L14_1, L15_1, L16_1)
L13_1 = BaseCallback
L14_1 = "isAdmin"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = IsAdmin
  L3_2 = A0_2
  return L2_2(L3_2)
end
L16_1 = false
L13_1(L14_1, L15_1, L16_1)
L13_1 = BaseCallback
L14_1 = "getArticles"
function L15_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A2_2 then
    L3_2 = {}
    A2_2 = L3_2
  end
  L3_2 = next
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = L3_1
    return L3_2
  end
  L3_2 = A2_2.own
  if L3_2 then
    L3_2 = GetIdentifier
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    A2_2.author = L3_2
  else
    L3_2 = A2_2.drafts
    if L3_2 then
      L3_2 = {}
      return L3_2
    end
  end
  L3_2 = {}
  L4_2 = A2_2.drafts
  if true == L4_2 then
    L4_2 = 0
    if L4_2 then
      goto lbl_36
    end
  end
  L4_2 = 1
  ::lbl_36::
  L3_2[1] = L4_2
  L4_2 = "SELECT id, author, category, title, content, published_at, updated_at FROM lb_news_articles WHERE published = ?"
  L5_2 = type
  L6_2 = A2_2.search
  L5_2 = L5_2(L6_2)
  if "string" == L5_2 then
    L5_2 = L4_2
    L6_2 = " AND title LIKE ? OR content LIKE ?"
    L5_2 = L5_2 .. L6_2
    L4_2 = L5_2
    L5_2 = #L3_2
    L5_2 = L5_2 + 1
    L6_2 = "%"
    L7_2 = A2_2.search
    L8_2 = "%"
    L6_2 = L6_2 .. L7_2 .. L8_2
    L3_2[L5_2] = L6_2
    L5_2 = #L3_2
    L5_2 = L5_2 + 1
    L6_2 = "%"
    L7_2 = A2_2.search
    L8_2 = "%"
    L6_2 = L6_2 .. L7_2 .. L8_2
    L3_2[L5_2] = L6_2
  end
  L5_2 = type
  L6_2 = A2_2.category
  L5_2 = L5_2(L6_2)
  if "string" == L5_2 then
    L5_2 = L4_2
    L6_2 = " AND category = ?"
    L5_2 = L5_2 .. L6_2
    L4_2 = L5_2
    L5_2 = #L3_2
    L5_2 = L5_2 + 1
    L6_2 = A2_2.category
    L3_2[L5_2] = L6_2
  end
  L5_2 = type
  L6_2 = A2_2.author
  L5_2 = L5_2(L6_2)
  if "string" == L5_2 then
    L5_2 = L4_2
    L6_2 = " AND author = ?"
    L5_2 = L5_2 .. L6_2
    L4_2 = L5_2
    L5_2 = #L3_2
    L5_2 = L5_2 + 1
    L6_2 = A2_2.author
    L3_2[L5_2] = L6_2
  end
  L5_2 = L4_2
  L6_2 = " ORDER BY updated_at DESC LIMIT ?, ?"
  L5_2 = L5_2 .. L6_2
  L4_2 = L5_2
  L5_2 = #L3_2
  L5_2 = L5_2 + 1
  L6_2 = A2_2.page
  if not L6_2 then
    L6_2 = 0
  end
  L6_2 = L6_2 * 10
  L3_2[L5_2] = L6_2
  L5_2 = #L3_2
  L5_2 = L5_2 + 1
  L3_2[L5_2] = 10
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = L4_2
  L7_2 = L3_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = 1
  L7_2 = #L5_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = L5_2[L9_2]
    L11_2 = L11_1
    L12_2 = L10_2.author
    L11_2 = L11_2(L12_2)
    if not L11_2 then
      L11_2 = {}
      L11_2.display_name = "??"
    end
    L10_2.author = L11_2
  end
  return L5_2
end
L16_1 = {}
L13_1(L14_1, L15_1, L16_1)
L13_1 = BaseCallback
L14_1 = "adminDeleteArticle"
function L15_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L3_2 = IsAdmin
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = infoprint
    L4_2 = "warning"
    L5_2 = GetPlayerName
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    L6_2 = " ("
    L7_2 = A0_2
    L8_2 = ") tried to delete article as an admin, but they are not admin"
    L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2
    L3_2(L4_2, L5_2)
    L3_2 = {}
    L3_2.success = false
    L3_2.reason = "NOT_ALLOWED"
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.single
  L3_2 = L3_2.await
  L4_2 = "SELECT category, published, author, title FROM lb_news_articles WHERE id = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = {}
    L4_2.success = false
    L4_2.reason = "NOT_FOUND"
    return L4_2
  end
  L4_2 = L3_2.category
  L5_2 = L3_2.published
  L6_2 = L3_2.author
  L7_2 = L3_2.title
  L8_2 = MySQL
  L8_2 = L8_2.update
  L8_2 = L8_2.await
  L9_2 = "DELETE FROM lb_news_articles WHERE id = ?"
  L10_2 = {}
  L11_2 = A2_2
  L10_2[1] = L11_2
  L8_2 = L8_2(L9_2, L10_2)
  L8_2 = L8_2 > 0
  if not L8_2 then
    L9_2 = {}
    L9_2.success = false
    L9_2.reason = "FAILED_DELETE"
    return L9_2
  end
  if L5_2 then
    L9_2 = L8_1
    L10_2 = A2_2
    L9_2(L10_2)
    L9_2 = TriggerClientEvent
    L10_2 = "lb-newsapp:articleRemoved"
    L11_2 = -1
    L12_2 = A2_2
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = TriggerEvent
    L10_2 = "lb-newsapp:articleDeleted"
    L11_2 = A2_2
    L9_2(L10_2, L11_2)
    if L4_2 then
      L9_2 = L0_1
      L9_2 = L9_2[L4_2]
      if L9_2 then
        L9_2 = L0_1
        L10_2 = L9_2[L4_2]
        L10_2 = L10_2 - 1
        L9_2[L4_2] = L10_2
      end
    end
  end
  L9_2 = GetSourceFromIdentifier
  L10_2 = L6_2
  L9_2 = L9_2(L10_2)
  if L9_2 then
    L10_2 = exports
    L10_2 = L10_2["lb-phone"]
    L11_2 = L10_2
    L10_2 = L10_2.GetEquippedPhoneNumber
    L12_2 = L9_2
    L10_2 = L10_2(L11_2, L12_2)
    if L10_2 then
      goto lbl_103
    end
  end
  L10_2 = exports
  L10_2 = L10_2["lb-phone"]
  L11_2 = L10_2
  L10_2 = L10_2.GetEquippedPhoneNumber
  L12_2 = L6_2
  L10_2 = L10_2(L11_2, L12_2)
  ::lbl_103::
  if L9_2 then
    L11_2 = TriggerClientEvent
    L12_2 = "lb-news:deleted"
    L13_2 = L9_2
    L14_2 = L5_2
    L11_2(L12_2, L13_2, L14_2)
  end
  if L10_2 then
    L11_2 = exports
    L11_2 = L11_2["lb-phone"]
    L12_2 = L11_2
    L11_2 = L11_2.SendNotification
    L13_2 = L10_2
    L14_2 = {}
    L14_2.app = "lb-newsapp"
    L15_2 = L
    L16_2 = "DELETED_NOTIFICATION.TITLE"
    L15_2 = L15_2(L16_2)
    L14_2.title = L15_2
    L15_2 = L
    L16_2 = "DELETED_NOTIFICATION.DESCRIPTION"
    L17_2 = {}
    L17_2.title = L7_2
    L15_2 = L15_2(L16_2, L17_2)
    L14_2.content = L15_2
    L11_2(L12_2, L13_2, L14_2)
  else
    L11_2 = Config
    L11_2 = L11_2.LBTablet
    if L11_2 then
      L11_2 = GetResourceState
      L12_2 = "lb-tablet"
      L11_2 = L11_2(L12_2)
      if "started" == L11_2 then
        L11_2 = exports
        L11_2 = L11_2["lb-tablet"]
        L12_2 = L11_2
        L11_2 = L11_2.SendNotification
        L13_2 = {}
        L13_2.tabletId = L6_2
        L13_2.source = L9_2
        L13_2.app = "lb-newsapp"
        L14_2 = L
        L15_2 = "DELETED_NOTIFICATION.TITLE"
        L14_2 = L14_2(L15_2)
        L13_2.title = L14_2
        L14_2 = L
        L15_2 = "DELETED_NOTIFICATION.DESCRIPTION"
        L16_2 = {}
        L16_2.title = L7_2
        L14_2 = L14_2(L15_2, L16_2)
        L13_2.content = L14_2
        L11_2(L12_2, L13_2)
      end
    end
  end
  L11_2 = Log
  L12_2 = A0_2
  L13_2 = "DeleteOther"
  L14_2 = "info"
  L15_2 = L
  L16_2 = "LOGS.DELETED_OTHER_ARTICLE"
  L17_2 = {}
  L17_2.id = A2_2
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = {}
  L16_2.category = L4_2
  L16_2.title = L7_2
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  L11_2 = {}
  L11_2.success = true
  L11_2.published = L5_2
  return L11_2
end
L16_1 = {}
L16_1.success = false
L16_1.reason = "UNKNOWN_ERROR"
L13_1(L14_1, L15_1, L16_1)
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
L18_1.resource = "lb-newsapp"
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
