/*--------------------------------------------------
FortRP made by h4rDm0d, basics from Philip Dyplin.
http://wiki.garrysmod.com/?title=User:Pdkm931
http://wiki.garrysmod.com/?title=LUA:Gamemode_from_scratch
---------------------------------------------------*/
DeriveGamemode("sandbox")

-- Client side files 
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_scoreboard.lua" )
AddCSLuaFile( "cl_spawnmenu.lua" )
AddCSLuaFile( "cl_buyable.lua" )

 -- Included files
include( 'shared.lua' )
include( 'sv_gamemode.lua' )

--Falco's prop protection

AddCSLuaFile("FPP/sh_CPPI.lua")
AddCSLuaFile("FPP/client/FPP_Menu.lua")
AddCSLuaFile("FPP/client/FPP_HUD.lua")
AddCSLuaFile("FPP/client/FPP_Buddies.lua")

include("FPP/sh_CPPI.lua")
include("FPP/server/FPP_Settings.lua")
include("FPP/server/FPP_Core.lua")
include("FPP/server/FPP_Antispam.lua")

-- Player spawing 
function GM:PlayerInitialSpawn( pl )
	pl:SetTeam(1)
end
 
function GM:PlayerSpawn( pl )

	-- Stip all weps
	pl:StripWeapons()
	
    if pl:Team() == 1 then
        pl:Give( "weapon_physcannon" )
		pl:Give( "gmod_tool" )
		pl:Give( "gmod_camera" )
		pl:Give( "weapon_physgun" )
		pl:SetModel( "models/player/alyx.mdl" )
	elseif pl:Team() == 2 then
        pl:Give( "weapon_physcannon" )
		pl:Give( "gmod_tool" )
		pl:Give( "gmod_camera" )
		pl:Give( "weapon_physgun" )
		pl:SetModel( "models/player/eli.mdl" )
	elseif pl:Team() == 10 then
        pl:Give( "weapon_physcannon" )
		pl:Give( "gmod_tool" )
		pl:Give( "weapon_mad_admin" )
		pl:Give( "gmod_camera" )
		pl:Give( "weapon_physgun" )
		pl:SetModel( "models/ModAlxy/al90.mdl" )
    end
end