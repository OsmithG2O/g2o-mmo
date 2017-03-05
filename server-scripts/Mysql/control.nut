
 //  -- Mysql Control Script --

import("GO_wMySQL");

class MySQL
{
    function connect(host, user, password, database)
	{
        Mysqlhandler = mysql_connect(host, user, password, database); 		
		if(mysql_ping(Mysqlhandler) != false)
		{
		print("Connection with database succesfull");
		}
	}
	
	function check_connection()
	{
		if(mysql_ping(Mysqlhandler) == false)
		{	
		print("Cant connect with DB");
		};
	}
	
	function setToDatabase(value)
	{
		local mysql_query_result = mysql_query(Mysqlhandler, value);
		
		if(!mysql_query_result)
		{
        print("Cannot work with database");
		print("Error " + mysql_error(Mysqlhandler));
        }		
	}
	
	function getFromDatabase(value)
	{
	    local read_result;
		local mysql_query_result = mysql_query(Mysqlhandler, value); 
		
		if(mysql_num_rows(mysql_query_result) > 0)
		{
			read_result = mysql_fetch_assoc(mysql_query_result);
		}
		
		if(!mysql_query_result)
		{
        print("Cannot work with database");
		print("Error " + mysql_error(Mysqlhandler));
        }		
		mysql_free_result(mysql_query_result);
		return read_result;
	}
	
	function getTableFromDatabase(value)
	{
	    local read_result = [];
		local mysql_query_result = mysql_query(Mysqlhandler, value); 
		
		local count = mysql_num_rows(mysql_query_result);
		for(local i=0; i<count; i++)
		{
			read_result.push(mysql_fetch_assoc(mysql_query_result));
		}
		
		if(!mysql_query_result)
		{
        print("Cannot work with database");
		print("Error " + mysql_error(Mysqlhandler));
        }	
		
		mysql_free_result(mysql_query_result);
		return read_result;
	}
	
	
	function getCount(value)
	{
	    local count = 0;
		local mysql_query_result = mysql_query(Mysqlhandler, value); 
		
		if(!mysql_query_result)
		{
        print("Cannot work with database");
		print("Error " + mysql_error(Mysqlhandler));
        }		
		
		count = mysql_num_rows(mysql_query_result).tointeger();
		
		mysql_free_result(mysql_query_result);
		return count;
	}
	
	Mysqlhandler = null;
};

Mysql <- MySQL();
