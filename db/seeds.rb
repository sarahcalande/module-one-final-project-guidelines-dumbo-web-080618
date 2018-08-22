require_relative '../config/environment'


# Sports

mets = Activity.create(name:"Sports", place: "Citi Field", genre: "Baseball", price: 50, best_time:1915, date: ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"])
nets = Activity.create(name:"Sports", place: "Barclay Center", genre: "Basketball", price: 70, best_time:2000, date: ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"])
knicks = Activity.create(name:"Sports", place: "Madison Square Garden", genre: "Basketball", price: 30, best_time:2000, date: ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"])
islanders = Activity.create(name:"Sports", place: " Nassau Veterans Memorial Coliseum", genre: "Hockey", price: 80, best_time:1800, date: ["Friday","Saturday","Sunday"])
giants = Activity.create(name:"Sports", place: "MetLife Stadium", genre: "Football", price: 80, best_time:1300, date: ["Thursday","Sunday"])


#Dancing
house = Activity.create(name:"Dancing", place:"House of Yes", genre: "House", price: 30, best_time:1800, date: ["Friday,Saturday"])
latin = Activity.create(name:"Dancing", place:"Bembe", genre: "Latin", price: 30, best_time:2200, date: ["Friday,Saturday"])
mumble_rap = Activity.create(name:"Dancing", place:"40/40 Club", genre: "Mumble Rap", price: 50, best_time:2200, date: ["Friday,Saturday"])
salsa = Activity.create(name:"Dancing", place:"Club Cache", genre: "Salsa", price: 40, best_time:2200, date: ["Friday,Saturday"])
mixture = Activity.create(name:"Dancing", place:"Output", genre: "Everything", price: 50, best_time:2000, date: ["Friday,Saturday"])

rooftopbar= Activity.create(name: "Bar", place:"Rooftop 93", genre: "Rooftop", price: 12, best_time: 2100)
hookahbar= Activity.create(name: "Bar", place: "Desert Rain Lounge", genre: "Hookah", price: 20, best_time: 2000)
cocktailbar= Activity.create(name: "Bar", place: "La Sala", genre: "Cocktails", price: 11, best_time: 2200)
beerbar= Activity.create(name: "Bar", place: "Harlem Hops", genre: "Beer", price: 7, best_time: 1800)
speakeasy= Activity.create(name: "Bar", place: "Please Don't Tell", genre: "Speakeasy", price: 20, best_time: 0030)


rapconcert= Activity.create(name:"Concert", place: "Madison Square Garden",genre: "Rap" ,price: 200, best_time: 2000)
electriczoo= Activity.create(name:"Concert", place: "Randall's Island Park",genre: "EDM",price: 70, best_time: 1100)
jazzconcert= Activity.create(name:"Concert", place: "Radio City Music Hall",genre: "Jazz",price: 20, best_time: 2200)
ladygaga= Activity.create(name:"Concert", place: "Barclays Center", genre: "Pop" ,price: 300, best_time: 2000)
countryconcert= Activity.create(name:"Concert", place: "PlayStation Theatre", genre: "Country",price: 70, best_time: 2100)


#####################       Museums      #############################


gugg = Activity.create(name: "Museum", place: "Guggenhiem Museum", genre: "Rich People's Collections", price: 25, best_time:1400, date:["Monday", "Tuesday", "Friday", "Saturday"])
met = Activity.create(name: "Museum", place: "Metropolitan Museum", genre: "Encycolpedic Collection", price: 20, best_time: 1000, date:["Monday", "Thursday", "Friday", "Saturday", "Sunday"])
moma = Activity.create(name: "Museum", place: "Museum of Modern Art (MoMA)", genre: "Modern Art", price: 15, best_time: 1200, date:["Monday", "Wednesday", "Friday", "Saturday",])
momi = Activity.create(name: "Museum", place: "Museum of the Moving Image", genre: "Movie Museum", price: 5, best_time:1530, date:["Wednesday" "Thursday", "Friday", "Saturday"])
mofd = Activity.create(name: "Museum", place: "Museum of Food and Drink", genre: "Food and Drink Museum", price: 205, best_time:1645, date:["Monday", "Tuesday"])


#################            Park                  ###################

central_park = Activity.create(name: "Park", place: "Central Park", genre: "All Purpose Large Park", price: 0, best_time:1030, date:["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"])
mccarren = Activity.create(name: "Park", place: "McCarren Park", genre: "All Purpse Mid-sized Park", price: 5, best_time:1100, date:["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"])
b_b_park = Activity.create(name: "Park", place: "Brooklyn Bridge Park Pier 5", genre: "Large Sports Park", price: 0, best_time:1500, date:["Monday", "Tuesday"])
gramercy = Activity.create(name: "Park", place: "Gramercy Park", genre: "Private Park", price: 20, best_time:600, date:["Sunday", "Monday", "Tuesday", "Friday", "Saturday"])
prospect = Activity.create(name: "Park", place: "Prospect Park", genre: "All Purpose Large Park", price: 0, best_time: 1200, date:["Monday", "Tuesday", "Thursday", "Friday", "Saturday"])


##############            Public Events              ##################

lecture = Activity.create(name: "Public Event", place: "Prospect Park", genre: "Lecture on Biodiversity in NYC", price: 0, best_time: 1800, date:"Friday")
soccer = Activity.create(name: "Park", place: "Central Park", genre: "All are welcome Soccor game", price: 10, best_time: 1900, date:["Tuesday", "Thursday", "Saturday"])
fashionweek= Activity.create(name:"Public Event", place: "NYFW",genre: "Fashion show",price: 50, best_time: 1300)
freeconcert= Activity.create(name:"Public Event", place: "Central Park",genre: "Free concert" ,price: 0, best_time: 1500)
outdoor_movie = Activity.create(name:"Public Events", place:"Bryant Park", genre: "Outdoor Movie", price: 0, best_time:1800, date: "Mondays")
vinyl_nights = Activity.create(name:"Public Events", place:"Outside of Madison Square Garden", genre: "Get together", price: 0, best_time:1930, date: "Thursday")

sara = User.create(name: "Sara",  email: "Sarah.C@hotmail")
juan = User.create(name: "Juan",  email: "Juan.C@hotmail")
eben = User.create(name: "Eben",  email: "Eben.W@hotmail")

act_1 = SavedActivity.create(user_id:3, activity_id:7)
act_2 = SavedActivity.create(user_id:3, activity_id:4)
act_3 = SavedActivity.create(user_id:3, activity_id:7)
