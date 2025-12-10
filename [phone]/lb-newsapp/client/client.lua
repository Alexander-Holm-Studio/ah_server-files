local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = nil
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = AwaitCallback
  L2_2 = "getArticles"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L1_2[L5_2]
    L7_2 = json
    L7_2 = L7_2.decode
    L8_2 = L6_2.content
    L7_2 = L7_2(L8_2)
    L6_2.content = L7_2
  end
  return L1_2
end
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = AwaitCallback
  L2_2 = "createArticle"
  L3_2 = A0_2.category
  L4_2 = A0_2.title
  L5_2 = A0_2.content
  L6_2 = A0_2.publish
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L2_2 = L1_2.success
  if not L2_2 then
    return L1_2
  end
  L2_2 = L0_1.articleCount
  L3_2 = A0_2.publish
  if L3_2 then
    L3_2 = 1
    if L3_2 then
      goto lbl_20
    end
  end
  L3_2 = 0
  ::lbl_20::
  L2_2 = L2_2 + L3_2
  L0_1.articleCount = L2_2
  L2_2 = L0_1.draftCount
  L3_2 = A0_2.publish
  if L3_2 then
    L3_2 = 0
    if L3_2 then
      goto lbl_31
    end
  end
  L3_2 = 1
  ::lbl_31::
  L2_2 = L2_2 + L3_2
  L0_1.draftCount = L2_2
  return L1_2
end
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = A0_2.articleId
  L2_2 = A0_2.category
  L3_2 = A0_2.content
  L4_2 = A0_2.publish
  L5_2 = A0_2.title
  L6_2 = AwaitCallback
  L7_2 = "updateArticle"
  L8_2 = L1_2
  L9_2 = L2_2
  L10_2 = L5_2
  L11_2 = L3_2
  L12_2 = L4_2
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L7_2 = L6_2
  if L7_2 then
    L7_2 = L7_2.success
  end
  if not L7_2 then
    return L6_2
  end
  L7_2 = L6_2.oldPublished
  if L7_2 ~= L4_2 then
    L7_2 = L0_1.articleCount
    if L4_2 then
      L8_2 = 1
      if L8_2 then
        goto lbl_31
      end
    end
    L8_2 = -1
    ::lbl_31::
    L7_2 = L7_2 + L8_2
    L0_1.articleCount = L7_2
    L7_2 = L0_1.draftCount
    if L4_2 then
      L8_2 = -1
      if L8_2 then
        goto lbl_41
      end
    end
    L8_2 = 1
    ::lbl_41::
    L7_2 = L7_2 + L8_2
    L0_1.draftCount = L7_2
  end
  return L6_2
end
function L4_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = AwaitCallback
  L2_2 = "deleteArticle"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = L1_2.success
  if not L2_2 then
    return L1_2
  end
  L2_2 = L1_2.published
  if L2_2 then
    L2_2 = L0_1.articleCount
    L2_2 = L2_2 - 1
    L0_1.articleCount = L2_2
  else
    L2_2 = L0_1.draftCount
    L2_2 = L2_2 - 1
    L0_1.draftCount = L2_2
  end
  return L1_2
end
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = AwaitCallback
  L2_2 = "updateProfile"
  L3_2 = {}
  L4_2 = A0_2.display_name
  L3_2.display_name = L4_2
  L4_2 = A0_2.email
  L3_2.email = L4_2
  L4_2 = A0_2.phone_number
  L3_2.phone_number = L4_2
  L4_2 = A0_2.avatar
  L3_2.avatar = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L0_1.profile = A0_2
  end
  return L1_2
end
function L6_1()
  local L0_2, L1_2, L2_2
  L0_2 = {}
  L1_2 = HasPermission
  L2_2 = "create"
  L1_2 = L1_2(L2_2)
  L0_2.create = L1_2
  L1_2 = HasPermission
  L2_2 = "categories"
  L1_2 = L1_2(L2_2)
  L0_2.categories = L1_2
  L1_2 = HasPermission
  L2_2 = "unpublish"
  L1_2 = L1_2(L2_2)
  L0_2.unpublish = L1_2
  return L0_2
