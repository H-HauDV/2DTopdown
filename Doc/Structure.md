# Project Structure (Entity + Components)

This is a concrete, scalable structure for a hybrid inheritance + component architecture in Godot 4.

## Goals

- Keep inheritance shallow.
- Put gameplay systems in components.
- Let Human, Animal, and Robot share systems where possible.
- Keep Player and NPC differences mostly in input/AI components.

## Folder Layout

```text
res://
	Assets/
		Characters/
		Tiles/
		UI/
	Scenes/
		Main.tscn
		World/
			TileMap.tscn
		Entities/
			BaseEntity.tscn
			Humans/
				Human.tscn
				PlayerCharacter.tscn
				NPC.tscn
			Animals/
				Animal.tscn
			Robots/
				Robot.tscn
		Components/
			MovementComponent.tscn
			HealthComponent.tscn
			NeedsComponent.tscn
			HungerComponent.tscn
			EnergyComponent.tscn
			CombatComponent.tscn
			InputMoveComponent.tscn
			AIMoveComponent.tscn
			InventoryComponent.tscn
			FactionComponent.tscn
	Scripts/
		Core/
			entity_component.gd
			component_manager.gd
			base_entity.gd
			entity_registry.gd
			game_events.gd
		Entities/
			human.gd
			player_character.gd
			npc.gd
			animal.gd
			robot.gd
		Components/
			movement_component.gd
			health_component.gd
			needs_component.gd
			hunger_component.gd
			energy_component.gd
			combat_component.gd
			input_move_component.gd
			ai_move_component.gd
			inventory_component.gd
			faction_component.gd
		Systems/
			navigation_service.gd
			combat_service.gd
			save_load_service.gd
			time_service.gd
		Autoload/
			game_state.gd
			service_locator.gd
	Data/
		Archetypes/
			human_base.tres
			player_default.tres
			npc_villager.tres
			animal_wolf.tres
			robot_worker.tres
		Components/
			hunger_default.tres
			energy_default.tres
			combat_default.tres
		Factions/
			faction_player.tres
			faction_neutral_town.tres
```

## Inheritance Tree

```text
BaseEntity
	Human
		PlayerCharacter
		NPC
	Animal
	Robot
```

Keep this tree short and stable. New gameplay behavior should mostly come from components.

## BaseEntity Node Contract

Each entity scene should look like this:

```text
EntityRoot (CharacterBody2D or Node2D)
	VisualRoot
		Sprite2D / AnimatedSprite2D
	CollisionRoot
		CollisionShape2D
	Components (Node)
		MovementComponent
		HealthComponent
		...
```

`BaseEntity` owns a `ComponentManager` and exposes:

- `add_component(component: EntityComponent)`
- `remove_component(type_name: StringName)`
- `get_component(type_name: StringName) -> EntityComponent`
- `has_component(type_name: StringName) -> bool`

## Component Rules

- Every component extends `EntityComponent`.
- Components do one responsibility each.
- Components should communicate through signals/events, not direct subclass checks.
- Components should not require `Human`/`Animal`/`Robot` types directly.

## Required Early Components

Build these first:

1. `MovementComponent`
2. `HealthComponent`
3. `NeedsComponent`
4. `InputMoveComponent` (player)
5. `AIMoveComponent` (npc)

Then add:

1. `CombatComponent`
2. `InventoryComponent`
3. `FactionComponent`

## Archetype Defaults

Use data resources to define which components an archetype receives.

Example:

- `Human`: movement, health, needs, inventory
- `PlayerCharacter`: human defaults + input_move
- `NPC`: human defaults + ai_move
- `Animal`: movement, health, needs, ai_move (no inventory by default)
- `Robot`: movement, health, energy, ai_move (no hunger)

## Save/Load Strategy

Persist:

- Entity identity (`id`, `archetype_id`, faction)
- Transform (`position`, optional rotation)
- Component state blobs by component type

Avoid storing scene internals directly; store data and rebuild entities from archetype + state.

## Naming Conventions

- Scene files: `PascalCase.tscn`
- Script files: `snake_case.gd`
- Component class names: `SomethingComponent`
- Resource IDs: lowercase with underscore

## Build Order (Practical)

1. Create `Core` classes (`EntityComponent`, `ComponentManager`, `BaseEntity`).
2. Convert current player into `PlayerCharacter` entity scene.
3. Move click movement into `InputMoveComponent`.
4. Add `NPC` scene with `AIMoveComponent`.
5. Add one `Animal` archetype using shared movement/health.
6. Add one `Robot` archetype using `EnergyComponent`.

