// Inside here are all the procs you NEED to override if you wish to use this implementation in production

// Override this to check whether the player connecting is a new player or someonme who has played before
// However you do this will depend on your codebase
/client/proc/NewPlayer()
	return TRUE

// Override this to do whatever you want to do to route your client from this server to your main one
/client/proc/AllowEntry()
	to_chat(INFOTEXT("You are now being routed to the main game server"))
	del(src)
