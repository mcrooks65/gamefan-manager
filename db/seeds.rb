# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

@dev = Developer.create(name: "RogueWare", location:"Los Angeles, CA", employees: 2, password: "tester", uid: 1)
@dev2 = Developer.create(name:"FakeDevStudios", location:"Cyberspace", employees: 42, password: "tester", uid: 2)
Fan.create(name:"Matt", game_id: 2)
Fan.create(name:"Chris", game_id: 1)
Game.create(title: "FreeHolder", price: 9.99, genre: "strategy", description: "Blending strategy, survival, and roguelike elements with RPG style character development, FreeHolder is the story of three escaped slaves in the time of the Roman Republic. Farm, hunt, craft, and cook your way through the years as you live on the edge of the beginning of the Empire.", developer: @dev)
Game.create(title: "Cyber Dawn", price: 9.99, genre: "strategy", description: "The next big thing in cyberpunk", developer: @dev)
Game.create(title: "FakeGame", price: 9.99, genre: "action", description: "This game isn't real.", developer: @dev2)
Game.create(title: "FakeGame2", price: 9.99, genre: "action", description: "This game isn't real either.", developer: @dev2)
Game.create(title: "FakeGame3",price: 9.99, genre: "action", description: "This game isn't real as well.", developer: @dev2)
