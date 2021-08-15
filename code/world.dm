/world/New()
	world.log << "Loading..."
	load_configuration()
	start_tickloop()
	world.log << "Load Complete"


/proc/load_configuration()
	if(!fexists("config.json"))
		world.log << "\[ERROR] config.json does not exist. World will exit."
		del(world)
		return

	var/list/config = json_decode(file2text("config.json"))
	GLOB.gameserver_address = config["gameserver_addr"]
	GLOB.gameserver_commskey = config["gameserver_commskey"]

/proc/start_tickloop()
	// This has a selfcontained loop. Do not wait.
	set waitfor = FALSE

	while(TRUE)
		for(var/client/C in GLOB.queue_clients)
			var/client_position = GLOB.queue_clients.Find(C)
			if(client_position != C.last_queue_pos)
				C.to_chat(QUEUETEXT("You are currently in position <b>[client_position]</b> of <b>[length(GLOB.queue_clients)]</b>"))
				C.last_queue_pos = client_position
			// Lets see where they are
			if(C.IgnoreQueue())
				C.AllowEntry()
			sleep(3) // Sleep between each client to avoid bogging down the gameserver

		sleep(100) // Give er 10 seconds
