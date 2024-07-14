extends Node


@export var options_amount: int = 8
@export var option_btn: PackedScene

@onready var guess_btn_container: GridContainer = $CenterContainer/VBoxContainer/GuessBtnContainer

var vocabulary: Dictionary = DataLoad.item_data
var option_words: Dictionary
var current_words: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fill_guess_options(options_amount)
	print_vocabulary(option_words)
	pick_current_words(option_words)
	create_guess_buttons(options_amount)


#func pick_current_words():
	#current_words = vocabulary[vocabulary.keys().pick_random()]


func fill_guess_options(number_of_options):
	for i in number_of_options:
		var picked_words = vocabulary[vocabulary.keys().pick_random()]
		var index = vocabulary.find_key(picked_words)
		option_words[index] = picked_words
		vocabulary.erase(index)


func pick_current_words(options: Dictionary):
	var keys: Array = options.keys()
	current_words = options[keys.min()]
	print("Current words we wanna guess are: ", current_words)


func create_guess_buttons(number_of_guesses: int):
	for i in number_of_guesses:
		var guess_btn = option_btn.instantiate()
		guess_btn.text = "test"
		guess_btn_container.add_child(guess_btn)


func print_vocabulary(vocab: Dictionary):
	for index in vocab:
		print(index, ": ", vocab[index])
