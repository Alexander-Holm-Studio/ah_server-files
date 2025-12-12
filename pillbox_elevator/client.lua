-- Use ox_lib notification
function ShowNotification(msg)
    exports.ox_lib:notify({
        title = 'Elevator',
        description = msg,
        type = 'inform',
        position = 'top',
        duration = 3500
    })
end

function ShowElevatorMenu(elevator, current)
    local options = {}
    if current == 'up' then
        table.insert(options, {
            title = elevator.down.label,
            description = 'Take the elevator down',
            icon = 'fa-solid fa-arrow-down',
            onSelect = function()
                SetEntityCoords(PlayerPedId(), elevator.down.coords.x, elevator.down.coords.y, elevator.down.coords.z,
                    false, false, false, false)
                SetEntityHeading(PlayerPedId(), elevator.down.coords.w)
                ShowNotification('You took the elevator down.')
            end
        })
    else
        table.insert(options, {
            title = elevator.up.label,
            description = 'Take the elevator up',
            icon = 'fa-solid fa-arrow-up',
            onSelect = function()
                SetEntityCoords(PlayerPedId(), elevator.up.coords.x, elevator.up.coords.y, elevator.up.coords.z, false,
                    false, false, false)
                SetEntityHeading(PlayerPedId(), elevator.up.coords.w)
                ShowNotification('You took the elevator up.')
            end
        })
    end
    exports.ox_lib:registerContext({
        id = 'pillbox_elevator',
        title = elevator.label,
        options = options
    })
    exports.ox_lib:showContext('pillbox_elevator')
end

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        for _, elevator in ipairs(Config.Elevators) do
            local distUp = #(playerCoords - vector3(elevator.up.coords.x, elevator.up.coords.y, elevator.up.coords.z))
            local distDown = #(playerCoords - vector3(elevator.down.coords.x, elevator.down.coords.y, elevator.down.coords.z))
            if distUp < 2.0 then
                exports.ox_lib:showTextUI('[E] ' .. elevator.up.label)
                if IsControlJustReleased(0, 38) then -- E
                    ShowElevatorMenu(elevator, 'up')
                end
            elseif distDown < 2.0 then
                exports.ox_lib:showTextUI('[E] ' .. elevator.down.label)
                if IsControlJustReleased(0, 38) then -- E
                    ShowElevatorMenu(elevator, 'down')
                end
            else
                exports.ox_lib:hideTextUI()
            end
        end
        Wait(0)
    end
end)
