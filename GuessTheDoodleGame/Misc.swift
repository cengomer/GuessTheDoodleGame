//
//  Misc.swift
//  GuessTheDoodleGame
//
//  Created by omer elmas on 26.06.2024.
//

import Foundation

let everydayObjects = ["pen","paper","book",
"table","chair","computer","phone","keys","wallet",
"watch","clock","lamp","bed","pillow",
"mug","plate","bowl","spoon","fork","knife","cup",
"toothbrush","towel","shampoo","soap","mirror","brush",
"glasses","bottle","bag","shoes","socks","hat","jacket",
"pants","shirt","dress","scarf","umbrella","wallet",
"remote","television","radio","camera","earphones",
"charger","backpack","notebook","ruler","pencil",
"eraser","sharpener","highlighter","marker","stapler",
"tape","glue","scissors","calendar","envelope","keychain",
"fan","heater","vacuum","iron","blender","microwave",
"oven","stove","fridge","freezer","kettle","toaster",
"coffee maker","washing machine","dryer","broom",
"mop","bucket","sponge","duster","detergent","soap",
"plunger","toilet paper","trash can","bin bags","recycling bin",
"light bulb","extension cord","plug","adapter","switch",
"door handle","lock","hinge","screw","nail","hammer",
"wrench","pliers","saw","drill","tape measure","level",
"paint","brush","roller","tray","sandpaper","ladder",
"garden hose","sprinkler","shovel","rake","hoe",
"wheelbarrow","gloves","seeds","fertilizer","pots",
"watering can","lawn mower","trimmer","pruning shears",
"bicycle","helmet","skateboard","roller skates","scooter",
"backpack","tent","sleeping bag","flashlight","lantern",
"map","compass","binoculars","camera","sunscreen","insect repellent",
"first aid kit","water bottle","thermos","cooler","matches",
"firewood","grill","skewers","marshmallows","chocolate",
"graham crackers","fishing rod","tackle box","bait",
"life jacket","canoe","kayak","paddle","sailboat","motorboat",
"surfboard","snorkel","flippers","swim goggles","swim cap",
"beach ball","beach towel","sand toys","sun hat",
"sunglasses","swimsuit","flip flops","beach bag","cooler",
"beach umbrella","camp chair","portable speaker","tablet",
"laptop","mouse","keyboard","printer","scanner",
"USB drive","external hard drive","power bank","charger",
"headphones","microphone","webcam","smart watch",
"fitness tracker","game console","controller","VR headset",
"remote control","alarm clock","thermometer","humidifier",
"air purifier","fan","heater","dehumidifier","vacuum cleaner",
"mop","broom","dustpan","feather duster","bucket","sponge",
"scrub brush","toilet brush","plunger","trash bags",
"recycling bin","compost bin","dish soap","hand soap",
"hand sanitizer","disinfectant wipes","paper towels",
"napkins","toilet paper","facial tissue","cotton balls",
"cotton swabs","bandages","first aid kit","prescription medication",
"vitamins","thermometer","blood pressure monitor",
"glucose meter","eye drops","contact lens solution",
"heating pad","ice pack","hot water bottle","thermos",
"water bottle","travel mug","cooler","picnic basket",
"lunch box","snack bags","grocery bags","reusable bags",
"shopping cart","basket","tote bag","duffel bag","suitcase",
"carry-on bag","garment bag","luggage tags","passport holder",
"wallet","credit card","debit card","ID card","business card",
"cash","coins","checkbook","pen","pencil","marker",
"highlighter","notebook","journal","planner","calendar",
"address book","envelope","stamp","letter opener",
"clipboard","stapler","paper clips","binder clips","tape",
"glue stick","scissors","ruler","protractor","calculator",
"whiteboard","chalkboard","projector","screen","pointer",
"microphone","speaker","headphones","earbuds","USB cable",
"HDMI cable","charger","battery","extension cord",
"power strip","surge protector","light bulb","flashlight",
"candle","matches","lighter","fire extinguisher",
"smoke detector","carbon monoxide detector","security camera",
"alarm system","doorbell","key","lock","doorknob","hinge",
"drawer","cabinet","shelf","bookcase","desk","chair",
"table","sofa","couch","loveseat","armchair","recliner",
"bed","mattress","box spring","headboard","nightstand",
"dresser","mirror","closet","hanger","laundry basket",
"hamper","ironing board","iron","steamer","vacuum cleaner",
"sweep","mop","bucket","dustpan","broom","scrub brush",
"sponges","cleaning cloths","paper towels","disinfectant spray",
"window cleaner","toilet brush","plunger","trash can",
"recycling bin","compost bin","dish soap","hand soap",
"hand sanitizer","disinfectant wipes","dryer sheets",
"laundry detergent","fabric softener","stain remover",
"bleach","vacuum bags","air freshener","fan","heater",
"humidifier","dehumidifier","air purifier","space heater",
"electric blanket","heated mattress pad","cooling fan",
"ceiling fan","floor fan","table fan","air conditioner",
"space heater","radiator","thermostat","window fan",
"box fan","pedestal fan","tower fan","oscillating fan",
"desk fan","clip-on fan","handheld fan","mini fan",
"personal fan","USB fan","battery fan","solar fan",
"car fan","camping fan","ceiling fan","window air conditioner",
"portable air conditioner","mini air conditioner",
"evaporative cooler","swamp cooler","personal air cooler",
"air purifier","air filter","humidifier","dehumidifier",
"air quality monitor","thermometer","hygrometer",
"weather station","barometer","rain gauge","anemometer",
"light meter","sound level meter","carbon monoxide detector",
"smoke detector","fire extinguisher","emergency kit",
"first aid kit","emergency blanket","emergency radio",
"flashlight","batteries","power bank","solar charger",
"hand crank radio","emergency whistle","signal mirror",
"survival knife","multi-tool","compass","map","fire starter",
"water filter","water purification tablets","emergency food",
"emergency water","life jacket","emergency shelter",
"survival gear","emergency backpack","rescue blanket",
"emergency tent","emergency poncho","emergency flashlight",
"emergency lantern","emergency beacon","emergency siren",
"emergency flare","emergency signal mirror","emergency food bars",
]

enum PlayerAuthState: String {
    case authenticating = "Logging in to Game Center..."
    case unauthenticated = "Please sign in to Game Center to play."
    case authenticated = ""
    case error = "There w as an error logging into Game Center."
    case restricted = "You're not allowed to play multiplayer games!"
}

struct PastGuess: Identifiable {
    let id = UUID()
    var message: String
    var correct: Bool
}

let maxTimeRemaining = 100
