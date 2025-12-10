---@param event string
---@param handler fun(source: number, ...) : ...
function RegisterCallback(event, handler)
    RegisterNetEvent("lb-newsapp:cb:" .. event, function(requestId, ...)
        local src = source
        local params = { ... }
        local startTime = os.nanotime()

        local success, errorMessage = pcall(function()
            TriggerClientEvent("lb-newsapp:cb:response", src, requestId, handler(src, table.unpack(params)))

            local finishTime = os.nanotime()
            local ms = (finishTime - startTime) / 1e6

            debugprint(("Callback ^5%s^7 took %.4fms"):format(event, ms))
        end)

        if not success then
            local stackTrace = Citizen.InvokeNative(`FORMAT_STACK_TRACE` & 0xFFFFFFFF, nil, 0, Citizen.ResultAsString())

            print(("^1SCRIPT ERROR: Callback '%s' failed: %s^7\n%s"):format(event, errorMessage or "", stackTrace or ""))
            TriggerClientEvent("lb-newsapp:cb:response", src, requestId, nil)
        end
    end)
end

---@param event string
---@param callback fun(source: number, phoneNumber?: string, ...) : ...
---@param defaultReturn any
function BaseCallback(event, callback, defaultReturn)
    RegisterCallback(event, function(source, ...)
        local exportExists, phoneNumber = pcall(function()
            return exports["lb-phone"]:GetEquippedPhoneNumber(source)
        end)

        return callback(source, phoneNumber, ...)
    end)
end
