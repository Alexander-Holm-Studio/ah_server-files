---@param event string
---@param handler fun(source: number, ...) : ...
function RegisterCallback(event, handler)
    RegisterNetEvent("lb-lookupapp:cb:" .. event, function(requestId, ...)
        local src = source
        local params = { ... }
        local startTime = os.nanotime()

        local success, errorMessage = pcall(function()
            TriggerClientEvent("lb-lookupapp:cb:response", src, requestId, handler(src, table.unpack(params)))
        end)

        if not success then
            local stackTrace = Citizen.InvokeNative(`FORMAT_STACK_TRACE` & 0xFFFFFFFF, nil, 0, Citizen.ResultAsString())

            print(("^1SCRIPT ERROR: Callback '%s' failed: %s^7\n%s"):format(event, errorMessage or "", stackTrace or ""))
            TriggerClientEvent("lb-lookupapp:cb:response", src, requestId, nil)
        end
    end)
end

exports("RegisterCallback", RegisterCallback)

---@param event string
---@param callback fun(source: number, phoneNumber: string, ...) : ...
---@param defaultReturn any
function BaseCallback(event, callback, defaultReturn)
    RegisterCallback(event, function(source, ...)
        local phoneNumber = exports["lb-phone"]:GetEquippedPhoneNumber(source)

        if not phoneNumber then
            return defaultReturn
        end

        return callback(source, phoneNumber, ...)
    end)
end
