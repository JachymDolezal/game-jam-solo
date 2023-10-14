extends Node2D


const ObstacleNode = preload("res://obstacle_1.tscn")
const x_lim_min = 0
const x_lim_max = 480
@onready var player = get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
