-- cfg = {
-- 	damageFactorEngine = 2.0,					-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
-- 	damageFactorBody = 2.0,						-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
-- 	damageFactorPetrolTank = 1.0,				-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 64

-- 	engineLessDamageThreshold = 300,
-- 	engineLessDamageFactor = 1.0,

-- 	engineSafeGuard = 100.0,					-- Final failure value. Set it too high, and the vehicle won't smoke when disabled. Set too low, and the car will catch fire from a single bullet to the engine. At health 100 a typical car can take 3-4 bullets to the engine before catching fire.

-- 	compatibilityMode = false,					-- prevents other scripts from modifying the fuel tank health to avoid random engine failure with BVA 2.01 (Downside is it disabled explosion prevention)

-- 	classDamageMultiplier = {
-- 		[0] = 	1.0,		--	0: Compacts
-- 				1.0,		--	1: Sedans
-- 				1.0,		--	2: SUVs
-- 				0.95,		--	3: Coupes
-- 				1.0,		--	4: Muscle
-- 				0.95,		--	5: Sports Classics
-- 				0.95,		--	6: Sports
-- 				0.95,		--	7: Super
-- 				0.27,		--	8: Motorcycles
-- 				0.7,		--	9: Off-road
-- 				0.25,		--	10: Industrial
-- 				0.35,		--	11: Utility
-- 				0.85,		--	12: Vans
-- 				1.0,		--	13: Cycles
-- 				0.4,		--	14: Boats
-- 				0.7,		--	15: Helicopters
-- 				0.7,		--	16: Planes
-- 				0.75,		--	17: Service
-- 				0.85,		--	18: Emergency
-- 				0.67,		--	19: Military
-- 				0.43,		--	20: Commercial
-- 				1.0			--	21: Trains
-- 	}
-- }

-- function Set(list)
-- 	local set = {}
-- 	for _, l in ipairs(list) do set[GetHashKey(l)] = true end
-- 	return set
-- end

-- function HashSet(list)
-- 	local set = {}
-- 	for _, l in ipairs(list) do set[GetHashKey(l)] = true end
-- 	return set
-- end

-- vehicleConfigs = {
-- 	tirePoppingDefaultHeight = 5.0,
-- 	tirePoppingDefaultChance = 43200,
-- 	tirePoppingGroups = {
-- 		{ -- grupo shotaro :vomit"
-- 			models = HashSet {
-- 				'shotaro',
-- 			},

-- 			popHeight = 3.0,
-- 			popChance = 43200 / 4,
-- 		},
-- 		{ -- blazer que anda na agua
-- 			models = HashSet {
-- 				'blazer5', 'deluxo', 'toreador',
-- 			},

-- 			popHeight = 500.0,
-- 			popChance = 43200 * 10,
-- 		},
-- 		{ -- grupo monster
-- 			models = HashSet {
-- 				'monster', 'marshall', 'trophytruck', 'trophytruck2',
-- 			},

-- 			popHeight = 16.0,
-- 			popChance = 43200 * 3,
--             resistant = true,
-- 		},
-- 		{ -- grupo off-road
-- 			models = HashSet {
-- 				'sanchez', 'sanchez2', 'manchez', 'enduro', 'bf400', 'policeb2', 'beachp',
-- 				'blazer', 'rbgator', 'guardian', 'dubsta3', 'kamacho', 'brawler', 'sandking', 'sandking2',
-- 				'mesa3', 'riata', 'caracara2', 'outlaw', 'everon', 'verus', 'manchez2',
-- 			},

-- 			popHeight = 11.0,
-- 			popChance = 43200 * 3,
-- 		},
-- 		{ -- grupo off-road um pouco menos
-- 			models = HashSet {
-- 				'cliffhanger', 'gargoyle', 'deathbike', 'blazer3', 'contender', 'freecrawler',
-- 				'brutus', 'briosoc3', 'rebel', 'rebel2', 'bfinjection', 'hellion', 'vagrant',
-- 				'yosemite3', 'rumpo3', 'bmx', 'polconvict',
-- 			},

-- 			popHeight = 9.0,
-- 			popChance = 43200 * 2,
-- 		},
-- 		{ -- grupo off-road menos
-- 			models = HashSet {
-- 				'blazer4', 'pscout', 'pscout2020',

-- 				'policeb', 'policeb1',

-- 				'flashgt', 'gb200', 'tropos', 'sultanrs', 'winky', 'omnis',
-- 			},
-- 			classes = Set { 2, 8, 9 },

-- 			popHeight = 7.0,
-- 			popChance = 43200 * 2,
-- 		},
-- 	},
-- }

