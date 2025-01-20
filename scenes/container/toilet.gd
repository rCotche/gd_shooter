extends ItemContainer

func hit():
	if not opened:
		$LidSprite.hide()
		var pos = $SpawnPositions/ItemPosition.global_position
		open.emit(pos, current_direction)
		opened = true
