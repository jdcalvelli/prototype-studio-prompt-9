extends TileMap
class_name grid

var floorID = Vector2i(1, 0)
var goalID = Vector2i(0, 0)

signal doneMoving
signal goalAchieved

func tryMove(direction:Vector2i):
	var magnetCurrentGridPos = local_to_map($magnet.position)
	var toMoveGridPos = Vector2i(
		magnetCurrentGridPos.x + direction.x, 
		magnetCurrentGridPos.y + direction.y
		)
	var toMoveTileID = get_cell_atlas_coords(0, toMoveGridPos)
	match toMoveTileID:
		floorID:
			print("matches floor id")
			$magnet.position += Vector2(direction) * Vector2(tile_set.tile_size)
		goalID:
			$magnet.position += Vector2(direction) * Vector2(tile_set.tile_size)
			goalAchieved.emit()
		_:
			# ie anything that isnt the floor or the exit
			doneMoving.emit()