-- math.randomseed(GetGameTimer())

-- local function isPedDrivingAVehicle()
-- 	local ped = GetPlayerPed(-1)
-- 	vehicle = GetVehiclePedIsIn(ped, false)
-- 	if IsPedInAnyVehicle(ped, false) then
-- 		-- Check if ped is in driver seat
-- 		if GetPedInVehicleSeat(vehicle, -1) == ped then
-- 			local class = GetVehicleClass(vehicle)
-- 			-- We don't want planes, helicopters, bicycles and trains
-- 			if class ~= 14 and class ~= 15 and class ~= 16 and class ~= 21 then
-- 				return true
-- 			end
-- 		end
-- 	end
-- 	return false
-- end

-- local CruiseIsOn, CruiseSpeed = false, 0
-- AddEventHandler('k_vehicle_real:setCruise', function(on, speed)
-- 	CruiseIsOn, CruiseSpeed = on, speed
-- end)

-- local force_burst = false
-- RegisterNetEvent('k_vehicle_real:forceBurst')
-- AddEventHandler('k_vehicle_real:forceBurst', function()
-- 	force_burst = true
-- end)

-- local fLowSpeedTractionLossMult = 0.0
-- local vehicle_is_ramping = false
-- local disable_controls = false
-- local ct = 0
-- local burstTires = 0

-- local menu_open_push = false
-- local isPushableVehicle = false
-- local isPushingVehicle = false
-- local vehicleInUse = nil
-- local vehicleInFront = nil

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(100)

-- 		if isPedDrivingAVehicle() then
-- 			local playerPed = PlayerPedId()
-- 			local vehicle = GetVehiclePedIsIn(playerPed, false)
-- 			local speed = GetEntitySpeed(vehicle)

-- 			local vehicle_engine_health = GetVehicleEngineHealth(vehicle)
-- 			local vehicle_petrol_tank = GetVehiclePetrolTankHealth(vehicle)
-- 			local vehicle_body_health = GetVehicleBodyHealth(vehicle)
-- 			isPushableVehicle = false
-- 			SetVehicleReceivesRampDamage(vehicle, true)
-- 			burstTires = 0
-- 			for i, v in ipairs({0, 1, 2, 3, 4, 5, 45, 47}) do
-- 				if IsVehicleTyreBurst(vehicle, v, false) then
-- 					burstTires = burstTires + 1

-- 					if speed > 5.0 then
-- 						if not IsVehicleTyreBurst(vehicle, v, true) then
-- 							if math.random(1, 80) == 1 then
-- 								SetVehicleTyreBurst(vehicle, v, true, 1000.0)
-- 							end
-- 						end
-- 					end
-- 				end
-- 			end

--             SetVehicleReduceGrip(vehicle, burstTires > 0)
--             SetVehicleReduceTraction(vehicle, burstTires > 0)

-- 			if burstTires > 0 then
-- 				local maxSpeed = 8.0 - burstTires
-- 				if speed < maxSpeed + 0.1 then
-- 					SetEntityMaxSpeed(vehicle, maxSpeed)
-- 				end

-- 				if speed > 1.0 then
-- 					local f = speed / 20 * burstTires
-- 					SetVehicleEngineHealth(vehicle, vehicle_engine_health - f)
-- 					SetVehicleBodyHealth(vehicle, vehicle_body_health - f)
-- 				end
-- 			elseif CruiseIsOn then
-- 				if speed <= CruiseSpeed + 1 then -- margem de erro
-- 					SetEntityMaxSpeed(vehicle, CruiseSpeed)
-- 				else
-- 					SetEntityMaxSpeed(vehicle, speed)
-- 				end
-- 			else
-- 				SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel"))
-- 			end

