Utils = {
    ped = 0,
    vehicle = nil,
    driver = false,
    DriverCheck = function(self)
        if not self.vehicle then return false end
        if not DoesEntityExist(self.vehicle) then return false end
        if GetPedInVehicleSeat(self.vehicle, -1) == self.ped then
            return true
        end
        return false
    end,
    HudCheck = function(self)
        return GetResourceState(Config.HudResource) == 'started' and true or false
    end,
    SetHudState = function(self, state, seatbelt)
        if self:HudCheck() then
            local settings = seatbelt and Config.Seatbelt or Config.Cruise
            if settings.Enable then
                local success, result_or_error = pcall(function()
                    return settings.Export(state)
                end)
                if not success and result_or_error then
                    print(("^5[^3ERROR^5] ^1%s"):format(result_or_error))
                    print(("^5[^4INFO^5] ^0The two exports(CruiseControlState,SeatbeltState) in config.lua do not exist in your ^2%s^0 script.")
                    :format(Config.HudResource))
                end
            end
        end

        if seatbelt then return end

        lib.notify({
            title = 'Cruise Control',
            description = Translate(state and 'activated' or 'deactivated'),
            type = state and 'success' or 'info',
            icon = 'gauge-high',
            duration = 3000
        })
    end,
    IsSteering = function(self)
        return GetVehicleSteeringAngle(self.vehicle) > 10.0
    end,
    GetSpeed = function(self)
        if not self:DriverCheck() then return end
        local curSpeed = GetEntitySpeed(self.vehicle)
        return math.floor(curSpeed * 2.236936)
    end
}
