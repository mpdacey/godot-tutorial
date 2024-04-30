extends Area2D

func _on_body_entered(body):
	print("coin collected")
	queue_free()
