extends Node

# Game Settings ---------
var inputType = "mouse"

# Scene Links
var mainMenu = "res://Scenes/Menus/MainMenu.tscn"
var loadScreen = "res://Scenes/Menus/LoadScreen.tscn"
var mapRunner = "res://Scenes/Gameplay/RunMap.tscn"
var mapMaker = "res://Scenes/Gameplay/MapMaker.tscn"
var practiceMode = "res://Scenes/Gameplay/PracticeMode.tscn"
var mapSelection = "res://Scenes/Menus/MapSelectionScreen.tscn"
var mapNamer = "res://Scenes/Menus/MapNamer.tscn"
var optionsMenu = "res://Scenes/Menus/OptionsMenu.tscn"

# Map Settings ----------
var mapTitle
var speed : int
var reset = true

# Map Run Variables
var beat = 1
var hitOrbs = 0.00
var totalOrbs = 0.00
var failedCheck = 0

# Map Maker Variables ---
var playerRot
