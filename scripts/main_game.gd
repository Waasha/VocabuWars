extends Node


@export var options_amount: int = 8
@export var option_btn: PackedScene

@onready var translate_word: Label = %TranslateWord
@onready var guess_btn_container: GridContainer = %GuessBtnContainer

var vocabulary: Dictionary = DataLoad.item_data
var option_words: Dictionary
var current_words: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.guessed.connect(on_guessed)
	fill_guess_options(options_amount)
	print_vocabulary(option_words)
	pick_current_words(option_words)
	create_guess_buttons(option_words)


func fill_guess_options(number_of_options):
	for i in number_of_options:
		var picked_words = vocabulary[vocabulary.keys().pick_random()]
		var index = vocabulary.find_key(picked_words)
		option_words[index] = picked_words
		vocabulary.erase(index)


func pick_current_words(options: Dictionary):
	var keys: Array = options.keys()
	current_words = options[keys.min()]
	translate_word.text = current_words[1]
	print("Current words we wanna guess are: ", current_words)


func create_guess_buttons(options: Dictionary):
	for i in options:
		var guess_btn = option_btn.instantiate()
		guess_btn.text = options[i][0]
		guess_btn_container.add_child(guess_btn)


func on_guessed(word: String):
	if word == current_words[0]:
		print("Correct guess!")
	else:
		print("Wrong!")


func print_vocabulary(vocab: Dictionary):
	for index in vocab:
		print(index, ": ", vocab[index])
