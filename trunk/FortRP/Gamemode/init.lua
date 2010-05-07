/*--------------------------------------------------
FortRP made by h4rDm0d, basics from Philip Dyplin.
http://wiki.garrysmod.com/?title=User:Pdkm931
http://wiki.garrysmod.com/?title=LUA:Gamemode_from_scratch
---------------------------------------------------*/

-- Client side files 
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_hud.lua" )
 
 -- Included files
include( 'shared.lua' )

-- Player spawing 
function GM:PlayerInitialSpawn( ply )
	ply:SetTeam(1)
	-- Show Team selecting menu on spawn
	RunConsoleCommand( "team_menu" ) 
end
 
function GM:PlayerLoadout( ply )
 
	-- Stip all weps
	ply:StripWeapons()
	
    if ply:Team() == 1 then
        ply:Give("weapon_physcannon")
		ply:SetModel( "models/player/kleiner.mdl" )
		ply:Give( "item_battery", 5 )
	elseif ply:Team() == 2 then
        ply:Give("weapon_physcannon")
		ply:SetModel( "models/player/kleiner.mdl" )
		ply:Give( "item_battery", 5 )
	elseif ply:Team() == 10 then
        ply:Give("weapon_physcannon")
		ply:SetModel( "models/player/kleiner.mdl" )
		ply:Give( "item_battery", 5 )
    end
 
 -- Change team concole commands
 function team_1(ply)
    ply:SetTeam( 1 )
end
 concommand.Add("team_1", team_1)
 
function team_2(ply)
    ply:SetTeam( 2 )
end
concommand.Add("team_2", team_2)

function team_10(ply)
	ply:SetTeam(10)
end
concommand.Add("team_10", team_10)

end