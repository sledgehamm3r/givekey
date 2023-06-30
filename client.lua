-- client.lua

ESX = exports["es_extended"]:getSharedObject()
RegisterCommand('givekey', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)

    if IsPedInAnyVehicle(playerPed,  false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if GetPedInVehicleSeat(vehicle, -1) == playerPed then
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

            if closestPlayer ~= -1 and closestDistance <= 3.0 then
                local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                TriggerServerEvent('ShameV_givekey:giveKey', GetPlayerServerId(closestPlayer), vehicleProps.plate)
            else
                ESX.ShowNotification('Kein Spieler in der Nähe')
            end
        else
            ESX.ShowNotification('Du musst auf dem Fahrersitz sitzen')
        end
    else
        ESX.ShowNotification('Du bist in keinem Fahrzeug')
    end
end, false)
