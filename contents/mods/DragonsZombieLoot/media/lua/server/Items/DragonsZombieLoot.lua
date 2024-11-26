--print("Distributions ready for Dragons Zombie Loot")
require 'Items/SuburbsDistributions'
--print("Running Dragons Zombie Loot")

function ModifyAllLoot()
	
	if(SandboxVars.DRAZL.BoolAddRangedWeapons ~= nil) then
		--print("We modify all loot")
		-- We subtract 1 from the dropdown lists to account for the indexing switch from list to array
		local bAddToMale = SandboxVars.DRAZL.BoolAddToMale
		local bAddToFemale = SandboxVars.DRAZL.BoolAddToFemale
		local fLootChanceFlat = SandboxVars.DRAZL.EnumLootChanceFlatAdjustment-1
		local fLootChanceMultiplier = SandboxVars.DRAZL.EnumLootChanceMultiplier-1
		local bAddModded = SandboxVars.DRAZL.BoolAddModded
		local bAddMisc = SandboxVars.DRAZL.BoolAddMisc
		local bAddFood = SandboxVars.DRAZL.BoolAddFood
		local bAddDrinks = SandboxVars.DRAZL.BoolAddDrinks
		local bAddMedical = SandboxVars.DRAZL.BoolAddMedical
		local bAddMaterials = SandboxVars.DRAZL.BoolAddMaterials	
		local bAddTools = SandboxVars.DRAZL.BoolAddTools
		local bAddMeleeWeapons = SandboxVars.DRAZL.BoolAddMeleeWeapons
		local bAddRangedWeapons = SandboxVars.DRAZL.BoolAddRangedWeapons
		
		ModifyZombieLoot(bAddToMale, bAddToFemale, fLootChanceFlat, fLootChanceMultiplier, bAddModded, bAddMisc, bAddFood, bAddDrinks, bAddMedical, bAddMaterials, bAddTools, bAddMeleeWeapons, bAddRangedWeapons)
	end
end


