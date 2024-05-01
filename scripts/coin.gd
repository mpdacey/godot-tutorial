extends Area2D

@onready var game_manager = %GameManager
@onready var animator = $AnimationPlayer

func _on_body_entered(body):
	game_manager.add_points()
	animator.play("pickup")
