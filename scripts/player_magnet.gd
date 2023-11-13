extends Sprite2D

var playerPositions = [
	Vector2(0, -250),
	Vector2(250, 0),
	Vector2(0, 250),
	Vector2(-250, 0),
]

enum playerPositionStates {
	TOP = 0,
	RIGHT = 1,
	BOTTOM = 2,
	LEFT = 3,
}

var currentPlayerPositionState = playerPositionStates.TOP

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = playerPositions[currentPlayerPositionState]


func _input(event):
	if event.is_action_pressed("moveClockwise"):
		# CHANGE STATE CLOCKWISE
		match currentPlayerPositionState:
			playerPositionStates.TOP:
				# go to right
				currentPlayerPositionState = playerPositionStates.RIGHT
			playerPositionStates.RIGHT:
				# go to bottom
				currentPlayerPositionState = playerPositionStates.BOTTOM
			playerPositionStates.BOTTOM:
				# go to left
				currentPlayerPositionState = playerPositionStates.LEFT
			playerPositionStates.LEFT:
				# go to top
				currentPlayerPositionState = playerPositionStates.TOP
	elif event.is_action_pressed("moveCounterClockwise"):
		# CHANGE STATE COUNTERCLOCKWISE
		match currentPlayerPositionState:
			playerPositionStates.TOP:
				# go to left
				currentPlayerPositionState = playerPositionStates.LEFT
			playerPositionStates.RIGHT:
				# go to top
				currentPlayerPositionState = playerPositionStates.TOP
			playerPositionStates.BOTTOM:
				# go to right
				currentPlayerPositionState = playerPositionStates.RIGHT
			playerPositionStates.LEFT:
				# go to bottom
				currentPlayerPositionState = playerPositionStates.BOTTOM
	# ACTUALLY DO THE MOVEMENT
	self.position = playerPositions[currentPlayerPositionState]
