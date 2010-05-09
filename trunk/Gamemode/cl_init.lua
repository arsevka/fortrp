/*-----
Client initial file coded by h4rDm0d
------*/
DeriveGamemode("sandbox")

include( 'shared.lua' )
include( 'cl_scoreboard.lua' )
include( 'cl_spawnmenu.lua' )
include( 'cl_buyable.lua' )

 -- FPP
include("FPP/client/FPP_Menu.lua")
include("FPP/client/FPP_HUD.lua")
include("FPP/client/FPP_Buddies.lua")
include("FPP/sh_CPPI.lua")

 -- Team choosing dialog
function set_team()
local frame = vgui.Create( "DFrame" )
frame:SetPos( (ScrW()/2)-400, (ScrH()/2)-300 )
frame:SetSize(800,600)
frame:SetTitle("Home meun") --Set title
frame:SetVisible( true )
frame:SetBackgroundBlur( true )
frame:SetDraggable( false )
frame:ShowCloseButton( true )
frame:MakePopup()

/*-- Model not in use
local modelframe = vgui.Create("DFrame")
modelframe:SetPos( (ScrW()/2)-650, (ScrH()/2)-300)
modelframe:SetSize(300,300)
modelframe:SetTitle("Model View")
modelframe:SetVisible( true )
modelframe:SetDraggable( false)
modelframe:ShowCloseButton( true ) 
modelframe:MakePopup()

MODEL = vgui.Create("DModelPanel")
MODEL:SetParent(modelframe)
MODEL:SetModel(LocalPlayer():GetModel())
MODEL:SetSize(280, 280)
MODEL:SetAnimated(true)
MODEL:SetFOV(75)
MODEL:SetAnimSpeed(1)
MODEL:SetColor(Color(255,255,255,255))
MODEL:Paint()
--*/

-- Change team button
local MenuButton = vgui.Create("DButton")
MenuButton:SetParent( frame )
MenuButton:SetText( "Change Team" )
MenuButton:SetPos(10,30)
MenuButton:SetSize(780,25)
MenuButton.DoClick = function ( btn )
    local MenuButtonOptions = DermaMenu() -- Creates the menu
    MenuButtonOptions:AddOption("Guest", function() RunConsoleCommand("team_1") end ) -- Changes to guest team
    MenuButtonOptions:AddOption("General Dealer", function() RunConsoleCommand("team_2") end ) -- Changes to General Dealer job
	if(LocalPlayer():EV_IsAdmin()) then
    MenuButtonOptions:AddOption("Admin", function() RunConsoleCommand("team_10") end )
	end
    MenuButtonOptions:Open() -- Open the menu AFTER adding your options
end

-- Buyable items 
local BuyPanel = vgui.Create( "DPanel", frame )
BuyPanel:SetPos(10,65)
BuyPanel:SetSize(780,525)
BuyPanel.Paint = function() -- Paint function
    surface.SetDrawColor( 50, 50, 50, 255 ) -- Set our rect color below us; we do this so you can see items added to this panel
    surface.DrawRect( 0, 0, BuyPanel:GetWide(), BuyPanel:GetTall() ) -- Draw the rect
end
end
concommand.Add( "team_menu", set_team )

/*----
Custom HUD made by me :D
----*/
function GM:HUDPaint( ply )
	-- Set text
	surface.CreateFont("Verdana", 18, 700, true,false,"Main")
	surface.CreateFont("Verdana", 16, 700, true,false,"No.2")
	surface.SetFont("No.2")
	
	-- Health bar
	local health = LocalPlayer():Health()
	local HBH = ((ScrH()/100)*97)
	local HBW = ((ScrW()/100)*50)
	local HBL = math.Clamp((health/100)*300, 4, 300)
	draw.RoundedBox(4,HBW+4,HBH,304,22,Color(124,124,124,200))
	draw.RoundedBox(4,HBW+6,HBH+2,HBL,18,Color(204,0,0,200))
	
	surface.SetTextColor(255,255,255,245)
	surface.SetTextPos(HBW+148,HBH+1)
	surface.DrawText(health)
	-- END
	
	-- Armor bar
	local armor = LocalPlayer():Armor()
	local ABH = ((ScrH()/100)*97)
	local ABW = ((ScrW()/100)*50)
	local ABL = math.Clamp((armor/100)*300, 4, 300)
	draw.RoundedBox(4,ABW-304,ABH,304,22,Color(124,124,124,200))
	draw.RoundedBox(4,ABW-306,ABH+2,ABL,18,Color(19,60,166,200))
	
	surface.SetTextColor(255,255,255,245)
	surface.SetTextPos(ABW-148,ABH+1)
	surface.DrawText(armor)
	-- END
end


/*----
Hiding the default hud
----*/

function hidehud(name)
	for k, v in pairs{"CHudHealth", "CHudBattery"} do
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "hidehud", hidehud)


/*---
Removing extra tabs for admins only 
----*/

hook.Add("OnGamemodeLoaded", "FixSpawnMenu", function()
	timer.Simple(5, function() 
			if(LocalPlayer():EV_IsAdmin()) then
			MsgN("No tabs have been removed, because you are Admin")
			else 
				local at = table.getn(g_SpawnMenu.CreateMenu.Items) + 1
				while(at > 3) do
					at = at - 1
					local thePanel = g_SpawnMenu.CreateMenu.tabScroller.Panels[at]
					thePanel:SetVisible(false)
				end
				g_SpawnMenu.CreateMenu.tabScroller:PerformLayout()
				g_SpawnMenu.CreateMenu:PerformLayout()
				g_SpawnMenu:PerformLayout()
				MsgN("Tabs have been removed, because you are not Admin")
			end
	end)
end)