end
L7_1 = RegisterNUICallback
L8_1 = "News"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2.action
  if "getConfig" == L2_2 then
    L3_2 = A1_2
    L4_2 = {}
    L5_2 = Config
    L5_2 = L5_2.Header
    L4_2.Header = L5_2
    L5_2 = L6_1
    L5_2 = L5_2()
    L4_2.Permissions = L5_2
    L5_2 = AwaitCallback
    L6_2 = "isAdmin"
    L5_2 = L5_2(L6_2)
    L4_2.IsAdmin = L5_2
    L5_2 = GetAllLocales
    L5_2 = L5_2()
    L4_2.Locales = L5_2
    return L3_2(L4_2)
  elseif "getCategories" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "getCategories"
    L5_2 = A1_2
    return L3_2(L4_2, L5_2)
  elseif "adminDeleteArticle" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "adminDeleteArticle"
    L5_2 = A1_2
    L6_2 = A0_2.articleId
    return L3_2(L4_2, L5_2, L6_2)
  end
  if "getProfile" == L2_2 then
    L3_2 = HasPermission
    L4_2 = "create"
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L3_2 = A1_2
      L4_2 = false
      return L3_2(L4_2)
    end
    L3_2 = L0_1
    if not L3_2 then
      L3_2 = AwaitCallback
      L4_2 = "getProfile"
      L3_2 = L3_2(L4_2)
      L0_1 = L3_2
    end
    L3_2 = A1_2
    L4_2 = L0_1
    return L3_2(L4_2)
  elseif "createArticle" == L2_2 then
    L3_2 = A1_2
    L4_2 = L2_1
    L5_2 = A0_2.data
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "updateArticle" == L2_2 then
    L3_2 = A1_2
    L4_2 = L3_1
    L5_2 = A0_2.data
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "deleteArticle" == L2_2 then
    L3_2 = A1_2
    L4_2 = L4_1
    L5_2 = A0_2.articleId
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "getArticles" == L2_2 then
    L3_2 = A1_2
    L4_2 = L1_1
    L5_2 = A0_2.filter
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "updateProfile" == L2_2 then
    L3_2 = A1_2
    L4_2 = L5_1
    L5_2 = A0_2.profile
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "unpublishOther" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "unpublishOther"
    L5_2 = A1_2
    L6_2 = A0_2.articleId
    return L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = infoprint
  L4_2 = "error"
  L5_2 = "Unknown action '"
  L6_2 = tostring
  L7_2 = L2_2
  L6_2 = L6_2(L7_2)
  L7_2 = "'"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L3_2(L4_2, L5_2)
  L3_2 = A1_2
  L4_2 = false
  L3_2(L4_2)
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNetEvent
L8_1 = "lb-news:unpublished"
function L9_1()
  local L0_2, L1_2
  L0_2 = L0_1
  if not L0_2 then
    return
  end
  L0_2 = L0_1.articleCount
  L1_2 = L0_2 - 1
  L0_1.articleCount = L1_2
  L0_2 = L0_1.draftCount
  L1_2 = L0_2 + 1
  L0_1.draftCount = L1_2
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNetEvent
L8_1 = "lb-news:deleted"
function L9_1(A0_2)
  local L1_2
  L1_2 = L0_1
  if not L1_2 then
    return
  end
  if A0_2 then
    L1_2 = L0_1.articleCount
    L1_2 = L1_2 - 1
    L0_1.articleCount = L1_2
  else
    L1_2 = L0_1.draftCount
    L1_2 = L1_2 - 1
    L0_1.draftCount = L1_2
  end
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNetEvent
L8_1 = "lb-newsapp:newArticle"
function L9_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = json
  L1_2 = L1_2.decode
  L2_2 = A0_2.content
  L1_2 = L1_2(L2_2)
  A0_2.content = L1_2
  L1_2 = SendAppMessage
  L2_2 = "newArticle"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNetEvent
L8_1 = "lb-newsapp:articleUpdated"
function L9_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = json
  L1_2 = L1_2.decode
  L2_2 = A0_2.content
  L1_2 = L1_2(L2_2)
  A0_2.content = L1_2
  L1_2 = SendAppMessage
  L2_2 = "articleUpdated"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNetEvent
L8_1 = "lb-newsapp:articleRemoved"
function L9_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendAppMessage
  L2_2 = "articleRemoved"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L7_1(L8_1, L9_1)
L7_1 = AddEventHandler
L8_1 = "lb-news:jobUpdated"
function L9_1()
  local L0_2, L1_2, L2_2
  L0_2 = SendAppMessage
  L1_2 = "updatePermissions"
  L2_2 = L6_1
  L2_2 = L2_2()
  L0_2(L1_2, L2_2)
end
L7_1(L8_1, L9_1)
