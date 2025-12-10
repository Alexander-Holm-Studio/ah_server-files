function ContainsBlacklistedWord(source, text)
    local exportExists, contains = pcall(function()
        return exports["lb-phone"]:ContainsBlacklistedWord(source, text)
    end)

    return exportExists and contains
end

function GetTimestampISO()
    ---@diagnostic disable-next-line: param-type-mismatch
    local currentTime = os.time(os.date("!*t")) -- Get the current time in UTC

    return os.date("%Y-%m-%dT%H:%M:%S.000Z", currentTime)
end

---@param notificationType "new" | "update"
---@param article table
function DiscordNotification(notificationType, article)
    local webhook = (notificationType == "new" and NEW_ARTICLE_WEBHOOK) or (notificationType == "update" and UPDATE_ARTICLE_WEBHOOK)

    if not webhook then
        return
    end

    if type(webhook) ~= "string" then
        if notificationType == "new" then
            infoprint("error", "Invalid NEW_ARTICLE_WEBHOOK webhook URL (not a string).")
        elseif notificationType == "update" then
            infoprint("error", "Invalid UPDATE_ARTICLE_WEBHOOK webhook URL (not a string).")
        end

        return
    end

    local content, message, thumbnail = article.content, "", nil

    for i = 1, #content do
        if content[i].type == "text" then
            message = message .. content[i].content .. "\n\n"
        end
    end

    if message:sub(-2) == "\n\n" then
        message = message:sub(1, -3)
    end

    for i = 1, #content do
        if content[i].type == "media" then
            for j = 1, #content[i].content do
                if content[i].content[j].type == "image" then
                    thumbnail = content[i].content[j].src
                    break
                end
            end
        end
    end

    PerformHttpRequest(webhook, function() end, "POST", json.encode({
        username = L("APP.NAME"),
        avatar_url = "https://loaf-scripts.com/fivem/lb-phone/icons/News.png",
        embeds = {
            {
                title = L("NEW_ARTICLE_WEBHOOK.TITLE", { title = article.title }),
                description = L("NEW_ARTICLE_WEBHOOK.DESCRIPTION", { content = message:sub(1, 1500) }),
                color = tonumber("EEEEEE", 16),
                timestamp = GetTimestampISO(),
                author = {
                    name = article.author.display_name,
                    icon_url = article.author.avatar or ("https://cdn.discordapp.com/embed/avatars/" .. math.random(0, 5) .. ".png")
                },
                image = thumbnail and {
                    url = thumbnail
                } or nil,
                footer = {
                    text = "LB News",
                    icon_url = "https://docs.lbscripts.com/images/icons/icon.png"
                }
            }
        }
    }), { ["Content-Type"] = "application/json" })
end
