ESX = nil

local isRunningWorkaround = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end	
end)

function StartWorkaroundTask()
	if isRunningWorkaround then
		return
	end

	local timer = 0
	local playerPed = PlayerPedId()
	isRunningWorkaround = true

	while timer < 100 do
		Citizen.Wait(0)
		timer = timer + 1

		local vehicle = GetVehiclePedIsTryingToEnter(playerPed)

		if DoesEntityExist(vehicle) then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)

			if lockStatus == 4 then
				ClearPedTasks(playerPed)
			end
		end
	end

	isRunningWorkaround = false
end

function ToggleVehicleLock()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end

	ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerCars', function(isOwnedVehicle)

		if isOwnedVehicle then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)

			if lockStatus == 1 then -- unlocked
				SetVehicleDoorsLocked(vehicle, 2)
				PlayVehicleDoorCloseSound(vehicle, 1)
				
				-- TriggerEvent('chat:addMessage', { args = { _U('message_title'), _U('message_locked') } })
				exports['mythic_notify']:DoHudText('inform', 'Vehicle Unlocked')
			elseif lockStatus == 2 then -- locked
				SetVehicleDoorsLocked(vehicle, 1)
				PlayVehicleDoorOpenSound(vehicle, 0)

				-- TriggerEvent('chat:addMessage', { args = { _U('message_title'), _U('message_unlocked') } })
				exports['mythic_notify']:DoHudText('inform', 'Vehicle Locked')
			end
		end

	end, ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)))
end

Citizen.CreateThread(function()
	local dict = "anim@mp_player_intmenu@key_fob@"

	RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(300)
    end
	
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, 182) and IsInputDisabled(0) then
			ToggleVehicleLock()
			TaskPlayAnim(GetPlayerPed(-1), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
			StopAnimTask = true
			Citizen.Wait(300)
	
		-- D-pad down on controllers works, too!
		-- elseif IsControlJustReleased(0, 173) and not IsInputDisabled(0) then
		-- 	ToggleVehicleLock()
		-- 	Citizen.Wait(300)
		end
	end
end)
