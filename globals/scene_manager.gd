extends Node


const GAME: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN: PackedScene = preload("res://scenes/main/main.tscn")
const PIPES: PackedScene = preload("res://scenes/pipes/pipes.tscn")


func load_game():
    get_tree().change_scene_to_packed(GAME)


func load_main():
    get_tree().change_scene_to_packed(MAIN)