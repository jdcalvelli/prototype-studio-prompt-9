extends Node2D

enum GameStates {
	PICK_PLAYER_LOCATION,
	MOVE_UNTIL_COLLISION,
	LEVEL_COMPLETE,
	LEVEL_FAILED,
}

var currentGameState = GameStates.PICK_PLAYER_LOCATION

var playerRef:playerMagnet
var gridRef:grid

@export var numTurns:int

func _ready():
	
	playerRef = $player_magnet
	gridRef = $Grid
	
	gridRef.doneMoving.connect(_on_done_moving)

func _physics_process(delta):
	match currentGameState:
		GameStates.PICK_PLAYER_LOCATION:
			if Input.is_action_just_pressed("moveClockwise"):
				playerRef.movePlayerClockwise()
				numTurns -= 1
				currentGameState = GameStates.MOVE_UNTIL_COLLISION
			elif Input.is_action_just_pressed("moveCounterClockwise"):
				playerRef.movePlayerCounterClockwise()
				numTurns -= 1
				currentGameState = GameStates.MOVE_UNTIL_COLLISION
		GameStates.MOVE_UNTIL_COLLISION:
			# if we're supposed to be moving away
			# move opposite to location of player
			match playerRef.currentPlayerPositionState:
				playerRef.playerPositionStates.TOP:
					gridRef.tryMove(Vector2i.DOWN)
				playerRef.playerPositionStates.RIGHT:
					gridRef.tryMove(Vector2i.LEFT)
				playerRef.playerPositionStates.BOTTOM:
					gridRef.tryMove(Vector2i.UP)
				playerRef.playerPositionStates.LEFT:
					gridRef.tryMove(Vector2i.RIGHT)
					
func _on_done_moving():
	if numTurns == 0:
		currentGameState = GameStates.LEVEL_FAILED
	else:
		currentGameState = GameStates.PICK_PLAYER_LOCATION
