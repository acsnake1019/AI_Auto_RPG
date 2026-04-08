extends CharacterBody2D

var health = 100

func take_damage(amount):
	health -= amount
	if health <= 0:
		die()

func die():
	GameManager.add_gold(20)
	GameManager.add_exp(30)
	queue_free()