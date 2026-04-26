# Tile map Survival Design

## 1. High Concept

A 2D colony survival RPG inspired by the systemic depth of RimWorld and the core gameplay is wandering, danger, hunger pressure, and faction-driven world of Kenshi.

Instead of a planet made of separated world tiles, the game takes place on one large island map (may be will change to auto generated terrain later). The player controls a small group of characters or one character, who can travel across the island, settle, raid, trade, steal, hunt, farm, recruit, enslave, harvest organs, and survive inside a harsh faction-controlled world.

The game should feel like a living simulation first:

- Characters are not classes. They improve by doing.
- Hunger, injury, labor, weather, law, faction politics, and social reputation create pressure.
- The player can build a settlement, wander as a squad, or mix both.
- The game should feel dangerous, persistent, and worth learning.

## 2. Design Pillars

### Systemic Survival

Survival should come from interacting systems rather than scripted quests. Food, wounds, weather, sleep, faction danger, and logistics should make simple travel meaningful.

### Skill Through Action

Characters gain skills automatically through repeated use. There are no skill points, class trees, or fixed builds.

Examples:

- Cooking improves by preparing meals.
- Medicine improves by treating wounds and surgery.
- Melee improves by fighting with melee weapons.
- Stealth improves by sneaking near enemies.
- Thievery improves by stealing and lockpicking.
- Farming improves by planting, tending, and harvesting crops.

### Squad And Colony Freedom

The player can control a mobile group, manage a settlement, or split people between both.

Examples:

- Send two characters to trade while others farm.
- Abandon a failing base and travel to another region.
- Raid a faction camp and return with supplies.
- Build a hidden outpost near a hostile kingdom.

### Faction-Driven World

The island has kingdoms, tribes, gangs, traders, religious orders, slavers, raiders, and independent towns. Factions should own territory, enforce laws, trade resources, react to crimes, and remember player actions.

### Moral Freedom With Consequences

The game allows harsh systems such as stealing, imprisonment, slavery, organ harvesting, execution, and black-market trade. These systems should have serious consequences through law, reputation, faction hostility, colonist mood, prisoner resistance, and market access.

## 3. Camera And World Format

### View

- 2D top-down.
- Characters are visible as simple readable sprites.
- Environment should prioritize clarity over visual noise.

### World Map

The world is one large island instead of separated world tiles map like rimworld.

The island contains (may be extend in future):

- Coastlines
- Forests
- Grasslands
- Mountains
- Swamps
- Deserts or dry badlands
- Rivers and lakes
- Roads and trade paths
- Towns
- Faction bases
- Ruins
- Caves
- Bandit camps
- Farmable zones
- Dangerous wilderness

### Local Movement

Characters move directly on the island map. There is no separate abstract planet layer for early versions.

Possible later improvement:

- Add regional zoom levels if the island becomes too large to simulate at once.

## 4. Core Gameplay Loop

### Early Game Loop

1. Start with one to five weak characters.
2. Search for food, shelter, and basic tools.
3. Avoid starvation, injury, and stronger enemies.
4. Train basic skills through use.
5. Build a small camp or reach a town.
6. Decide whether to settle, trade, steal, recruit, or migrate.

### Mid Game Loop

1. Establish a base or mobile squad economy.
2. Produce reliable food.
3. Recruit, capture, or hire more people.
4. Trade with towns and factions.
5. Defend against raids, wildlife, hunger, weather, and disease.
6. Choose enemies and allies.
7. Craft weapons, armour,...

### Late Game Loop

1. Build a powerful settlement, criminal empire, mercenary company, kingdom, or nomad faction.
2. Control territory and resources.
3. Defeat or ally with major kingdoms.
4. Influence island politics.
5. Create long-term survival systems such as farms, hospitals, prisons, workshops, and trade routes.

## 5. Character System

### Character Data

Each character should have:

- Name
- Age
- Race
- Gender
- Faction
- Background
- Health
- Hunger
- Stamina (Recover by sleep)
- Mood
- Inventory and equipment
- Skills
- Traits
- Relationships
- Prisoner or slave status
- Current job or command

### Skills

Initial skill list:

- Melee
- Ranged
- Defense
- Athletics
- Strength
- Stealth
- Thievery
- Lockpicking
- Cooking
- Farming
- Mining
- Crafting
- Construction
- Medicine
- Surgery
- Social
- Animal handling
- Trading

### Skill Growth

Skills grow from use.

Design notes:

- Low skill levels should rise quickly.
- High skill levels should take much longer.
- Risky actions can give more experience.
- Failure should still teach, but less than success.
- Injuries, hunger, fatigue, and mood can reduce performance.

## 6. Needs And Survival

### Hunger

Hunger is a major early-game pressure.

Food sources:

- Foraging
- Hunting
- Fishing
- Farming
- Trading
- Stealing
- Raiding
- Butchering animals
- Emergency cannibalism as a severe mood and reputation event

Hunger effects:

- Reduced work speed
- Reduced combat ability
- Mood loss
- Collapse
- Death by starvation

### Health

Health uses body parts rather than one simple hit point bar.

Body parts:

- Head
- Torso
- Left arm
- Right arm
- Left leg
- Right leg
- Internal organs

Damage types:

- Cut
- Blunt
- Piercing
- Burn
- Infection
- Disease
- Blood loss

### Medicine And Surgery

Medical systems should support:

- Bandaging
- Infection treatment
- Surgery
- Amputation
- Organ harvesting
- Organ transplant
- Prosthetics later

Medical actions should depend on skill, tools, cleanliness, lighting, and patient condition.

## 7. Control Model

### Squad Control

The player can select one or more characters and issue commands.

Commands:

- Move
- Attack
- Follow
- Guard
- Sneak
- Pick up item
- Interact
- Rescue
- Capture
- Trade
- Steal
- Work priority

### Colony Control

Characters can also be assigned jobs and priorities.

Job categories:

- Cook
- Farm
- Build
- Mine
- Craft
- Haul
- Clean
- Doctor
- Guard
- Hunt
- Research
- Train

The player should be able to pause, plan, and let characters execute jobs automatically.

## 8. Settlement System

### Building

Basic structures:

- Walls
- Doors
- Beds
- Storage
- Campfire
- Cooking station
- Farm plots
- Workbench
- Medical bed
- Prison bed
- Training dummy

Future structures:

- Power systems
- Defensive turrets
- Advanced hospital
- Research bench
- Slave pen
- Organ lab
- Market stall
- Faction embassy

### Resources

Initial resources:

- Food
- Wood
- Stone
- Metal ore
- Cloth
- Medicine
- Weapons
- Tools
- Money

## 9. Crime And Law

### Crime Types

- Theft
- Trespassing
- Assault
- Murder
- Kidnapping
- Escaping prison
- Smuggling
- Slavery in anti-slavery territories
- Organ harvesting

### Law Response

Factions can react with:

- Warning
- Fine
- Arrest
- Confiscation
- Bounty
- Hostility
- Execution
- War

### Stealing

Stealing should be skill-based and context-sensitive.

Factors:

- Stealth skill
- Thievery skill
- Witnesses
- Lighting
- Item value
- Faction law
- Character disguise or faction uniform later

## 10. Prisoners, Slavery, And Organ Harvesting

These are mature systems and should be designed as serious simulation mechanics with consequences, not casual rewards.

### Prisoners

Prisoners can be:

- Held
- Fed or neglected
- Recruited
- Ransomed
- Released
- Sold where legal
- Used for surgery or organ harvesting

### Slavery

Slavery can exist as a faction and economy system.

Design rules:

- Some factions allow slavery.
- Some factions violently oppose it.
- Escaped slaves may join, flee, rebel, or seek revenge.
- Owning slaves should affect reputation, colonist mood, and faction relations.

### Organ Harvesting

Organ harvesting requires:

- Captive or patient
- Medical bed
- Tools
- Medicine
- Surgery skill
- Time

Consequences:

- Death or permanent injury risk
- Mood penalties for some characters
- Reputation damage
- Illegal market value
- Faction hostility if discovered

## 11. Factions And Kingdoms

### Initial Faction Types

- Coastal kingdom
- Inland kingdom
- Trader guild
- Bandit clans
- Slaver faction
- Anti-slavery rebels
- Religious order
- Nomad tribe
- Isolated cannibal group
- Independent towns

### Faction Data

Each faction should have:

- Name
- Territory
- Settlements
- Laws
- Economy
- Leader
- Military strength
- Opinion of other factions (relation)
- Trade goods
- Crime tolerance

### Faction Behavior

Factions can:

- Patrol roads
- Guard towns
- Raid enemies
- Trade
- Hunt criminals
- Attack player bases
- Offer recruitment
- Demand taxes
- Buy or sell slaves depending on law

## 12. Economy

### Trade Goods

- Food
- Medicine
- Weapons
- Armor
- Raw materials
- Animals
- Books or research items
- Organs in black markets
- Slaves in slaver towns

### Prices

Prices should vary by:

- Region
- Scarcity
- Faction law
- Supply and demand later
- Player reputation
- Crime status

## 13. AI And Simulation

### Character AI

Characters need:

- Job selection
- Hunger response
- Threat response
- Combat behavior
- Flee behavior
- Rescue behavior
- Medical treatment behavior
- Prisoner escape attempts

### World AI

World simulation should include:

- Faction patrols
- Wandering traders
- Bandit raids
- Wildlife migration
- Town guards
- Prisoner caravans
- Slave caravans

Early versions should fake distant simulation with simple timers and events instead of fully simulating every entity at once.

## 14. Combat

### Combat Style

Real-time with pause.

Combat should be dangerous, especially early.

Important factors:

- Skill
- Weapon type
- Armor
- Body part damage
- Numbers
- Hunger
- Fatigue
- Injuries
- Morale