--             local veh_model = GetEntityModel(vehicle)
--             local height_min = vehicleConfigs.tirePoppingDefaultHeight
--             local popping_chance = vehicleConfigs.tirePoppingDefaultChance
--             local isResistant = false
--             for i, group in ipairs(vehicleConfigs.tirePoppingGroups) do
--                 if (group.models and group.models[veh_model]) or (group.classes and group.classes[veh_class]) then
--                     height_min = group.popHeight
--                     popping_chance = group.popChance
--                     isResistant = group.resistant
--                     break
--                 end
--             end

-- 			if speed > 5.5 and not IsThisModelAHeli(veh_model) and not IsThisModelABoat(veh_model) then
--                 local veh_height = GetEntityHeightAboveGround(vehicle)

--                 local veh_class = GetVehicleClass(vehicle)

--                 -- estourar pneu de carro rampando
--                 if not vehicle_is_ramping and veh_height >= 3.0 then
--                     vehicle_is_ramping = true

--                     Citizen.CreateThread(function()
--                         local times = 0
--                         while (veh_height > 1.5 and veh_height < height_min) or times < 8 do -- tá na faixa que tá rampando mas não estourando
--                             times = times + 1

--                             Citizen.Wait(100)

--                             veh_height = GetEntityHeightAboveGround(vehicle)
--                         end

--                         if veh_height >= height_min then
--                             local vehicle_velocity = GetEntityVelocity(vehicle)
--                             while GetEntityHeightAboveGround(vehicle) > 1.5 do
--                                 Citizen.Wait(0)
--                             end

--                             local coords = GetEntityCoords(vehicle)
--                             local success, groundCoords = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, 0)
--                             if coords.z >= 1.5 or success then -- se não caiu no limbo
--                                 -- encostou no chão
--                                 if GetVehicleTyresCanBurst(vehicle) then
--                                     SetVehicleTyreBurst(vehicle, 0, true, 1000.0)
--                                     SetVehicleTyreBurst(vehicle, 1, true, 1000.0)
--                                     SetVehicleTyreBurst(vehicle, 2, true, 1000.0)
--                                     SetVehicleTyreBurst(vehicle, 3, true, 1000.0)
--                                     SetVehicleTyreBurst(vehicle, 4, true, 1000.0)
--                                     SetVehicleTyreBurst(vehicle, 5, true, 1000.0)
--                                     SetVehicleTyreBurst(vehicle, 6, true, 1000.0)
--                                 end

--                                 SetVehicleEngineHealth(vehicle, 0.0)

--                                 if IsPedInVehicle(playerPed, vehicle, false) then
--                                     ShakeGameplayCam('MEDIUM_EXPLOSION_SHAKE', 1.2)

--                                     if IsThisModelABike(veh_model) then
--                                         TaskLeaveAnyVehicle(playerPed, 0, 0) --tira a pessoa de dentro do veiculo
--                                         SetPedToRagdoll(playerPed, 0, 0, 0, 0, 0, 0)
--                                         ClearPedTasksImmediately(playerPed)
--                                         SetEntityVelocity(playerPed, vehicle_velocity)
--                                         SetEntityVelocity(vehicle, vehicle_velocity)
--                                         Citizen.Wait(1000)
-- 										TriggerEvent("Notify","importante","Você quebrou as pernas.")

--                                         while IsPedRagdoll(playerPed) or IsPedRunningRagdollTask(playerPed) do
--                                             Citizen.Wait(1)
--                                         end
--                                         Citizen.Wait(100)
--                                         SetPedToRagdollWithFall(playerPed, 5000, 5000, 0, GetEntityForwardVector(playerPed), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
--                                     end
--                                 end
--                             end
--                         end

--                         vehicle_is_ramping = false
--                     end)
--                 end

--                 ct = ct + 1
--                 if ct >= 10 then -- só de segundo em segundo
--                     ct = 0
--                     if force_burst or math.random() < 1 / popping_chance then
--                         local numWheels = GetVehicleNumberOfWheels(vehicle)
--                         local affectedTire
--                         if numWheels == 2 then
--                             affectedTire = (math.random(2) - 1) * 4 -- wheel 0 or 4
--                         elseif numWheels == 4 then
--                             affectedTire = (math.random(4) - 1)
--                             if affectedTire > 1 then affectedTire = affectedTire + 2 end -- 0, 1, 4, 5
--                         elseif numWheels == 6 then
--                             affectedTire = (math.random(6) - 1)
--                         else
--                             affectedTire = 0
--                         end

