/client
	var/last_queue_pos = -1

/client/proc/to_chat(txt)
	src << output(txt, "default.mainoutput")

/client/New()
	..() // Get a window asap
	to_chat(INFOTEXT("Connecting..."))


	// If we dont need to queue, go straight to allowing entry
	if(!NeedsToQueue())
		AllowEntry()
		return

	// Otherwise, put them in the queue list
	GLOB.queue_clients += src

// Cleanup
/client/Del()
	GLOB.queue_clients -= src

/client/proc/IgnoreQueue()
	try
		var/result = world.Export("byond://[GLOB.gameserver_address]?queue_status&ckey_check=[ckey]&key=[GLOB.gameserver_commskey]")
		var/list/result_data = json_decode(result)
		return result_data["allow_player"]
	catch
		return TRUE // Allow if we fail

/client/proc/NeedsToQueue()
	// Has client been seen before
	if(!NewPlayer())
		to_chat(QUEUETEXT("Existing player detected. Skipping server queue."))
		return FALSE


	// If its a new player, check queue status
	to_chat(QUEUETEXT("New player detected. Querying main server..."))
	if(!IgnoreQueue())
		to_chat(QUEUETEXT("The main server is currently experiencing a large volume of new players. You are now in a queue."))
		to_chat(QUEUETEXT("Please wait, you will be redirected automatically soon."))
		return TRUE
	else
		return FALSE