function ModifyZombieLoot(bAddToMale, bAddToFemale, fLootChanceFlat, fLootChanceMultiplier, bAddModded, bAddMisc, bAddFood, bAddDrinks, bAddMedical, bAddMaterials, bAddTools, bAddMeleeWeapons, bAddRangedWeapons)

	-- Initialize an array where we can store all distribution inventories
	local lootContainers = java.util.ArrayList:new()
	-- Initialize an array where we can store all the items we want to add to the distributions	
	local lootToAdd = java.util.ArrayList:new()	
	-- Initialize an array where we can store all flat settings values
	local LootChanceFlatAdjustment = java.util.ArrayList:new()
	-- Initialize an array where we can store all multiplier settings values
	local LootChanceMultiplierAdjustment = java.util.ArrayList:new()

		--==========Flat adjustment settings list==========
	LootChanceFlatAdjustment:add(2.0)	--1
	LootChanceFlatAdjustment:add(1.6)	--2
	LootChanceFlatAdjustment:add(1.2)	--3
	LootChanceFlatAdjustment:add(0.8)	--4
	LootChanceFlatAdjustment:add(0.4)	--5
	LootChanceFlatAdjustment:add(0.0)	--6 (default, no change)
	LootChanceFlatAdjustment:add(-0.4)	--7
	LootChanceFlatAdjustment:add(-0.8)	--8
	LootChanceFlatAdjustment:add(-1.2)	--9
	LootChanceFlatAdjustment:add(-1.6)	--10
	LootChanceFlatAdjustment:add(-2.0)	--11
	
	--==========Multiplier adjustment settings list==========	
	LootChanceMultiplierAdjustment:add(3.0)		--1
	LootChanceMultiplierAdjustment:add(2.6)		--2
	LootChanceMultiplierAdjustment:add(2.2)		--3
	LootChanceMultiplierAdjustment:add(1.8)		--4
	LootChanceMultiplierAdjustment:add(1.4)		--5
	LootChanceMultiplierAdjustment:add(1.0)		--6 (default, no change)
	LootChanceMultiplierAdjustment:add(0.9)	--7
	LootChanceMultiplierAdjustment:add(0.8)	--8
	LootChanceMultiplierAdjustment:add(0.7)	--9
	LootChanceMultiplierAdjustment:add(0.6)	--10
	LootChanceMultiplierAdjustment:add(0.5)	--11

	--print("Flat adjustment list:")
	--print(LootChanceFlatAdjustment)
	--print("Multiplier adjustment list:")
	--print(LootChanceMultiplierAdjustment)

	--==========Loot containers list==========
	if bAddToMale then
		lootContainers:add("inventorymale")
	end

	if bAddToFemale then
		lootContainers:add("inventoryfemale")
	end
	
	--==========Items to be added list==========
	-- Modded items that get added
	if bAddModded then
		
	end

	-- Misc items that get added
	if bAddMisc then
		lootToAdd:add("Base.Newspaper")
		lootToAdd:add(0.8)
		lootToAdd:add("Base.DishTowel")
		lootToAdd:add(0.05)
		lootToAdd:add("Base.WaterBottleEmpty")
		lootToAdd:add(0.6)
		lootToAdd:add("Base.PopBottleEmpty")
		lootToAdd:add(0.6)
		lootToAdd:add("Base.WhiskeyEmpty")
		lootToAdd:add(0.6)
	end	
	
	-- Food items that get added
	if bAddFood then
		lootToAdd:add("Base.Crisps")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.Crisps2")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.Crisps3")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.Crisps4")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.Chocolate")
		lootToAdd:add(0.05)
		lootToAdd:add("Base.GranolaBar")
		lootToAdd:add(0.05)
		lootToAdd:add("Base.Allsorts")
		lootToAdd:add(0.8)		
		lootToAdd:add("Base.MintCandy")
		lootToAdd:add(0.8)
		lootToAdd:add("Base.Peanuts")
		lootToAdd:add(0.8)
		lootToAdd:add("Base.SunflowerSeeds")
		lootToAdd:add(0.8)
		lootToAdd:add("Base.BeefJerky")
		lootToAdd:add(0.001)
		lootToAdd:add("Base.DehydratedMeatStick")
		lootToAdd:add(0.001)	
	end

	-- Drink items that get added
	if bAddDrinks then
	
		lootToAdd:add("Base.WhiskeyFull")
		lootToAdd:add(0.08)
		lootToAdd:add("Base.BeerCan")
		lootToAdd:add(0.08)
		lootToAdd:add("Base.WaterPopBottle")
		lootToAdd:add(0.12)
		lootToAdd:add("Base.PopBottle")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.Pop")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.Pop2")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.Pop3")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.JuiceBox")
		lootToAdd:add(0.1)
	end	
	
	-- Medical items that get added
	if bAddMedical then
		lootToAdd:add("Base.Disinfectant")
		lootToAdd:add(0.8)
		lootToAdd:add("Base.Tweezers")
		lootToAdd:add(0.5)
		lootToAdd:add("Base.Tissue")
		lootToAdd:add(0.8)
		lootToAdd:add("Base.AlcoholWipes")
		lootToAdd:add(0.7)
	end	

	-- Material items that get added
	if bAddMaterials then
		lootToAdd:add("Base.Nails")
		lootToAdd:add(1)
		lootToAdd:add("Base.Screws")
		lootToAdd:add(1)
		lootToAdd:add("Base.DuctTape")
		lootToAdd:add(0.2)
		lootToAdd:add("Base.Glue")
		lootToAdd:add(0.5)
		lootToAdd:add("Base.Battery")
		lootToAdd:add(0.6)
		lootToAdd:add("Base.PetrolCan")
		lootToAdd:add(0.005)
	end	

	-- Tools items that get added
	if bAddTools then
		lootToAdd:add("Base.Hammer")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.Spanner")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.Saw")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.PipeWrench")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.KitchenKnife")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.Pan")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.Torch")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.TinOpener")
		lootToAdd:add(0.1)
		lootToAdd:add("Base.EmptyPetrolCan")
		lootToAdd:add(0.01)
	end	
	
	-- MeleeWeapons items that get added
	if bAddMeleeWeapons then
		lootToAdd:add("Base.Axe")
		lootToAdd:add(0.0005)
		lootToAdd:add("Base.WoodAxe")
		lootToAdd:add(0.0001)
		lootToAdd:add("Base.Crowbar")
		lootToAdd:add(0.01)
		lootToAdd:add("Base.BaseballBat")
		lootToAdd:add(0.001)
		lootToAdd:add("Base.Sledgehammer")
		lootToAdd:add(0.0005)
	end	
	
	-- RangedWeapons items that get added
	if bAddRangedWeapons then
		lootToAdd:add("Base.ShotgunSawnoff")
		lootToAdd:add(0.0005)
		lootToAdd:add("Base.Pistol")
		lootToAdd:add(0.001)
	end	

		--print("LootToAdd size: "..lootToAdd:size())
		--print(lootToAdd)

	-- Iterate through all inventories
	for iContainersCount=lootContainers:size()-1, 0, -1 do
			
		-- Iterate through all items
		for ilootToAddCount=1, (lootToAdd:size() / 2), 1 do

			--LootChanceFlatAdjustment:get(fLootChanceFlat)
			--LootChanceMultiplierAdjustment:get(fLootChanceMultiplier)

			--Add item to loot table
			--print("Inserting: ".."SuburbsDistributions[\"all\"][\""..tostring(lootContainers:get(iContainersCount)).."\"].items, \""..tostring(lootToAdd:get(ilootToAddCount*2-2)).."\"")
			table.insert(SuburbsDistributions["all"][tostring(lootContainers:get(iContainersCount))].items,tostring((lootToAdd:get(ilootToAddCount*2-2))));
			
			--Add clamped item rarity to loot table
			if ((lootToAdd:get(ilootToAddCount*2-1))*LootChanceMultiplierAdjustment:get(fLootChanceMultiplier)+LootChanceFlatAdjustment:get(fLootChanceFlat) < 0.0001) then
				--print("Inserting: ".."SuburbsDistributions[\"all\"][\""..tostring(lootContainers:get(iContainersCount)).."\"].items, 0.0001")
				table.insert(SuburbsDistributions["all"][tostring(lootContainers:get(iContainersCount))].items,0.0001);
			else
				--print("Inserting: ".."SuburbsDistributions[\"all\"][\""..tostring(lootContainers:get(iContainersCount)).."\"].items, "..lootToAdd:get(ilootToAddCount*2-1).."\*"..LootChanceMultiplierAdjustment:get(fLootChanceMultiplier).."\+"..LootChanceFlatAdjustment:get(fLootChanceFlat))
				table.insert(SuburbsDistributions["all"][tostring(lootContainers:get(iContainersCount))].items,(lootToAdd:get(ilootToAddCount*2-1))*LootChanceMultiplierAdjustment:get(fLootChanceMultiplier)+LootChanceFlatAdjustment:get(fLootChanceFlat));
			end	
		end	
	end
end

Events.OnLoad.Add(ModifyAllLoot)
