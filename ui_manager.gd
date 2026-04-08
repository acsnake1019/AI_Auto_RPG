extends Control

@onready var gold_label = \$HUD/GoldLabel
@onready var level_label = \$HUD/LevelLabel
@onready var exp_bar = \$HUD/ExpBar

func _process(delta):
	gold_label.text = "💰 金幣: " + str(GameManager.gold)
	level_label.text = "Lv. " + str(GameManager.level)
	exp_bar.value = (float(GameManager.exp) / GameManager.exp_to_next_level) * 100

func _on_upgrade_atk_pressed():
	if GameManager.upgrade_attribute("attack"):
		print("攻擊力提升！")

func _on_upgrade_spd_pressed():
	if GameManager.upgrade_attribute("speed"):
		print("攻速提升！")

func _on_upgrade_hp_pressed():
	if GameManager.upgrade_attribute("hp"):
		print("生命值提升！")