### Weapon Types

- Fists
- Knives
- Clubs
- Swords
- Spears
- Bows
- Crossbows
- Primitive guns later

## 15. Art Direction

### Style Goal

Readable 2D sprites with simple animation and strong silhouettes.

Recommended initial style:

- Top-down or angled top-down characters
- Low-to-medium detail
- Modular clothing and hair layers
- Clear faction color accents
- Earthy but not muddy environment colors

### Asset Priorities

First asset set:

- Base human body
- Hair variants
- Basic shirt and pants
- Simple weapons
- Wild food plants
- Campfire
- Bedroll
- Storage crate
- Dirt, grass, sand, water, forest, mountain ground tiles

Animation priorities:

- Idle
- Walk
- Attack
- Work
- Downed

## 16. Godot Implementation Plan

### Project Type

- Godot 4.x
- 2D project
- Real-time with pause
- Data-driven entities where possible

### Suggested Folder Structure

```text
res://
  assets/
    characters/
    environment/
    items/
    ui/
  scenes/
    main/
    world/
    characters/
    settlement/
    ui/
  scripts/
    core/
    characters/
    world/
    factions/
    jobs/
    combat/
    ui/
  data/
    factions/
    items/
    skills/
    buildings/
    biomes/
  design/
```

### Technical Systems

Build in this order:

1. Main scene and camera.
2. Large island map prototype.
3. Character selection and movement.
4. Hunger and basic needs.
5. Skill gain by doing.
6. Inventory and items.
7. Simple combat.
8. Basic jobs.
9. Building placement.
10. Faction ownership and relationships.
11. Crime and stealing.
12. Prisoner system.
13. Trade system.
14. Surgery and organ systems.
15. Slavery and faction law consequences.

## 17. Minimum Viable Prototype

The first playable prototype should be small and focused.

### MVP Goal

One small squad survives on a small island region with hunger, movement, simple combat, foraging, and skill growth.

### MVP Features

- One generated or handmade island test map.
- Three controllable characters.
- Click selection and right-click movement.
- Hunger meter.
- Forageable food plants.
- One hostile enemy group.
- Melee combat.
- Basic body-part injury.
- Skills improve from movement, combat, foraging, and medicine.
- Simple camp objects: bedroll, campfire, storage.
- Pause and speed controls.

### Not In MVP

- Full factions
- Slavery
- Organ harvesting
- Complex law
- Large economy
- Advanced building
- Full world simulation

These features should come later, after the survival and squad-control loop feels good.

## 18. Milestones

### Milestone 1: Movement And Island Prototype

- Main scene
- Camera movement and zoom
- Island test map
- Selectable characters
- Right-click movement
- Basic UI panel

### Milestone 2: Hunger And Foraging

- Character hunger
- Food items
- Forageable plants
- Eating behavior
- Starvation effects

### Milestone 3: Skills By Doing

- Skill data
- Experience gain events
- Athletics, melee, foraging, medicine
- Skill display UI

### Milestone 4: Combat And Injury

- Hostile NPCs
- Melee attacks
- Body-part damage
- Downed state
- Basic treatment

### Milestone 5: Camp And Jobs

- Campfire
- Bedroll
- Storage
- Job priorities
- Hauling and basic work automation

### Milestone 6: Faction Foundation

- Faction data
- Territory markers
- Reputation
- Guards, bandits, traders
- Simple town prototype

### Milestone 7: Crime And Prisoners

- Ownership
- Theft detection
- Prison beds
- Capturing
- Recruitment and ransom

### Milestone 8: Mature Systems

- Slavery
- Organ harvesting
- Surgery risk
- Black markets
- Law and faction consequences

## 19. Open Design Questions

- Should the island be fully handmade, procedural, or handmade with procedural details?
- Should characters use gridless movement or tile/grid-based movement under the hood?
- Should the player start as survivors, escaped slaves, criminals, settlers, or a custom squad?
- How dark should the tone be compared with the visual style?
- Should towns be enterable directly on the same map or loaded as separate local scenes?
- Should combat be mostly automatic after orders, or should the player give many tactical commands?
- Should base building use free placement or snap-to-grid placement?

## 20. Immediate Next Step

Continue from the current prototype into the first camp and job systems:

- Campfire
- Bedroll
- Storage
- Job priorities
- Hauling and basic work automation

This should happen before adding complex factions, crime, slavery, organ harvesting, or advanced economy systems.

## 21. Prototype Progress

Completed so far:

- Milestone 1: movement, camera, island test map, character selection, right-click squad movement, basic HUD.
- Milestone 2: hunger drain, hunger states, forageable berry bushes, carried food, auto-eating, depleted forage visuals.
- Milestone 3: Athletics and Foraging skills that improve by doing, starting skill differences, selected-character skill HUD, foraging speed bonus from skill.
- Milestone 4: hostile raiders, right-click attack orders, melee skill growth, body-part injuries, downed state, basic treatment, Medicine skill growth.
