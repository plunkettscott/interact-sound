
------
-- InteractionSound by Scott
-- Version: v0.0.1
-- Path: client/main.lua
--
-- Allows sounds to be played on single clients, all clients, or all clients within
-- a specific range from the entity to which the sound has been created.
------

local pos
local songCoords
local volumeSend
local maxDist
local distance
local stop = true

local standardVolumeOutput = 0.3;
local hasPlayerLoaded = false
Citizen.CreateThread(function()
	Wait(15000)
	hasPlayerLoaded = true
end)
------
-- RegisterNetEvent LIFE_CL:Sound:PlayOnOne
--
-- @param soundFile    - The name of the soundfile within the client/html/sounds/ folder.
--                     - Can also specify a folder/sound file.
-- @param soundVolume  - The volume at which the soundFile should be played. Nil or don't
--                     - provide it for the default of standardVolumeOutput. Should be between
--                     - 0.1 to 1.0.
--
-- Starts playing a sound locally on a single client.
------
RegisterNetEvent('InteractSound_CL:PlayOnOne')
AddEventHandler('InteractSound_CL:PlayOnOne', function(soundFile, soundVolume)
    if hasPlayerLoaded then
        SendNUIMessage({
            transactionType = 'playSound',
            transactionFile  = soundFile,
            transactionVolume = soundVolume
        })
    end
end)

------
-- RegisterNetEvent LIFE_CL:Sound:PlayOnAll
--
-- @param soundFile    - The name of the soundfile within the client/html/sounds/ folder.
--                     - Can also specify a folder/sound file.
-- @param soundVolume  - The volume at which the soundFile should be played. Nil or don't
--                     - provide it for the default of standardVolumeOutput. Should be between
--                     - 0.1 to 1.0.
--
-- Starts playing a sound on all clients who are online in the server.
------
RegisterNetEvent('InteractSound_CL:PlayOnAll')
AddEventHandler('InteractSound_CL:PlayOnAll', function(soundFile, soundVolume)
    if hasPlayerLoaded then
        SendNUIMessage({
            transactionType = 'playSound',
            transactionFile = soundFile,
            transactionVolume = soundVolume or standardVolumeOutput
        })
    end
end)

------
-- RegisterNetEvent LIFE_CL:Sound:PlayWithinDistance
--
-- @param playOnEntity    - The entity network id (will be converted from net id to entity on client)
--                        - of the entity for which the max distance is to be drawn from.
-- @param maxDistance     - The maximum float distance (client uses Vdist) to allow the player to
--                        - hear the soundFile being played.
-- @param soundFile       - The name of the soundfile within the client/html/sounds/ folder.
--                        - Can also specify a folder/sound file.
-- @param soundVolume     - The volume at which the soundFile should be played. Nil or don't
--                        - provide it for the default of standardVolumeOutput. Should be between
--                        - 0.1 to 1.0.
--
-- Starts playing a sound on a client if the client is within the specificed maxDistance from the playOnEntity.
-- @TODO Change sound volume based on the distance the player is away from the playOnEntity.
------
RegisterNetEvent('InteractSound_CL:PlayWithinDistance')
AddEventHandler('InteractSound_CL:PlayWithinDistance', function(otherPlayerCoords, maxDistance, soundFile, soundVolume)
	if hasPlayerLoaded then
        if tonumber(otherPlayerCoords) then
            songCoords = NetworkGetPlayerCoords(otherPlayerCoords)

        else 
            songCoords = otherPlayerCoords
        end
		distance = #(GetEntityCoords(GetPlayerPed(-1)) - songCoords)
	
		if distance < maxDistance then
			SendNUIMessage({
				transactionType = 'playSound',
				transactionFile  = soundFile,
				transactionVolume = soundVolume,
			})
		end
        
		volumeSend = soundVolume
		maxDist = maxDistance
	end
end)

----------------------------
-- This will make (approximate) change sound volume based on the distance the player is away from the position of the sound. EXPERIMENTAL --
----------------------------

Citizen.CreateThread(function()
    Wait(7000)
	while true do   
		pos = GetEntityCoords(PlayerPedId())
        if songCoords ~= nil and volumeSend ~= nil and maxDist ~= nil then
            if distance < maxDist then
                if Vdist(pos.x, pos.y, pos.z, songCoords) <= maxDist/10*1 then
                    local DistVol = volumeSend
                    SendNUIMessage({
                        transactionType = "volume",
                        volNUI = DistVol,			
                    })
                elseif Vdist(pos.x, pos.y, pos.z, songCoords) >= maxDist/10*2 and Vdist(pos.x, pos.y, pos.z, songCoords) < maxDist/10*3 then
                    local DistVol = volumeSend - 0.1
                    SendNUIMessage({
                        transactionType = "volume",
                        volNUI = DistVol,			
                    })
                elseif Vdist(pos.x, pos.y, pos.z, songCoords) >= maxDist/10*3 and Vdist(pos.x, pos.y, pos.z, songCoords) < maxDist/10*4 then
                    local DistVol = volumeSend - 0.2
                    SendNUIMessage({
                        transactionType = "volume",
                        volNUI = DistVol,			
                    })
                elseif Vdist(pos.x, pos.y, pos.z, songCoords) >= maxDist/10*4 and Vdist(pos.x, pos.y, pos.z, songCoords) < maxDist/10*5 then
                    local DistVol = volumeSend - 0.3
                    SendNUIMessage({
                        transactionType = "volume",
                        volNUI = DistVol,			
                    })
                elseif Vdist(pos.x, pos.y, pos.z, songCoords) >= maxDist/10*5 and Vdist(pos.x, pos.y, pos.z, songCoords) < maxDist/10*6 then
                    local DistVol = volumeSend - 0.4
                    SendNUIMessage({
                        transactionType = "volume",
                        volNUI = DistVol,			
                    })
                elseif Vdist(pos.x, pos.y, pos.z, songCoords) >= maxDist/10*6 and Vdist(pos.x, pos.y, pos.z, songCoords) < maxDist/10*7 then
                    local DistVol = volumeSend - 0.5
                    SendNUIMessage({
                        transactionType = "volume",
                        volNUI = DistVol,			
                    })
                elseif Vdist(pos.x, pos.y, pos.z, songCoords) >= maxDist/10*7 and Vdist(pos.x, pos.y, pos.z, songCoords) < maxDist/10*8 then
                    local DistVol = volumeSend - 0.6
                    SendNUIMessage({
                        transactionType = "volume",
                        volNUI = DistVol,			
                    })						
                elseif Vdist(pos.x, pos.y, pos.z, songCoords) >= maxDist/10*8 and Vdist(pos.x, pos.y, pos.z, songCoords) < maxDist/10*9 then						
                    local DistVol = volumeSend - 0.68
                    SendNUIMessage({
                        transactionType = "volume",
                        volNUI = DistVol,			
                    })
                elseif Vdist(pos.x, pos.y, pos.z, songCoords) >= maxDist/10*9 and Vdist(pos.x, pos.y, pos.z, songCoords) < maxDist/10*9.5 then
                    local DistVol = volumeSend - 0.75
                    SendNUIMessage({
                        transactionType = "volume",
                        volNUI = DistVol,			
                    })
                elseif Vdist(pos.x, pos.y, pos.z, songCoords) >= maxDist/10*9.5 then
                    local DistVol = volumeSend - 0.78
                    SendNUIMessage({
                        transactionType = "volume",
                        volNUI = DistVol,			
                    })
                end
            else 
                SendNUIMessage({
                    transactionType = 'stop',	
                })
            end
        end
	Citizen.Wait(3)
	end
end)