--                         SetVehicleTyreBurst(vehicle, affectedTire, false, 1000.0)
--                         force_burst = false
--                     end
--                 end
-- 			end

-- 			local vehicle_roll = math.abs(GetEntityRoll(vehicle))

-- 			local vehicle_class = GetVehicleClass(vehicle)
-- 			if vehicle_class == 8 then
-- 				if (not isResistant and vehicle_roll > 90) or vehicle_roll > 160 then
-- 					local coords = GetEntityCoords(vehicle)
-- 					local success, groundCoords = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, 0)
-- 					if success then
-- 						SetVehicleEngineHealth(vehicle, vehicle_engine_health - 0.1)
-- 						SetVehiclePetrolTankHealth(vehicle, vehicle_petrol_tank - 0.1)
-- 					end
-- 				end
-- 				disable_controls = false
-- 			elseif vehicle_class ~= 14 and vehicle_class ~= 15 and vehicle_class ~= 16 then
-- 				if vehicle_roll > 75 then
-- 					local coords = GetEntityCoords(vehicle)
-- 					local success, groundCoords = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, 0)
-- 					if success then
-- 						SetVehicleEngineHealth(vehicle, vehicle_engine_health - 1)
-- 						SetVehiclePetrolTankHealth(vehicle, vehicle_petrol_tank - 100)

-- 						if not disable_controls then
-- 							disable_controls = true
-- 							Citizen.CreateThread(function()
-- 								while disable_controls do
-- 									Citizen.Wait(0)
-- 									DisableControlAction(2, 59, true) -- Disable left/right
-- 									DisableControlAction(2, 60, true) -- Disable up/down
-- 									DisableControlAction(2, 61, true)
-- 									DisableControlAction(2, 62, true)
-- 									DisableControlAction(2, 63, true)
-- 									DisableControlAction(2, 64, true)
-- 									DisableControlAction(2, 278, true)
-- 									DisableControlAction(2, 279, true)
-- 									DisableControlAction(2, 280, true)
-- 									DisableControlAction(2, 281, true)
-- 								end
-- 							end)
-- 						end
-- 					end
-- 				else
-- 					disable_controls = false
-- 				end
-- 			end
-- 		else
-- 			local playerPed = PlayerPedId()
-- 			local playerCoords = GetEntityCoords(playerPed)
-- 			local vehicle = GetClosestVehicle(playerCoords.x,  playerCoords.y,  playerCoords.z,  6.0,  0,  71)
-- 			local burstedTires = false
-- 			for i, v in ipairs({0, 1, 2, 3, 4, 5}) do
-- 				if IsVehicleTyreBurst(vehicle, v, false) then
-- 					burstedTires = true
-- 				end
-- 			end
-- 			if  vehicle ~= nil and ( GetVehicleEngineHealth(vehicle) < cfg.engineSafeGuard  or burstedTires == true ) and GetVehicleClass(vehicle) ~=20 then
-- 				isPushableVehicle = true
-- 			else
-- 				isPushableVehicle = false
-- 			end
-- 			Citizen.Wait(1000)
-- 		end
-- 	end
-- end)


