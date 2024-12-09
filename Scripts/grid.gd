@tool

extends Node3D

@export var num_divisions : int = 5:
	set(new):
		num_divisions = new
		initialize()
@export var size : float = 30.0:
	set(new):
		size = new
		initialize()
@export var reset : bool = false:
	set(new):
		initialize()

# Initializes the grid. This needs to be called before the grid becomes visible!
func initialize():
	print("Initializing!")
	# Deletes all current grid lines 
	for child in get_children():
		child.queue_free()
	
	# Adds new grid lines
	var spacing = size / num_divisions
	# Adds vertical gridlines
	for i in range(num_divisions + 1):
		for k in range(num_divisions + 1):
			var next_gridline = preload("res://Scenes/gridline.tscn").instantiate()
			add_child(next_gridline)
			next_gridline.mesh.height = size
			next_gridline.position = Vector3((-size / 2.0) + i * spacing, 0, (-size / 2.0) + k * spacing)
	# Adds x-parallel gridlines
	for i in range(num_divisions + 1):
		for k in range(num_divisions + 1):
			var next_gridline = preload("res://Scenes/gridline.tscn").instantiate()
			add_child(next_gridline)
			next_gridline.mesh.height = size
			next_gridline.rotation.z = deg_to_rad(90)
			next_gridline.position = Vector3(0, (-size / 2.0) + i * spacing, (-size / 2.0) + k * spacing)
	# Adds z-parallel gridlines
	for i in range(num_divisions + 1):
		for k in range(num_divisions + 1):
			var next_gridline = preload("res://Scenes/gridline.tscn").instantiate()
			add_child(next_gridline)
			next_gridline.mesh.height = size
			next_gridline.rotation.x = deg_to_rad(90)
			next_gridline.position = Vector3((-size / 2.0) + i * spacing, (-size / 2.0) + k * spacing, 0)
