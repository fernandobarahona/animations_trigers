class_name GameScreen_V1 extends Control

@export var level : Level 
@export var world: World

@onready var background_scene: BackgroundScene_V1 = get_node("BackgroundScene") as BackgroundScene_V1

func _ready():
	conect_level_and_world_buttons()

func _on_play_anim_1_button_pressed():
	background_scene.animate_element(level)

func _on_play_anim_2_button_pressed():
	background_scene.animate_element(level)















# -----------------------------------

func conect_level_and_world_buttons():
	var level_buttons_container = get_node("%LevelButtonsContainer")
	var level_buttons = level_buttons_container.get_children() as Array[LevelButton_V1]
	for level_button in level_buttons:
		level_button.pressed.connect(_on_level_button_pressed.bind(level_button))
	var world_buttons_container = get_node("%WorldButtonsContainer")
	var world_buttons = world_buttons_container.get_children() as Array[WorldButton]
	for world_button in world_buttons:
		world_button.pressed.connect(_on_world_button_pressed.bind(world_button))
	
func _on_level_button_pressed(level_button: LevelButton_V1):
	level = level_button.level

func _on_world_button_pressed(world_button: WorldButton):
	world = world_button.world
	real_replace_by(background_scene ,world.background_scene.instantiate())
	await get_tree().process_frame
	background_scene = get_node("BackgroundScene") as BackgroundScene_V1
	print(background_scene)

func real_replace_by(node_to_replace:Node, replacing_node: Node):
	var parent = node_to_replace.get_parent()
	var parent_children : Array[Node]= parent.get_children()
	var pos_in_parent : int = parent_children.find(node_to_replace)
	
	parent.remove_child(node_to_replace)
	parent.add_child(replacing_node)
	parent.move_child(replacing_node, pos_in_parent)
