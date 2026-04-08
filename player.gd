extends CharacterBody2D

var attack_range = 60.0
var attack_cooldown = 0.8
var can_attack = true

@onready var enemy = get_parent().get_node("Enemy")

func _physics_process(delta):
	if not enemy: return
	var distance = global_position.distance_to(enemy.global_position)
	var direction = (enemy.global_position - global_position).normalized()
	
	if distance > attack_range:
		velocity = direction * GameManager.attack_speed * 100
		move_and_slide()
	else:
		velocity = Vector2.ZERO
		if can_attack:
			attack()

func attack():
	can_attack = false
	if enemy.has_method("take_damage"):
		enemy.take_damage(GameManager.attack_power)
	
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.1)
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.1)
	
	await get_tree().create_timer(GameManager.attack_speed).timeout
	can_attack = true