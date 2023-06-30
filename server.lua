ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('ShameV_givekey:giveKey')
AddEventHandler('ShameV_givekey:giveKey', function(target, plate)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local tPlayer = ESX.GetPlayerFromId(target)

    MySQL.Async.execute(
        'UPDATE owned_vehicles SET owner = @owner WHERE owner = @oldOwner AND plate = @plate',
        {
            ['@owner']   = tPlayer.identifier,
            ['@oldOwner'] = xPlayer.identifier,
            ['@plate']   = plate
        },
        function (rowsChanged)
            if rowsChanged == 0 then
                TriggerClientEvent('esx:showNotification', _source, 'Fahrzeug nicht gefunden oder du bist nicht der Besitzer!')
            else
                TriggerClientEvent('esx:showNotification', _source, 'Du hast die Schlüssel übergeben!')
                TriggerClientEvent('esx:showNotification', target, 'Du hast neue Schlüssel erhalten!')
            end
        end
    )
end)
