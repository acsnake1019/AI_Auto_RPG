extends Node

var gold = 0
var current_exp = 0
var level = 1
var exp_to_next_level = 100

var attack_power = 10
var attack_speed = 1.0
var max_hp = 100
var current_hp = 100

var upgrade_cost_base = 10

func add_exp(amount):
	current_exp += amount
	if current_exp >= exp_to_next_level:
		level_up()

func level_up():
	current_exp -= exp_to_next_level
	level += 1
	exp_to_next_level = int(exp_to_next_level * 1.5)
	print("🎉 等級提升！目前等級: ", level)

func add_gold(amount):
	gold += amount

func upgrade_attribute(attr_name):
	var cost = get_upgrade_cost(attr_name)
	if gold >= cost:
		gold -= cost
		match attr_name:
			"attack": attack_power += 5
			"speed": attack_speed = max(0.2, attack_speed - 0.05)
			"hp": max_hp += 20
		return true
	return false

func get_upgrade_cost(_attr_name):
	return upgrade_cost_base * level