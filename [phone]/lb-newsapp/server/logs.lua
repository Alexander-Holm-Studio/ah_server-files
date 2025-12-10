local discordColors = {
    info = tonumber("3498DB", 16),
    warning = tonumber("F1C40F", 16),
    error = tonumber("E74C3C", 16)
}

---@param source number
---@param action "CreateArticle" | "CreateCategory" | "UpdateArticle" | "DeleteArticle" | "DeleteOther" | "UnpublishOther" | "UpdateProfile"
---@param level "info" | "warning" | "error"
---@param title string
---@param metadata? table<string, any>
function Log(source, action, level, title, metadata)
	if not Config.Logs?.Enabled or not Config.Logs.Actions[action] then
		return
	end

	if Config.Logs.Service == "ox_lib" then
		lib.Logger(source, level, title)
    elseif Config.Logs.Service == "fivemanage" then
		if GetResourceState("fmsdk") ~= "started" then
            infoprint("error", "Config.Logs.Service is set to 'fivemanage', but fmsdk is not started. To log using Fivemanage, you need to install fmsdk from https://github.com/fivemanage/sdk/releases/latest.")
            return
        end

        if not metadata then
            metadata = {}
        end

        metadata.playerSource = source

        exports.fmsdk:LogMessage(level, title, metadata)
    elseif Config.Logs.Service ~= "discord" then
		return
	end

	if not LOG_WEBHOOK or type(LOG_WEBHOOK) ~= "string" then
		infoprint("error", "Config.Logs.Service is set to discord, but no discord webhook has been set in lb-newsapp/server/apiKeys.lua")
		return
	end

	local cleanedUpIdentifiers = {}
	local accounts = {}
	local identifiers = GetPlayerIdentifiers(source)
	local description = metadata and json.encode(metadata, { indent = true }) .. "\n\n" or ""
	local accountsCount = 0

	for i = 1, #identifiers do
		local identifierTypeIndex = identifiers[i]:find(":")

		if not identifierTypeIndex then
			goto continue
		end

		local identifierType = identifiers[i]:sub(1, identifierTypeIndex - 1)
		local identifier = identifiers[i]:sub(identifierTypeIndex + 1)

		if identifierType == "steam" then
			accountsCount += 1
			accounts[accountsCount] = "- Steam: https://steamcommunity.com/profiles/" .. tonumber(identifier, 16)
		elseif identifierType == "discord" then
			accountsCount += 1
			accounts[accountsCount] = "- Discord: <@" .. identifier .. ">"
		end

		if identifierType ~= "ip" then
			cleanedUpIdentifiers[identifierType] = identifier
		end

		::continue::
	end

	if accountsCount > 0 then
		description = description .. "**Accounts:**\n"
		for i = 1, accountsCount do
			description = description .. accounts[i] .. "\n"
		end
	end

	description = description .. "**Identifiers:**"

	for identifierType in pairs(cleanedUpIdentifiers) do
		description = description .. "\n- **" .. identifierType .. ":** " .. cleanedUpIdentifiers[identifierType]
	end

	local embed = {
		title = title,
		description = description,
		color = discordColors[level],
		timestamp = GetTimestampISO(),
		author = {
			name = GetPlayerName(source) .. " | " .. source,
			icon_url = "https://cdn.discordapp.com/embed/avatars/" .. math.random(0, 5) .. ".png"
		},
		footer = {
			text = "LB News",
			icon_url = "https://docs.lbscripts.com/images/icons/icon.png"
		}
	}

	PerformHttpRequest(LOG_WEBHOOK, function() end, "POST", json.encode({
		username = L("APP.NAME"),
        avatar_url = "https://loaf-scripts.com/fivem/lb-phone/icons/News.png",
		embeds = { embed }
	}), { ["Content-Type"] = "application/json" })
end

if Config.Logs?.Enabled and Config.Logs?.Service == "ox_lib" then
	debugprint("Logs set to ox_lib, loading..")
	local oxInit = LoadResourceFile("ox_lib", "init.lua")

    if oxInit then
        load(oxInit)()
		debugprint("Loaded ox_lib")
	else
        Config.Logs.Enabled = false

        infoprint("error", "Failed to load ox_lib")
    end
end
