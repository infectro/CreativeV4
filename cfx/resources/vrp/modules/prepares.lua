-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("characters/allChars","SELECT * FROM bxd_characters")
vRP.prepare("characters/getUsers","SELECT * FROM bxd_characters WHERE id = @id")
vRP.prepare("characters/getPhone","SELECT id FROM bxd_characters WHERE phone = @phone")
vRP.prepare("characters/getSerial","SELECT id FROM bxd_characters WHERE serial = @serial")
vRP.prepare("characters/updatePort","UPDATE bxd_characters SET port = @port WHERE id = @id")
vRP.prepare("characters/fixPrison","UPDATE bxd_characters SET prison = 0 WHERE id = @user_id")
vRP.prepare("characters/updatePhone","UPDATE bxd_characters SET phone = @phone WHERE id = @id")
vRP.prepare("characters/updatePenal","UPDATE bxd_characters SET penal = @penal WHERE id = @id")
vRP.prepare("characters/addBank","UPDATE bxd_characters SET bank = bank + @bank WHERE id = @id")
vRP.prepare("characters/removeCharacters","UPDATE bxd_characters SET deleted = 1 WHERE id = @id")
vRP.prepare("characters/updateHomes","UPDATE bxd_characters SET homes = homes + 1 WHERE id = @id")
vRP.prepare("characters/removeBank","UPDATE bxd_characters SET bank = bank - @bank WHERE id = @id")
vRP.prepare("characters/setSerial","UPDATE bxd_characters SET serial = @serial WHERE id = @user_id")
vRP.prepare("characters/addFines","UPDATE bxd_characters SET fines = fines + @fines WHERE id = @id")
vRP.prepare("characters/setPrison","UPDATE bxd_characters SET prison = @prison WHERE id = @user_id")
vRP.prepare("characters/updateGarages","UPDATE bxd_characters SET garage = garage + 1 WHERE id = @id")
vRP.prepare("characters/removeFines","UPDATE bxd_characters SET fines = fines - @fines WHERE id = @id")
vRP.prepare("characters/getCharacters","SELECT * FROM bxd_characters WHERE steam = @steam and deleted = 0")
vRP.prepare("characters/removePrison","UPDATE bxd_characters SET prison = prison - @prison WHERE id = @user_id")
vRP.prepare("characters/updateName","UPDATE bxd_characters SET name = @name, name2 = @name2 WHERE id = @user_id")
vRP.prepare("characters/lastCharacters","SELECT id FROM bxd_characters WHERE steam = @steam ORDER BY id DESC LIMIT 1")
vRP.prepare("characters/countPersons","SELECT COUNT(steam) as qtd FROM bxd_characters WHERE steam = @steam and deleted = 0")
vRP.prepare("characters/createCharacters","INSERT INTO bxd_characters(steam,name,name2,phone) VALUES(@steam,@name,@name2,@phone)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACCOUNTS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("accounts/getInfos","SELECT * FROM bxd_accounts WHERE steam = @steam")
vRP.prepare("accounts/dateLogin","UPDATE bxd_accounts SET login = @login WHERE steam = @steam")
vRP.prepare("accounts/newAccount","INSERT INTO bxd_accounts(steam,login) VALUES(@steam,@login)")
vRP.prepare("accounts/infosUnwhitelist","UPDATE bxd_accounts SET whitelist = 0 WHERE steam = @steam")
vRP.prepare("accounts/removeGems","UPDATE bxd_accounts SET gems = gems - @gems WHERE steam = @steam")
vRP.prepare("accounts/setPriority","UPDATE bxd_accounts SET priority = @priority WHERE steam = @steam")
vRP.prepare("accounts/infosUpdatechars","UPDATE bxd_accounts SET chars = chars + 1 WHERE steam = @steam")
vRP.prepare("accounts/infosUpdategems","UPDATE bxd_accounts SET gems = gems + @gems WHERE steam = @steam")
vRP.prepare("accounts/infosWhitelist","UPDATE bxd_accounts SET whitelist = @whitelist WHERE steam = @steam")
vRP.prepare("accounts/updatePremium","UPDATE bxd_accounts SET predays = predays + @predays WHERE steam = @steam")
vRP.prepare("accounts/setPremium","UPDATE bxd_accounts SET premium = @premium, predays = @predays, priority = @priority WHERE steam = @steam")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERDATA
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("playerdata/getUserdata","SELECT dvalue FROM bxd_playerdata WHERE user_id = @user_id AND dkey = @key")
vRP.prepare("playerdata/setUserdata","REPLACE INTO bxd_playerdata(user_id,dkey,dvalue) VALUES(@user_id,@key,@value)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTITYDATA
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("entitydata/removeData","DELETE FROM bxd_entitydata WHERE dkey = @dkey")
vRP.prepare("entitydata/getData","SELECT dvalue FROM bxd_entitydata WHERE dkey = @dkey")
vRP.prepare("entitydata/setData","REPLACE INTO bxd_entitydata(dkey,dvalue) VALUES(@dkey,@value)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("vehicles/plateVehicles","SELECT * FROM bxd_vehicles WHERE plate = @plate")
vRP.prepare("vehicles/getVehicles","SELECT * FROM bxd_vehicles WHERE user_id = @user_id")
vRP.prepare("vehicles/removeVehicles","DELETE FROM bxd_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vehicles/selectVehicles","SELECT * FROM bxd_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vehicles/updateVehiclesTax","UPDATE bxd_vehicles SET tax = @tax WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vehicles/addVehicles","INSERT IGNORE INTO bxd_vehicles(user_id,vehicle,plate,work) VALUES(@user_id,@vehicle,@plate,@work)")
vRP.prepare("vehicles/updateHardness","UPDATE bxd_vehicles SET hardness = @hardness WHERE vehicle = @vehicle AND plate = @plate")
vRP.prepare("vehicles/moveVehicles","UPDATE bxd_vehicles SET user_id = @nuser_id WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vehicles/plateVehiclesUpdate","UPDATE bxd_vehicles SET plate = @plate WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vehicles/rentalVehiclesDays","UPDATE bxd_vehicles SET rendays = rendays + @days WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vehicles/arrestVehicles","UPDATE bxd_vehicles SET arrest = @arrest, time = @time WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vehicles/countVehicles","SELECT COUNT(vehicle) as qtd FROM bxd_vehicles WHERE user_id = @user_id AND work = @work AND rental <= 0")
vRP.prepare("vehicles/rentalVehiclesUpdate","UPDATE bxd_vehicles SET rental = @rental, rendays = @days WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vehicles/rentalVehicles","INSERT IGNORE INTO bxd_vehicles(user_id,vehicle,plate,work,rental,rendays) VALUES(@user_id,@vehicle,@plate,@work,@rental,@rendays)")
vRP.prepare("vehicles/updateVehicles","UPDATE bxd_vehicles SET engine = @engine, body = @body, fuel = @fuel, doors = @doors, windows = @windows, tyres = @tyres, brakes = @brakes WHERE user_id = @user_id AND vehicle = @vehicle")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("propertys/selling","DELETE FROM bxd_propertys WHERE name = @name")
vRP.prepare("propertys/permissions","SELECT * FROM bxd_propertys WHERE name = @name")
vRP.prepare("propertys/totalHomes","SELECT name,tax FROM bxd_propertys WHERE owner = 1")
vRP.prepare("propertys/userList","SELECT name FROM bxd_propertys WHERE user_id = @user_id")
vRP.prepare("propertys/countUsers","SELECT COUNT(*) as qtd FROM bxd_propertys WHERE user_id = @user_id")
vRP.prepare("propertys/countPermissions","SELECT COUNT(*) as qtd FROM bxd_propertys WHERE name = @name")
vRP.prepare("propertys/updateTax","UPDATE bxd_propertys SET tax = @tax WHERE name = @name AND owner = 1")
vRP.prepare("propertys/userOwnermissions","SELECT * FROM bxd_propertys WHERE name = @name AND owner = 1")
vRP.prepare("propertys/removePermissions","DELETE FROM bxd_propertys WHERE name = @name AND user_id = @user_id")
vRP.prepare("propertys/userPermissions","SELECT * FROM bxd_propertys WHERE name = @name AND user_id = @user_id")
vRP.prepare("propertys/updateVault","UPDATE bxd_propertys SET vault = vault + 25 WHERE name = @name AND owner = 1")
vRP.prepare("propertys/updateFridge","UPDATE bxd_propertys SET fridge = fridge + 25 WHERE name = @name AND owner = 1")
vRP.prepare("propertys/updateOwner","UPDATE bxd_propertys SET user_id = @nuser_id WHERE user_id = @user_id AND name = @name")
vRP.prepare("propertys/newPermissions","INSERT IGNORE INTO bxd_propertys(name,interior,user_id,owner) VALUES(@name,@interior,@user_id,@owner)")
vRP.prepare("propertys/buying","INSERT IGNORE INTO bxd_propertys(name,interior,price,user_id,tax,residents,vault,fridge,owner,contract) VALUES(@name,@interior,@price,@user_id,@tax,@residents,@vault,@fridge,1,@contract)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRISON
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("prison/cleanRecords","DELETE FROM bxd_prison WHERE nuser_id = @nuser_id")
vRP.prepare("prison/getRecords","SELECT * FROM bxd_prison WHERE nuser_id = @nuser_id ORDER BY id DESC")
vRP.prepare("prison/insertPrison","INSERT INTO bxd_prison(police,nuser_id,services,fines,text,date) VALUES(@police,@nuser_id,@services,@fines,@text,@date)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANNEDS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("banneds/getBanned","SELECT * FROM bxd_banneds WHERE steam = @steam")
vRP.prepare("banneds/removeBanned","DELETE FROM bxd_banneds WHERE steam = @steam")
vRP.prepare("banneds/insertBanned","INSERT INTO bxd_banneds(steam,days) VALUES(@steam,@days)")
vRP.prepare("banneds/getTimeBanned","SELECT * FROM bxd_banneds WHERE steam = @steam AND (DATEDIFF(CURRENT_DATE,time) >= days)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("chests/getChests","SELECT * FROM bxd_chests WHERE name = @name")
vRP.prepare("chests/upgradeChests","UPDATE bxd_chests SET weight = weight + 25 WHERE name = @name")