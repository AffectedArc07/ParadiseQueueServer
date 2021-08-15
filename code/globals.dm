// Holds all the global vars
/datum/global_var_holder
	// The server address of your gameserver, including port
	var/gameserver_address
	// The server commskey
	var/gameserver_commskey
	// List of clients in the queue
	var/list/client/queue_clients = list()

var/datum/global_var_holder/GLOB = new() // Initialise it so we can grab it with GLOB.