-- Citizen.CreateThread(function()
-- 	local lastEngineHealth = 1000
-- 	local lastBodyHealth = 1000
-- 	local lastPetrolHealth = 1000
-- 	local lastVehicle = nil

-- 	while true do
-- 		Citizen.Wait(100)

-- 		local ped = GetPlayerPed(-1)

-- 		if isPedDrivingAVehicle() then
-- 			local vehicle = GetVehiclePedIsIn(ped, false)

-- 			if not IsEntityInWater(vehicle) then
-- 				local engineHealth = GetVehicleEngineHealth(vehicle)
-- 				local bodyHealth = GetVehicleBodyHealth(vehicle)
-- 				local petrolHealth = GetVehiclePetrolTankHealth(vehicle)

-- 				local healthToUse = engineHealth
				
-- 				if healthToUse < 900 then
-- 					if healthToUse < 100 then
-- 						healthToUse = 100
-- 					end

-- 					torqueMultiplier = healthToUse / 1000
-- 				else
-- 					torqueMultiplier = nil
-- 				end

-- 				if vehicle == lastVehicle then
-- 					if engineHealth < 1000 or bodyHealth < 1000 or petrolHealth < 1000 then
-- 						local engineDelta = lastEngineHealth - engineHealth
-- 						if engineDelta > 0 then
-- 							if engineHealth > cfg.engineLessDamageThreshold then
-- 								engineHealth = lastEngineHealth - engineDelta * cfg.damageFactorEngine
-- 								if engineHealth < cfg.engineLessDamageThreshold then
-- 									engineHealth = 300.0
-- 								end
-- 							else
-- 								engineHealth = lastEngineHealth - engineDelta * cfg.engineLessDamageFactor
-- 							end
-- 						end

--                         if engineHealth <= cfg.engineLessDamageThreshold then
--                             local speed = GetEntitySpeed(vehicle)
--                             if speed > 1.0 then
--                                 engineHealth = engineHealth - speed / 20
--                             end
--                         end
--                         SetVehicleEngineHealth(vehicle, engineHealth)

-- 						local bodyDelta = lastBodyHealth - bodyHealth
-- 						if bodyDelta > 0 then
-- 							bodyHealth = lastBodyHealth - bodyDelta * cfg.damageFactorBody
-- 							SetVehicleBodyHealth(vehicle, bodyHealth)

--                             local totalDelta = lastBodyHealth - bodyHealth
--                             local veh_model = GetEntityModel(vehicle)
--                             if totalDelta > 100 and model ~= `riot` and model ~= `tarv` then
--                                 SetVehicleEngineOn(vehicle, false, false, false)
--                                 DecorSetBool(vehicle, 'VI:engineOn', false)
--                                 DecorSetBool(vehicle, 'VI:carDead', true)

--                                 Citizen.CreateThread(function()
--                                     local time = math.ceil((1000 - bodyHealth) * 20)
--                                     if time > 6000 then time = 6000 end

--                                     Citizen.Wait(1000 + time)
--                                     DecorSetBool(vehicle, 'VI:carDead', false)
--                                 end)
--                             end
-- 						end

-- 						local petrolDelta = lastPetrolHealth - petrolHealth
-- 						if petrolDelta > 0 then
-- 							petrolHealth = lastPetrolHealth - petrolDelta * cfg.damageFactorPetrolTank
-- 							SetVehiclePetrolTankHealth(vehicle, petrolHealth)
-- 						end
-- 					end
-- 				else
-- 					isElectric = false
-- 				end

-- 				lastEngineHealth = engineHealth
-- 				lastBodyHealth = bodyHealth
-- 				lastPetrolHealth = petrolHealth
-- 				lastVehicle = vehicle
-- 			else
-- 				torqueMultiplier = nil
-- 				Citizen.Wait(1000)
-- 			end
-- 		else
-- 			torqueMultiplier = nil
-- 			Citizen.Wait(1000)
-- 		end
-- 	end
-- end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- ENGINABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local engineDelta = 0.0
local engineScaled = 0.0
local engineNew = 1000.0
local engineLast = 1000.0
local engineCurrent = 1000.0
-----------------------------------------------------------------------------------------------------------------------------------------
-- BODYABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local bodyDelta = 0.0
local bodyScaled = 0.0
local bodyNew = 1000.0
local bodyLast = 1000.0
local bodyCurrent = 1000.0
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local lastVehicle = nil
local sameVehicle = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLASSDAMAGE
-----------------------------------------------------------------------------------------------------------------------------------------
local classDamage = { 1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,0.5,1.0,1.0,1.0,1.0,0.0,0.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0 }
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHEALTHVEH
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsUsing(ped)
			local vehClass = GetVehicleClass(vehicle)
			if vehClass ~= 13 and vehClass ~= 14 then
				timeDistance = 1

				if sameVehicle then
					local engineTorque = 1.0
					if engineNew < 900 then
						engineTorque = (engineNew + 200.0) / 1100
					end

					SetVehicleEngineTorqueMultiplier(vehicle,engineTorque)
				end

				if GetPedInVehicleSeat(vehicle,-1) == ped then
					local vehRoll = GetEntityRoll(vehicle)
					if vehRoll > 75.0 or vehRoll < -75.0 then
						DisableControlAction(1,59,true)
						DisableControlAction(1,60,true)
					end
				end

				engineCurrent = GetVehicleEngineHealth(vehicle)
				if engineCurrent >= 1000 then
					engineLast = 1000.0
				end

				engineNew = engineCurrent
				engineDelta = engineLast - engineCurrent
				engineScaled = engineDelta * 0.6 * classDamage[vehClass + 1]

				bodyCurrent = GetVehicleBodyHealth(vehicle)
				if bodyCurrent >= 1000 then
					bodyLast = 1000.0
				end

				bodyNew = bodyCurrent
				bodyDelta = bodyLast - bodyCurrent
				bodyScaled = bodyDelta * 0.6 * classDamage[vehClass + 1]

				if engineCurrent > 101.0 and bodyCurrent > 101.0 then
					SetVehicleUndriveable(vehicle,false)
				end

				if engineCurrent <= 101.0 or bodyCurrent <= 101.0 then
					SetVehicleUndriveable(vehicle,true)
				end

				if vehicle ~= lastVehicle then
					sameVehicle = false
				end

				if sameVehicle then
					if engineCurrent ~= 1000.0 or bodyCurrent ~= 1000.0 then
						local engineCombine = math.max(engineScaled,bodyScaled)
						if engineCombine > (engineCurrent - 100.0) then
							engineCombine = engineCombine * 0.7
						end

						if engineCombine > engineCurrent then
							engineCombine = engineCurrent - (210.0 / 5)
						end
						engineNew = engineLast - engineCombine

						if engineNew > 210.0 and engineNew < 350.0 then
							engineNew = engineNew - (0.038 * 7.4)
						end

						if engineNew < 210.0 then
							engineNew = engineNew - (0.1 * 1.5)
						end

						if engineNew < 100.0 then
							engineNew = 100.0
						end

						if bodyNew < 0 then
							bodyNew = 0.0
						end
					end
				else
					if bodyCurrent < 100.0 then
						bodyNew = 100.0
					end

					if engineCurrent < 100.0 then
						engineNew = 100.0
					end

					sameVehicle = true
				end

				if engineNew ~= engineCurrent then
					SetVehicleEngineHealth(vehicle,engineNew)
				end

				if bodyNew ~= bodyCurrent then
					SetVehicleBodyHealth(vehicle,bodyNew)
				end

				SetVehiclePetrolTankHealth(vehicle,1000.0)

				bodyLast = bodyNew
				engineLast = engineNew
				lastVehicle = vehicle
			end
		else
			sameVehicle = false
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TYREEXPLOSION
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local veh = GetVehiclePedIsUsing(ped)
			if GetPedInVehicleSeat(veh,-1) == ped then
				local vehRoll = GetEntityRoll(veh)
				if vehRoll > 75.0 or vehRoll < -75.0 then
					if math.random(100) <= 50 and GetVehicleClass(veh) ~= 8 then
						local wheelTyres = math.random(4)
						if wheelTyres == 1 then
							if not IsVehicleTyreBurst(veh,0,false) then
								SetVehicleTyreBurst(veh,0,true,1000.0)
							end
						elseif wheelTyres == 2 then
							if not IsVehicleTyreBurst(veh,1,false) then
								SetVehicleTyreBurst(veh,1,true,1000.0)
							end
						elseif wheelTyres == 3 then
							if not IsVehicleTyreBurst(veh,4,false) then
								SetVehicleTyreBurst(veh,4,true,1000.0)
							end
						elseif wheelTyres == 4 then
							if not IsVehicleTyreBurst(veh,5,false) then
								SetVehicleTyreBurst(veh,5,true,1000.0)
							end
						end
					end
				end
			end
		end

		Citizen.Wait(1000)
	end
end)