extends Button


func _on_pressed() -> void:
	#print(self.text)
	Signals.guessed.emit(self.text)
