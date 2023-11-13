extends TileMap
class_name grid

var floorID = Vector2i(9, 1)

signal doneMoving

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
		_:
			doneMoving.emit()
