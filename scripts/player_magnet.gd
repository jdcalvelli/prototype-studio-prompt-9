extends Sprite2D
class_name playerMagnet

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

func movePlayerClockwise():
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
	position = playerPositions[currentPlayerPositionState]

func movePlayerCounterClockwise():
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
	position = playerPositions[currentPlayerPositionState]
