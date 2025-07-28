extends Control

# Getting the users Roaming folder
var userPath = OS.get_data_dir()

# Letting the user set the route to their music file
var musicPath = "Pass"

func _on_continue_button_pressed():
	# Taking the player's name input for the map
	var mapName = $CanvasLayer/NameInput.text
	# Set the path to the .spr file using all of the gathered info
	var filePath = userPath + "/SpinR/" + mapName + ".spr"
	# Set map metadata
	var map = [{"title": mapName, "speed": 100}]

	# As long as the file doesn't already exist
	if not FileAccess.file_exists(filePath):
		# Start a new ziping instance and open the file
		var writer = ZIPPacker.new()
		writer.open(filePath)
		# Translate/Convert the map data
		var mapJson = JSON.stringify(map)
		var mapConverted = mapJson.to_utf8_buffer()
		# Create a .json file to store map data
		writer.start_file("map.json")
		# Write the map data
		writer.write_file(mapConverted)
		# Closes the .json file
		writer.close_file()
		# Open the user's chosen audio file to get the data from it
		var file = FileAccess.open(musicPath, FileAccess.READ)
		# Make the read data usable in a zip
		var data = file.get_buffer(file.get_length())
		# Close the file to avoid memory issues
		file.close()
		# Make a new blank .mp3 file to write the music and data into
		writer.start_file("music.mp3")
		# Write the converted data into the new blank .mp3 file
		writer.write_file(data)
		# Close the .spr file to avoid memory issues
		writer.close()
		
		# Move to the next screen
		
		Global.mapTitle = mapName
		
		get_tree().change_scene_to_file(Global.mapMaker)
	else:
	# If the file already exists, Warn the user
		$CanvasLayer/Warning.visible = true

func _on_back_button_pressed():
	get_tree().change_scene_to_file(Global.mainMenu)
