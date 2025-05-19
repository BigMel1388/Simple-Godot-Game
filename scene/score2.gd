extends Node
@onready var score_lable: Label = $"../player/score lable"

var score = 0

func add_Score():
	score += 1
	score_lable.text = "Score " + str(score)
	
