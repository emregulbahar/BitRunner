extends Area2D


signal key_collected





func _on_body_entered(_body):
	if _body.is_in_group("player"):
		emit_signal("key_collected")
		queue_free()
