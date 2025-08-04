extends Node

# Game Settings ---------
var inputType = "mouse"
var volume = 100.0

# Scene Links
var destination : String
var mainMenu = "res://Scenes/Menus/MainMenu.tscn"
var loadScreen = "res://Scenes/Menus/LoadScreen.tscn"
var mapRunner = "res://Scenes/Gameplay/RunMap.tscn"
var mapMaker = "res://Scenes/Gameplay/MapMaker.tscn"
var practiceMode = "res://Scenes/Gameplay/PracticeMode.tscn"
var mapSelection = "res://Scenes/Menus/MapSelectionScreen.tscn"
var mapNamer = "res://Scenes/Menus/MapNamer.tscn"
var optionsMenu = "res://Scenes/Menus/OptionsMenu.tscn"
var completionScreen = "res://Scenes/Menus/CompletionScreen.tscn"

# Map Settings ----------
var mapTitle
var speed : int
var reset = true

# Map Run Variables
var beat = 1
var hitOrbs = 0.00
var totalOrbs = 0.00
var failedCheck = 0
var accuracy : String
var pausable = true
var playing = true
var isPractice = true
var fireRate = 10

# Map Maker Variables ---
var playerRot
var currentBeat = 0
var previousBeat = 0
var beatAngle = 0
