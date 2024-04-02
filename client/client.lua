RegisterCommand("nemazatvozidlo", function(source, args, rawCommand)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if DoesEntityExist(vehicle) then
        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerServerEvent("nemazatvozidlo:checkVehicle", plate) 
        exports['okokNotify']:Alert('Mazání Vozidel', 'Vozidlo Nebude automaticky smazáno', 5000, 'info', playSound)
    else
        exports['okokNotify']:Alert('Mazání Vozidel', 'Nejsi ve vozidle', 5000, 'error', playSound)
    end
end, false)