local vehiclesToProtect = {}

RegisterServerEvent("nemazatvozidlo:checkVehicle")
AddEventHandler("nemazatvozidlo:checkVehicle", function(plate)
    table.insert(vehiclesToProtect, plate)
end)

Citizen.CreateThread(function()
    while true do
        Wait(Config.Minutes * 60000)
        TriggerClientEvent('okokNotify:Alert', -1, 'Mazání Vozidel', Config.Timer5MINUTES, 5000, 'info', playSound)
        Wait(300000)
        TriggerClientEvent('okokNotify:Alert', -1, 'Mazání Vozidel', Config.Timer1MINUTE, 5000, 'info', playSound)
        Wait(45000)
        TriggerClientEvent('okokNotify:Alert', -1, 'Mazání Vozidel', Config.Timer10SECONDS, 5000, 'info', playSound)
        Wait(10000)
        TriggerClientEvent('okokNotify:Alert', -1, 'Mazání Vozidel', Config.Timer5SECONDS, 5000, 'info', playSound)
        Wait(5000)

        for i, veh in pairs(GetAllVehicles()) do
            local plate = GetVehicleNumberPlateText(veh)
            if HasVehicleBeenOwnedByPlayer(veh) and not isVehicleOccupied(veh) and not TableContains(vehiclesToProtect, plate) then
                DeleteEntity(veh)
            end
        end
        TriggerClientEvent('okokNotify:Alert', -1, 'Mazání Vozidel', Config.VehiclesDeleted, 5000, 'success', playSound)
    end
end)

function isVehicleOccupied(veh)
    for seat = -1, 6 do
        if GetPedInVehicleSeat(veh, seat) ~= 0 then
            return true
        end
    end
    return false
end

function TableContains(table, element)
    for _, value in ipairs(table) do
        if value == element then
            return true
        end
    end
    return false
end