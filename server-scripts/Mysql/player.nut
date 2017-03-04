
//      -== Import/export player stats ==-     //


function MySQL::checkUser(pid)
{
	local name = getPlayerName(pid);
	local exist = false;
    local result = mysql_query(Mysqlhandler, "SELECT * FROM playerinfo WHERE name='"+name+"'");
    
    if (result)
    {
        local row_assoc = mysql_fetch_assoc(result);
        if (row_assoc)
        {
	     	setPlayerPassword(pid, row_assoc["password"])
			setPlayerName(pid, row_assoc["name"])
			setRealID(pid,row_assoc["id"].tointeger());
	        print(name+" is casual player on our server!");
			exist = true;
        }
        
        mysql_free_result(result);
    }else{
	print(name+" its new player on our Server!");
	}
	callClientFunc(pid, RELIABLE, "setBasicInfo", row_assoc["password"], exist, row_assoc["id"].tointeger());
}

function MySQL::saveAccount(pid)
{
	local query = "UPDATE `playerinfo` SET password = "+getPlayerPassword(pid)+" WHERE `id` = " + getRealID(pid);
	setToDatabase(query);
}

function MySQL::getInfoAccount(pid)
{
	local query = "SELECT `password` FROM `playerinfo` WHERE `id` = " + player[pid].rid;
	return queryGet(query);
}
