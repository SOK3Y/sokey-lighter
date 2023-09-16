RegisterNetEvent('sokey-lighterUsed', function()
    if not IsinVehicle then
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local f = GetEntityForwardVector(player)
        local _ = coords + (f * 1.6)
        ESX.Progressbar("Podpalanie nawierzchni...", 3000,{
            FreezePlayer = true, 
            animation ={
                type = "anim",
                dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", 
                lib = "machinic_loop_mechandplayer"
            }, 
            onFinish = function()
                local streetName, crossingRoad = GetStreetNameAtCoord(_.x, _.y, _.z)
                local street1 = GetStreetNameFromHashKey(streetName)
                local street2 = GetStreetNameFromHashKey(crossingRoad)
                TriggerServerEvent('sokey-lighterUsed', _, street1, street2)
        end})
    end
end)

RegisterNetEvent('sokey-lighterFire', function(coords)
    if GetInteriorFromEntity(PlayerPedId()) == 0 then
        Citizen.Wait(1000)
        StartScriptFire(coords.x, coords.y, coords.z - 1.0, 2, true)
        Citizen.Wait(100)
        StartScriptFire(coords.x, coords.y, coords.z - 1.0, 2, true)
        StartScriptFire(coords.x, coords.y, coords.z - 1.0, 2, true)
        Citizen.Wait(6000)
        StopFireInRange(coords.x, coords.y, coords.z - 1.0, 0.2)
    end
end)