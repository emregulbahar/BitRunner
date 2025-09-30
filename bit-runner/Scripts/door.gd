extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@export var next_scene : PackedScene
var is_open = false


func _on_key_key_collected():
	is_open = true
	
	
	
func _on_body_entered(body):
	if body.is_in_group("player") and is_open:
		animated_sprite_2d.play("Open")
		await animated_sprite_2d.animation_finished
		get_tree().change_scene_to_packed(next_scene)
	



	
