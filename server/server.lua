ESX.RegisterUsableItem('lighter', function(player)
    local xPlayer = ESX.GetPlayerFromId(player)

    xPlayer.removeInventoryItem('lighter', 1)
    TriggerClientEvent('sokey-lighterUsed', player)
end)

RegisterServerEvent('sokey-lighterUsed', function(coords)
    TriggerClientEvent('sokey-lighterFire', -1, coords)
end)
