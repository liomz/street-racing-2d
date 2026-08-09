@abstract class_name StateMachine extends Node

@export var init_state: State

var state: State
var _prev_state: State
var _states: Dictionary = {}
var _data: Dictionary = {}

func init() -> void:
	_cache_states()
	_init_states()



func activate() -> void:
	state = init_state
	state.enter()


@abstract func tick(delta: float) -> void



# ==================================================
#                  Helper Functions                 
# ==================================================



func reset() -> void:
	state.exit()
	state = init_state
	state.enter()



func get_prev_state() -> State:
	return _prev_state



func change_state(new_state: State) -> void:
	_prev_state = state

	if state != null: state.exit()
	state = new_state
	if state != null: state.enter()

	_on_states_changed(_prev_state, new_state)



func has_state(state_name: String) -> bool:
	state_name = state_name.to_lower()
	if _states.has(state_name): return true
	return false



func get_state(state_name: String) -> State:
	state_name = state_name.to_lower()
	#if has_state(state_name): return _states[state_name]
	
	#TODO: Remove this after
	assert(has_state(state_name), "No such state as " + state_name)
	return _states[state_name]
	#return null



func get_active_state_name() -> String:
	if state: return state.name
	return "none"



@warning_ignore("unused_parameter")
func _on_states_changed(old_state: State, new_state: State) -> void:
	pass

# ============================================
#                 Data Handler                
# ============================================


func set_data(key: Variant, value: Variant) -> void:
	_data[key] = value


func has_data(key: Variant) -> bool:
	return _data.has(key)


func get_data(key: Variant) -> Variant:
	assert(has_data(key), "No key named " + key)
	return _data.get(key)


func reset_data() -> void:
	_data.clear()


# ==========================================
# Setups and Initializes all children states
# ==========================================



func _cache_states() -> void:
	var state_nodes = get_children()
	
	for state_node in state_nodes:
		_states[state_node.name.to_lower()] = state_node



func _init_states() -> void:
	var state_nodes = get_children()
	
	for state_node in state_nodes:
		state_node._init_state(self)
