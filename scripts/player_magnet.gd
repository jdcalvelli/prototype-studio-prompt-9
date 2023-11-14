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

func _ready():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.5)
	tween.tween_property(self, "scale", Vector2(1.2, 1.2),0.5)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.5)
	tween.tween_property(self, "scale", Vector2(0.8, 0.8), 0.5)
	tween.set_loops(-1)

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
