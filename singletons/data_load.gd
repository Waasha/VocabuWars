extends Node

var item_data = {}

var vocabulary_filepath: String = "res://assets/vocabulary.csv"


func _ready():
	load_csv_file(vocabulary_filepath, item_data)
	#for word in item_data.values():
		#print(word)

func load_csv_file(file_path: String, target_dict: Dictionary = {}):
	if not FileAccess.file_exists(file_path):
		printerr("Vocabulary file not found!")
		return
	var data_file:FileAccess = FileAccess.open(file_path, FileAccess.READ)
	var i: int = 0
	while not data_file.eof_reached():
		target_dict[i] = data_file.get_csv_line()
		i += 1

#added comment to test git functionality
