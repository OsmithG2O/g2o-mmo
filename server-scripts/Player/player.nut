

 //  -- Player Control Script --   //

local players = {};

class Player
{
    constructor(_id, _name)
	{
	    name = _name;
		id = _id;
		password = "";
	}
	
	name = null;
	id = null;
	password = null;
};


function setRealID(pid, val){players[pid].id = val;}
function getRealID(pid){return players[pid].id;}
function setPlayerPassword(pid, val){players[pid].password = val;}
function getPlayerPassword(pid){return players[pid].password;}

function playerJoin(pid)
{
	players[pid] <- Player(pid, getPlayerName(pid));
}
 
addEvent("onJoin", playerJoin);

function playerLeave(pid, reason)
{
	delete players[pid];
}
 
addEvent("onDisconect", playerLeave);