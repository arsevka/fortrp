/*-----
Gamemode functions coded by h4rDm0d
------*/

 -- Change team concole commands
 function team_1(ply)
    ply:SetTeam(1)
	ply:Spawn()
end
 concommand.Add("team_1", team_1)
 
function team_2(ply)
    ply:SetTeam(2)
	ply:Spawn()
end
concommand.Add("team_2", team_2)

function team_10(ply)
	ply:SetTeam(10)
	ply:Spawn()
end
concommand.Add("team_10", team_10)

function GM:ShowSpare1( ply )
	ply:SendLua("set_team()")
end

