extends Node

const POINT_VALUE = 100
var score = 0
@onready var points_label = $"../CanvasLayer/PointsLabel"

func add_points():
	score += POINT_VALUE
	points_label.text = "POINTS: " + str(score)
