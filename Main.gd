extends Node

export (PackedScene) var mob_scene


func _on_MobTimer_timeout():
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.unit_offset = randf()
	
	var mob = mob_scene.instance()
	add_child(mob)
	
	mob.position = mob_spawn_location.position
	
	var rotation = mob_spawn_location.rotation + PI / 2
	rotation += rand_range(-PI / 4, PI / 4)
	mob.rotation = rotation
	
	var velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = velocity.rotated(rotation)
