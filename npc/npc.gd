extends CharacterBody2D


@onready var nav_agent = $NavAgent


var _speed: float = 50.0


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	# move the npc to the clicked location
	if Input.is_action_just_pressed("target") == true:
		nav_agent.target_position = get_global_mouse_position()
	
	update_navigation()


func update_navigation() -> void:
	# TODO: player not moving 
	var npp = nav_agent.get_next_path_position()
	var ini_v = (npp - global_position).normalized() * _speed
	nav_agent.set_velocity(ini_v)


func _on_nav_agent_velocity_computed(safe_velocity):
	velocity = safe_velocity
	move_and_slide()
