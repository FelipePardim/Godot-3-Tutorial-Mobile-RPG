extends Node

var max_hp = 25 #Max health points
var hp = max_hp setget set_hp #Health points
var max_ap = 3 #Max action points
var ap = max_ap setget set_ap #Action points
var max_mp = 10 #Max mana points
var mp = max_mp setget set_mp #Mana points

signal hp_changed(value)
signal ap_changed(value)
signal mp_changed(value)
signal end_turn

func set_hp(value):
	hp = clamp(value, 0, max_hp)
	emit_signal("hp_changed", hp)
	
func set_ap(value):
	ap = clamp(value, 0, max_ap)
	emit_signal("ap_changed", ap)
	if ap == 0:
		emit_signal("end_turn")
	
func set_mp(value):
	mp = clamp(value, 0, max_mp)
	emit_signal("mp_changed", mp)
