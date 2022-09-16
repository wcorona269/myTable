# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

#destroy all data before seeding
User.destroy_all
Restaurant.destroy_all
Review.destroy_all
Booking.destroy_all
Favorite.destroy_all

# users
user1 = User.create!(fname: "Food", lname: "Enjoyer", dname: "foodenjoyer", password: "ilovefood", email: "foodenjoyer@foodnetwork.com", phone: 2032550021)
user2 = User.create!(fname: "Guest", lname: "User", dname: "guest", password: "guestuser ", email: "guest@mytable.com", phone: 1234567890)
user3 = User.create!(fname: "Will", lname: "Corona", dname: "willcorona", password: "willyc", email: "wcorona269@gmail.com", phone: 2039138354)
user4 = User.create!(fname: "Veronica", lname: "Theobald", dname: "ronigirl99", password: "randolph", email: "veronica@ron.com", phone: 4444444444)
user5 = User.create!(fname: "Kyle", lname: "Ginzburg", dname: "kylekyle", password: "iamkyle", email: "kyle@kyle.com", phone: 5555555555)
user6 = User.create!(fname: "Amin", lname: "Babar", dname: "aminbabar", password: "iamamin", email: "amin@amin.com", phone: 6666666666)
user7 = User.create!(fname: "Jim", lname: "Nardi", dname: "jimnardi", password: "iamjimmy", email: "jim@jim.com", phone: 7777777777)


30.times do
	User.create!(
		fname: Faker::Name.unique.first_name,
		lname: Faker::Name.unique.last_name,
		dname: Faker::Internet.unique.username(specifier: 6),
		password: "fakeuser",
		email: Faker::Internet.unique.email,
		phone: rand(100000000..9999999999)
	)
end

# restaurants
rest1 = Restaurant.create!(
	name: "Hearth",
	description: "Hearth is everything the name implies, a warm, comfortable place where nourishment is savored, and hospitality is served up with love. Chef Marco Canora's cuisine employs seasonal, locally-sourced ingredients prepared with an Italian influence. Hearth serves REAL food that tastes, looks, and smells delicious. And most importantly, food that makes you feel good!",
	cuisines: "Italian Comfort",
	price_range: 4,
	neighborhood: "East Village",
	address: "403 East 12 Street New York, NY 10009",
	phone: 6466021300
)


rest1.icon.attach(io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/hearth/banner.png'), filename: 'hearth-icon.jpg')

rest1.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/hearth/banner.png'),
	filename: 'hearth_banner.jpg'
)

hearthpics = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/hearth/26504710.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/hearth/banner.png',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/hearth/26504732.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/hearth/26504723.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/hearth/26504722.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/hearth/26504715.jpg'
]

hearthpics.each do |path, i|
		file = open(path)
		rest1.photos.attach(io: file, filename:"hearth_#{i}.jpeg")
end

rest2 = Restaurant.create!(
	name: "Carmine's - 91st Street - NYC",
	description: "Carmine's is a family style restaurant offering exceptional value to its guests through the many dishes of Southern Italian cuisine. Restaurateur Artie Cutler crafted Carmine's with a singular vision; bringing his guests abundant portions and making any meal feel like an Italian American wedding feast.

	Platters of made to order pasta, decadent seafood or meat entrees, and of course homemade desserts are all staples at Carmine's, meant for sharing among friends and family. When great food and wine are supported by friendly and knowledgeable service, the results are magic - we want every day to feel like a Sunday afternoon at Grandma's!
	
	We are open for Indoor & Outdoor Dining, Pick-up, Delivery, Catering and Private Parties. Join us for Happy Hour at our Bar!",
	cuisines: "Italian",
	price_range: 3,
	neighborhood: "Upper West Side",
	address: "2450 Broadway New York, NY 10024",
	phone: 2123622200
)

rest2.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/carmines/47035289.jpg'),
	filename: 'carmines-icon.jpg')

rest2.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/carmines/banner.jpg'),
	filename: 'carmines_banner.jpg'
)

carmines = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/carmines/26533379.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/carmines/47035289.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/carmines/banner.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/carmines/carmines-atlantic-city-lobster.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/carmines/carmines-general-og.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/carmines/icon.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/carmines/image.jpeg'
]

carmines.each do |path, i|
		file = open(path)
		rest2.photos.attach(io: file, filename: "carmines_#{i}.jpeg")
end


rest3 = Restaurant.create!(
	name: "Bill's Bar and Burger",
	description: "Bill’s began in New York City back in 2009, becoming an instant hit with both burger junkies and locals alike. Bill’s burgers have evolved from countless tastings, recipe tweaking and lots of burger love — it's no wonder we've sold over 2.3 MILLION BURGERS!

	To our burger enthusiasts, you can never go wrong with classics like our Ultimate Cheeseburger, our signature triple-decker burger with the burger works and our special sauce... but if you're feeling adventurous, one of our crazy burger concoctions are sure to make your taste buds go crazy. 
	
	With 400 seats, Bill's Bar & Burger Rockefeller Center is the biggest standalone burger joint in the country — and trust us, our flavors are as big as our space (and our ego). And let's not forget that every burger, shake, and fry at Bill’s restaurants are made fresh daily, just for you!",
	cuisines: "American",
	price_range: 3,
	neighborhood: "Upper West Side",
	address: "16 W 51st St, New York, NY 10019",
	phone: 2127058510
)

rest3.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/bills/banner.jpeg'),
	filename: 'bills-icon.jpg')

rest3.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/bills/banner.jpeg'),
	filename: 'bills_banner.jpg'
)

bills = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bills/29390716.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bills/29390721.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bills/banner.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bills/bills1.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bills/bills2.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bills/image.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bills/outside.png',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bills/ProjectImage.jpg'
]

bills.each do |path, i|
		file = open(path)
		rest3.photos.attach(io: file, filename: "bills#{i}.jpeg")
end

rest4 = Restaurant.create!(
	name: "Central Park Boathouse",
	description: "With their 1858 landscaping plan under construction, Frederick Law Olmsted and Calvert Vaux began adding architectural features to their Park design. Around 1874, Vaux designed a two-story boathouse at the eastern end of the Lake. Here visitors could purchase refreshments, take boat rides, and watch other boats. After this wooden Victorian structure with sloping mansard roof burned down, the current Loeb Boathouse took its place in the 1950s. Today at the New York Boathouse visitors can enjoy a meal in any season, with overhead heating helping to extend as long as possible the pleasure of dining on the deck overlooking the Lake. Come visit a New York legend!",
	cuisines: "American",
	price_range: 3,
	neighborhood: "Midtown East",
	address: "Loeb Boathouse, Park Drive North, E 72nd St, New York, NY 10021",
	phone: 2125172233
)


rest4.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/centralpark/icon.jpeg'),
	filename: 'centralpark-icon.jpg')

rest4.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/centralpark/banner.jpeg'),
	filename: 'centralpark_banner.jpg'
)

centralpark = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/centralpark/41764395.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/centralpark/41764396.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/centralpark/41764397.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/centralpark/41764398.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/centralpark/41764399.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/centralpark/41764400.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/centralpark/banner.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/centralpark/boathouse.jpeg'
]

centralpark.each do |path, i|
		file = open(path)
		rest4.photos.attach(io: file, filename: "cp_#{i}.jpeg")
end


rest5 = Restaurant.create!(
	name: "Peter Luger Steak House",
	description: "Dig into a delicious steak at Peter Luger. With a history that stretches across three centuries, this landmark chophouse offers a classic 'no-frill' menu that includes mouthwatering grilled dishes served with delicious old fashioned sauce. Voted NYC's No. 1 steakhouse, Peter Luger is popular with many residents who rave about the burgers and steaks. Its casual decor and hall-type atmosphere provide the ideal setting for fun outings with friends or celebrating birthdays. This restaurant also provides catering services on request. Note that Peter Lugar accepts cash, checks and debit cards only.",
	cuisines: "Steakhouse",
	price_range: 3,
	neighborhood: "Williamsburg",
	address: "178 Broadway, Brooklyn, NY 11211",
	phone: 7183877400
)

rest5.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/lugers/icon.jpg'),
	filename: 'lugers-icon.jpg')

rest5.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/lugers/banner.jpg'),
	filename: 'lugers_banner.jpg'
)

lugers = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/lugers/3T5D5092.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/lugers/3T5D9775.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/lugers/1200px-Peter_Luger_Steak_House_(Brooklyn,_New_York)_001_crop.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/lugers/FINISHED-peter-luger-steakhouse-porterhouse-new-york.0.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/lugers/peter_luger_steak_house_brooklyn_new_york_1_636211101076624432.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/lugers/icon.jpg'
]

lugers.each do |path, i|
		file = open(path)
		rest5.photos.attach(io: file, filename: "lugers_#{i}.jpeg")
end

rest6 = Restaurant.create!(
	name: "Patsy's Pizzeria",
	description: "The original Patsy's in Harlem, unaffiliated with the rest of the Patsy's around the city, is a real piece of New York pizza history. Open since 1933, it was not only one of the first pizzerias in the city, it's also the one that supposedly pioneered selling pies by the slice. It still uses the original coal oven, which gives the thin, crisp crust a hint of smoky char that your average corner slice joint can't pull off with its gas ovens.",
	cuisines: "Pizza",
	price_range: 2,
	neighborhood: "East Harlem",
	address: "2287 1st Ave., New York, NY 10035",
	phone: 2125349783
)

rest6.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/patsys/icon.jpg'),
	filename: 'patsys-icon.jpg'
)

rest6.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/patsys/banner.jpg'),
	filename: 'patsys_banner.jpg'
)

patsys = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/patsys/02+INT.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/patsys/9869150afe394e64ab82fb628e9c7c5d.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/patsys/icon.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/patsys/IMG_0836.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/patsys/KatePrevite_PatsysPizza_PlainCheese_5.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/patsys/patsys-pizzeria-ht-mem-180510_hpMain_4x3_608.jpg'
]

patsys.each do |path, i|
		file = open(path)
		rest6.photos.attach(io: file, filename: "patsys_#{i}.jpeg")
end




rest7 = Restaurant.create!(
	name: "Katz's Delicatessen",
	description: "This cavernous cafeteria is a repository of New York history—glossies of celebs spanning the past century crowd the walls, and the classic Jewish deli offerings are nonpareil. Start with a crisp-skinned, all-beef hot dog for less than a fiver. Then flag down a meat cutter and order one of the legendary sandwiches. The brisket sings with horseradish, and the thick-cut pastrami stacked high between slices of rye is the stuff of dreams. Everything tastes better with a glass of the hoppy house lager; if you're on the wagon, make it a Dr. Brown's.",
	cuisines: "Delicatessen",
	price_range: 2,
	neighborhood: "Lower East Side",
	address: "205 E Houston St, New York, NY 10002",
	phone: 2122542246
)

rest7.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/katz/icon.jpeg'),
	filename: 'katz-icon.jpg'
)

rest7.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/katz/banner.jpeg'),
	filename: 'katz_banner.jpg'
)

katz = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/katz/katzs_nonseasonal-min.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/katz/Katzs_Delicatessen.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/katz/katz-deli-hackensack-new-jersey.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/katz/Katzs_20Deli_20-_20pastrami_20autopsy_20shot.0.0.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/katz/web_2_1.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/katz/banner.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/katz/icon.jpeg',
]

katz.each do |path, i|
		file = open(path)
		rest7.photos.attach(io: file, filename: "katz_#{i}.jpeg")
end

rest8 = Restaurant.create!(
	name: "Lombardi's",
	description: "Gennario Lombardi opened his shop in Soho in 1905—the first pizzeria in the U.S. It's hard to vouch for how the pizzas tasted a century ago, but there's more elbow room now after a renovation, if not the charm of the old joint. Still, Lombardi's continues to bake a hot contender for best pie.",
	cuisines: "Pizza",
	price_range: 2,
	neighborhood: "Nolita",
	address: "32 Spring St, New York, NY 10012",
	phone: 2129417994
)

rest8.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/lombardis/icon.jpeg'),
	filename: 'lombardis-icon.jpg'
)

rest8.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/lombardis/banner1.jpeg'),
	filename: 'lombardis_banner.jpg'
)

lombardis = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/lombardis/563242-309345872464192-1945172116-n.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/lombardis/7563094100_88d4b8afd2_b.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/lombardis/1522100872504.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/lombardis/banner.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/lombardis/icon.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/lombardis/pizza.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/lombardis/lombardis_outside.jpeg'
]

lombardis.each do |path, i|
		file = open(path)
		rest8.photos.attach(io: file, filename: "lombardis_#{i}.jpeg")
end


rest9 = Restaurant.create!(
	name: "Tavern on the Green",
	description: "Magical is a word thrown around a lot when discussing Tavern On The Green and one can't help but feel magic in the air. Jim and David, architect Richard Lewis and landscape architect Robin Key, preserved the Victorian/ Gothic elegance of the semi-circular building; it is authentic, natural, elegant and sexy. It has been re-built to spectacular precision and the décor is of a grand farmhouse one might find on the property of an Italian Villa or a historic Hudson River Valley mansion.",
	cuisines: "American",
	price_range: 3,
	neighborhood: "Midtown West",
	address: "Central Park West at 67th St, New York, NY 10023",
	phone: 2126325000
)


rest9.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/tavern/icon.jpeg'),
	filename: 'tavern_icon.jpg'
)

rest9.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/tavern/banner.jpeg'),
	filename: 'tavern_banner.jpg'
)

tavern = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/tavern/nice.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/tavern/night.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/tavern/Tavernonthegreen_ext.0.0.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/tavern/outside.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/tavern/frontal.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/tavern/reopening.jpeg',
]

tavern.each do |path, i|
		file = open(path)
		rest9.photos.attach(io: file, filename: "tavern_#{i}.jpeg")
end


rest10 = Restaurant.create!(
	name: "Rainbow Room",
	description: "The historic lounge atop 30 Rock serves breathtaking skyline views alongside old-world-meets-modern American fare from its perch 65 stories high. Dress to the nines (jackets are required) for a haute night of dinner and dancing at the center of the iconic crystal ballroom to the musings of a live band. Or upgrade your weekend with a decadent Sunday Brunch. Reservations for both are accepted up to six weeks in advance.",
	cuisines: "American",
	price_range: 4,
	neighborhood: "Midtown West",
	address: "30 Rockefeller Plaza 65th floor, New York, NY 10112",
	phone: 2129417994
)

rest10.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/rainbow/icon.jpeg'),
	filename: 'rainbow_icon.jpg'
)

rest10.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/rainbow/90f0dc119674c958e6c9d533e3e43ec6c81e1588-5120x2724.jpeg'),
	filename: 'rainbow_banner.jpg'
)

rainbow = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/rainbow/food1.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/rainbow/20141001-RAINBOW-slide-4IWD-superJumbo.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/rainbow/e9c2b329022f89801b0329b3fd8184b55e8a532f-2560x1364.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/rainbow/fc725677d3540e8248f4294de629c2875b55c59c-2560x1364.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/rainbow/food2.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/rainbow/huge.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/rainbow/rainbow.0.0.jpg'
]

rainbow.each do |path, i|
		file = open(path)
		rest10.photos.attach(io: file, filename: "rainbow_#{i}.jpeg")
end


rest11 = Restaurant.create!(
	name: "Rao's",
	description: "If you thought getting a table at Per Se was tough, try getting into Rao's. On second thought, don't. Rao's (pronounced “RAY-ohs”) is really a private club without the dues. To eat here, you'll need a personal invite from one of the heavy hitters who “owns” a table. These CEOs, actors, politicians, news personalities and neighborhood old-timers established a long-standing arrangement with the late, legendary owner Frankie “No” Pellegrino, and that's what ensures a seat at one of the ten tables at the Italian-American icon. In fact, reading this review is probably the closest you'll get to Rao's.",
	cuisines: "Italian",
	price_range: 4,
	neighborhood: "East Harlem",
	address: "455 E 114th St, New York, NY 10029",
	phone: 2127226709
)

rest11.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/raos/icon.jpeg'),
	filename: 'raos_icon.jpg'
)

rest11.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/raos/raos-harlem-restaurant-01.jpeg'),
	filename: 'raos_banner.jpg'
)

raos = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/raos/meatballs.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/raos/5eb03165cdfd48710d7de033.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/raos/merlin_130224302_f063b138-55d9-4aa3-8f93-196a7becdffc-superJumbo.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/raos/368c4808de687c7426a3801e53cd4817d4-raos-.rsocial.w1200.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/raos/icon.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/raos/raos-harlem-restaurant-01.jpeg'
]

raos.each do |path, i|
		file = open(path)
		rest11.photos.attach(io: file, filename: "raos_#{i}.jpeg")
end





rest12 = Restaurant.create!(
	name: "Grand Central Oyster Bar",
	description: "The oldest restaurant in Grand Central, this landmark has one of the largest and freshest seafood menus in the city. Here, you’ll find 25 types of fish and up to 30 varieties of oysters, along with other seafood specialties, including the world-famous pan roast. All of this is matched with an award-winning wine list featuring 80 selections by the glass. Open every day for lunch and dinner. Reservations are recommended. Come on in. The seafood’s fine.",
	cuisines: "Seafood",
	price_range: 2,
	neighborhood: "Midtown East",
	address: "Grand Central Terminal, Lower Concourse, 42nd St, New York, NY 10017",
	phone: 2124906650
)

rest12.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/oyster/icon.jpeg'),
	filename: 'oyster_icon.jpg'
)

rest12.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/oyster/real_banner.jpeg'),
	filename: 'oyster_banner.jpg'
)

oyster = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/oyster/OysterLunchCounter3.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/oyster/banner.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/oyster/Coleman-Elegy-for-the-Grand-Central-Oyster-Bars-Caviar-Sandwich.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/oyster/Grand-Central-Oyster-Bar-NYC_6_171020120021007-1600x800.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/oyster/OYSTER_BAR_COUNTERS_BEST.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/oyster/barold.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/oyster/banner1.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/oyster/real_banner.jpeg'
]

oyster.each do |path, i|
		file = open(path)
		rest12.photos.attach(io: file, filename: "oyster_#{i}.jpeg")
end

rest13 = Restaurant.create!(
	name: "Brooklyn Farmacy & Soda Fountain",
	description: "Did you know there aren't any eggs in an egg cream? The classic drink contains seltzer, milk, and chocolate syrup. For decades Brooklyn was known for its classic egg cream, which you could find at the local soda fountain or pharmacy. As these mom and pop stores shuttered, the egg cream almost became extinct. Luckily the egg cream has been reborn. Stop in at the Brooklyn Farmacy, a family owned soda fountain where you can sip egg creams and malts at the counter. Located in a restored 1920's corner pharmacy in Carroll Gardens, the charming ice cream parlor also serves comfort food.",
	cuisines: "Sweets",
	price_range: 1,
	neighborhood: "Cobble Hill",
	address: "513 Henry St, Brooklyn, NY 11231",
	phone: 7185226260
)


rest13.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/brooklyn/icon.jpeg'),
	filename: 'farmacy_icon.jpg'
)

rest13.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/brooklyn/bar.jpeg'),
	filename: 'farmacy_banner.jpg'
)

farmacy = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/brooklyn/brooklyn_farmacy_07__large.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/brooklyn/food.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/brooklyn/brooklyn-farmacy.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/brooklyn/counter.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/brooklyn/dessert.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/brooklyn/milkshake.jpeg'
]

farmacy.each do |path, i|
		file = open(path)
		rest13.photos.attach(io: file, filename: "farmacy_#{i}.jpeg")
end



rest14 = Restaurant.create!(
	name: "Nathan's Famous",
	description: "The famous frank joint's Surf-and-Stillwell flagship—opened in 1916—grills sizzling hot dogs daily and hosts its iconic, crowd-amassing eating contest every July 4. The original subway tiles and iconic signage are still intact, as are menu staples like crinkle-cut fries and thick-battered corn dogs, but there's one shiny “new” addition: a curbside clam bar, a revival of the restaurant's raw bar from the '50s. East Coast oysters and littlenecks are shucked per order over a mountain of ice, served with chowder crackers, lemon wedges, sinus-clearing horseradish and cocktail sauce.",
	cuisines: "American",
	price_range: 1,
	neighborhood: "Coney Island",
	address: "1310 Surf Ave, Brooklyn, NY 11224",
	phone: 7183332202
)


rest14.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/nathans/icon.jpeg'),
	filename: 'nathans_icon.jpg'
)

rest14.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/nathans/banner.jpeg'),
	filename: 'nathans_banner.jpg'
)

nathans = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/nathans/nathans.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/nathans/24BOOKSHELF-superJumbo.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/nathans/food.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/nathans/five-cent-hot-dogs-return-to-nathans-coney-island-index.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/nathans/download.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/nathans/nathans-coney-island-brooklyn-nyc-4y3a19480-eb73ec375056a36_eb73edb6-5056-a36f-23e0c8a689c2bd07__large.jpeg',
]

nathans.each do |path, i|
		file = open(path)
		rest14.photos.attach(io: file, filename: "nathans_#{i}.jpeg")
end



rest15 = Restaurant.create!(
	name: "Junior's",
	description: "Our landmark location restaurant is located on Cheesecake Corner and Harry Rosen Way--aka Flatbush Avenue EXT and DeKalb in Downtown Brooklyn.  Since 1950, the original Junior's features a fun and friendly atmosphere with Brooklyn memorabilia, a full service bar, and extensive menus for breakfast, lunch, and dinner. Our famous bakery is still in operation with fresh baked rolls and danish all day long.
	
	Visit us to enjoy overstuffed deli sandwiches, famous 10oz. steakburgers, fish, ribs, chicken and, of course, our extensive dessert selection featuring the World's Most Fabulous Cheesecake. Almost any day of the year, there's a family at Junior's celebrating a birthday, an anniversary, graduation, homecoming--you name it. Come visit us and have a taste of Brooklyn history.",
	cuisines: "American",
	price_range: 1,
	neighborhood: "Downtown Brooklyn",
	address: "386 Flatbush Ave Ext, Brooklyn, NY 11201",
	phone: 7188525257
)


rest15.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/juniors/icon2.jpeg'),
	filename: 'juniors_icon.jpg'
)

rest15.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/juniors/Juniors-2x.jpeg'),
	filename: 'juniors_banner.jpg'
)

juniors = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/juniors/icon.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/juniors/obama.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/juniors/Juniors-cheesecake-the-best-new-york-cheesecake.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/juniors/juniors-vintage-by-juniors.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/juniors/juniors-4.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/juniors/images.jpeg'
]

juniors.each do |path, i|
		file = open(path)
		rest15.photos.attach(io: file, filename: "juniors_#{i}.jpeg")
end

rest16 = Restaurant.create!(
	name: "Benihana",
	description: "Welcome to Benihana New York City, a dining experience unlike any other! Our restaurant is in the heart of Manhattan, on the same street as our original restaurant, opened in 1964! Our guests are seated at communal tables in groups, where your personal chef will perform the ancient art of Teppanyaki. Watch as we slice and dice, preparing a meal that will dazzle your eyes as well as your taste buds, whether you choose mouth-watering steak, tender chicken or succulent seafood. You can also enjoy sushi prepared by a talented sushi chef and indulge in a specialty cocktail. The restaurant includes a full bar with sushi lounge, great for after-work drinks, and meeting friends. Guests looking to celebrate a special occasion can dine in our elegant private dining rooms.
	
	Our private dining rooms are perfect for your next event! Call for more details. An 18% service charge is added to all guest checks for parties of eight or more. Proof of vaccination is required for in-restaurant dining.",
	cuisines: "Japanese",
	price_range: 2,
	neighborhood: "Midtown West",
	address: "47 W 56th St, New York, NY 10019",
	phone: 2125810930
)

rest16.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/benihana/icon.png'),
	filename: 'benihana_icon.jpg'
)

rest16.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/benihana/banner.jpeg'),
	filename: 'benihana_banner.jpg'
)

benihana = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/benihana/interior.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/benihana/maxresdefault.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/benihana/morefood.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/benihana/newyork_newyork.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/benihana/hibachi.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/benihana/Benihana_golden_valley.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/benihana/banner.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/benihana/alaskan_roll-1903x902.jpeg'
]

benihana.each do |path, i|
		file = open(path)
		rest16.photos.attach(io: file, filename: "benihana_#{i}.jpeg")
end

rest17 = Restaurant.create!(
	name: "Casa Limone",
	description: "Casa Limone offers all weekdays an Executive Lunch Menu for $35 and a Pre-Theatre Dinner menu for $45.
	Casa Limone, located in Midtown Manhattan, near The Rink at Rockefeller Center, MOMA, Radio City Music Hall, Saks Fifth Avenue, The Rockefeller Center Christmas Tree, Winter Village at Bryant Park and Times Square, is the first U.S. restaurant of the Monte Carlo Hospitality Group (MCHG), that also operates the famed Rampoldi Restaurant in Monte Carlo, its sister restaurant, the Michelin-starred La Table d'Antonio Salvatore, and the iconic Atlantic Grill in New York's Lincoln Square.
	
	The menu offers the flavors, wines and spirits of Chef Antonio Salvatore's upbringing in Basilicata and neighboring regions. Through the food, décor and staff, we are bringing the warmth of the Mediterranean that reigns in South of Italy.
	
	Casa Limone offers all weekdays an Executive Lunch Menu for $35 and a Pre-Theatre Dinner menu for $45.",
	cuisines: "Mediterranean",
	price_range: 2,
	neighborhood: "Rockefeller Center",
	address: "20 E 49th St, New York, NY 10017",
	phone: 16463706282
)


rest17.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/casa/icon.jpeg'),
	filename: 'casa_icon.jpg'
)

rest17.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/casa/banner.png'),
	filename: 'casa_banner.jpg'
)

casa = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/casa/Casa_Limone_Margherita_Bolognetta_Pizzas.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/casa/download+(1).jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/casa/huge.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/casa/huge.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/casa/outside.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/casa/Tavoli-parete-bottiglie-2-1024x684.png'
]

casa.each do |path, i|
		file = open(path)
		rest17.photos.attach(io: file, filename: "casa_#{i}.jpeg")
end


rest18 = Restaurant.create!(
	name: "Nom Wah Tea Parlor",
	description: "Nom Wah Tea Parlor first opened at 13–15 Doyers Street in 1920 as a bakery and tea parlor. For most of the 20th century, Nom Wah served as neighborhood staple, offering fresh Chinese pastries, steamed buns, dim sum, and tea.

	After it lost its lease at 15 Doyers in 1968, the restaurant moved into a brand new kitchen next door, occupying 11-13 Doyers Street ever since. Eventually, the restaurant became most famous for its almond cookie, lotus paste, and red bean filling, which is used for moon cake during the Chinese autumn festival.
	
	The first known owners of Nom Wah Tea Parlor, the Choy family, date back to the 1940s. It was then sold to Mr. Wally Tang in 1974. Wally has worked at the restaurant since 1950; he began working there at the age of 16, and by the time he turned 20, he was managing the restaurant. Nom Wah Tea Parlor hasn't gone through many changes throughout the years. Its vintage looks, good food and great value has kept generations of families coming back. Throughout the years, numerous movies and TV shows have been shot at Nom Wah Tea Parlor. A few include Reversal of Fortune, Premium Rush, All Good Things, and “Law and Order.”",
	cuisines: "Dim Sum",
	price_range: 2,
	neighborhood: "Chinatown",
	address: "13 Doyers St, New York, NY 10013",
	phone: 2129626047
)



rest18.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/nomwah/chinatown-shrimp-snowpea-dumpling.jpeg'),
	filename: 'nomwah_icon.jpg'
)

rest18.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/nomwah/nom-wah-cookbook-table-setting.jpeg'),
	filename: 'nomwah_banner.jpg'
)

nomwah = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/nomwah/EmilyS_NYC_NomWahTeaParlor_OutdoorDining.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/nomwah/nom-wah-dim-sum.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/nomwah/Nom-Wah-Tea-Parlor_2018_NOM_WAH_dim_sum_Credit-Paul_Wagtouicz_29.webp',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/nomwah/nom-wah-tea-parlor-interior-e1539679074411.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/nomwah/IMG_4938.0.jpg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/nomwah/image.jpeg'
]

nomwah.each do |path, i|
		file = open(path)
		rest18.photos.attach(io: file, filename: "nomwah_#{i}.jpeg")
end


rest19 = Restaurant.create!(
	name: "Sylvia's",
	description: "Sylvia's Restaurant, the “The Queen of Soul Food”, was founded by Sylvia Woods, in 1962. Established in the historic village of Harlem, Sylvia's is a community favorite, known as the world's kitchen. Serving authentic soul food for over 55 years, this icon remains a culinary must-visit for foodies. Gospel brunch Sundays, Live Music Wednesdays, and Daily Specials scream home-style cooking, within an at-home environment. Come visit for yourself, and experience why Presidents, celebrities, and Harlemites alike call Sylvia's home.

	Owned & Operated by The Woods Family.",
	cuisines: "Soul Food",
	price_range: 2,
	neighborhood: "Harlem",
	address: "328 Malcolm X Blvd New York, NY 10027",
	phone: 2129960660
)


rest19.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/sylvias/chicken.jpeg'),
	filename: 'sylvias_icon.jpg'
)

rest19.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/sylvias/banner.jpeg'),
	filename: 'sylvias_banner.jpg'
)

sylvias = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/sylvias/7CDLJRT5RYSFO2OV4NJSA4EUGE.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/sylvias/SYLVIAS1-superJumbo.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/sylvias/wish-we-had-time-for.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/sylvias/sylvias-restaurant-selected-nov-2015-71_v2-1024x913.jpg.webp',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/sylvias/smothered-chichen-with.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/sylvias/image.jpeg'
]

sylvias.each do |path, i|
		file = open(path)
		rest19.photos.attach(io: file, filename: "sylvias_#{i}.jpeg")
end





rest20 = Restaurant.create!(
	name: "Punjabi Grocery & Deli",
	description: "For the five years that Kulwinder Singh spent behind the wheel of a cab, grocery stores and delis across New York turned him away from their restrooms, even when he was a paying customer. Cab drivers he knew would go the entire day without a bathroom break, and there were rarely designated parking spots for longer periods away from the road or in case of emergency. When he took over a small storefront shop called Punjabi Grocery & Deli on East 1st Street in 1994, his first thought was to offer cab drivers a 24-hour restroom, free of charge—a place to decompress during or after a long day behind the wheel. Twenty-five years later, Punjabi Deli is a neighborhood institution.
	
	Punjabi Grocery and Deli is a typical South Asian canteen, serving a simple menu of rice, chaat (a variety of snack food common across the Subcontinent, consisting of fried doughs and chutneys), and a collection of staple vegetable dishes like saag (spinach), chana masala (spiced chickpeas), yellow dal, and curried potatoes with bell peppers. The dark green awning that reaches out over the sidewalk bears only the word Punjabi, the demonym for people from the region of Punjab, split between northwestern India and eastern Pakistan, where Singh was born.",
	cuisines: "Punjabi",
	price_range: 1,
	neighborhood: "East Village",
	address: "114 E 1st St, New York, NY 10009",
	phone: 2125333356
)

rest20.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/punjabi/4296576_iwxoAeIrK-uU2G1_FQsW4vjcfzH5cArv6VGWYxtpDYo.0.0.jpg'),
	filename: 'punjabi_icon.jpg'
)

rest20.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/punjabi/banner.jpeg'),
	filename: 'punjabi_banner.jpg'
)

punjabi = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/punjabi/punjabi.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/punjabi/hcmp39629_653937.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/punjabi/DSCN2063.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/punjabi/download.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/punjabi/20190107-DSC_9782.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/punjabi/1203-Adidas-3.webp'
]

punjabi.each do |path, i|
		file = open(path)
		rest20.photos.attach(io: file, filename: "punjabi_#{i}.jpeg")
end






rest21 = Restaurant.create!(
	name: "Le Bernardin",
	description: "Born in Paris in 1972 by sibling duo Maguy and Gilbert Le Coze, Le Bernardin only served fish: Fresh, simple and prepared with respect. After receiving its first Michelin star in 1976, and two more in 1980, the Le Coze's set to open Le Bernardin in New York in 1986.  

	After the unexpected passing of Gilbert in 1994, Maguy Le Coze began working closely with Chef Eric Ripert, a disciple and close friend of Gilbert, who took over the kitchen to continue preparing the freshest seafood with the simple philosophy that the fish is the star of the plate. 
	
	Le Bernardin earned four stars from The New York Times three months after its opening, never having dropped a star throughout five reviews, and is the only restaurant to maintain this rating for that length of time.
	
	The New York Zagat Guide has consistently recognized Le Bernardin as top rated in the category of “Best Food” and the 2011- 2016 editions awarded it a 29 food rating: the highest in New York City. In the 2012-2014, 2016 & 2017 Zagat Guides, Le Bernardin is named the Most Popular Restaurant in the city, and in the 2015–2017 guides, it’s also rated the city’s top restaurant for service. New York magazine also rated Le Bernardin #1 in its annual ranking of the 101 best restaurants in New York City in 2006. In his year-end dining feature, Frank Bruni of The New York Times selected Le Bernardin as the “Best Meal of 2008.” Most recently for 2019, Le Bernardin was ranked No. 1 in the World by La Liste, the global food guide and review aggregator.",
	cuisines: "French Seafood",
	price_range: 4,
	neighborhood: "Midtown",
	address: "153 W 51st St, New York, NY 10019",
	phone: 2125541119
)

rest21.icon.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/bernardin/LaBernadin-WORLD-2019-DISH1-min.jpeg'),
	filename: 'bernardin_icon.jpg'
)

rest21.banner.attach(
	io: open('https://my-table-pro.s3.amazonaws.com/rest_pics/bernardin/banner.jpeg'),
	filename: 'bernardin_banner.jpg'
)

bernardin = [
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bernardin/5251f98eeab8eac7683a7ba2.webp',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bernardin/9346e13cbdc7e123a5badba67d210de1.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bernardin/bernardin1_083121_1600.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bernardin/lb-gallery-food-wagyu-tartare-2.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bernardin/merlin_137960982_2751e315-69fb-4155-8c7f-1fecf2d8c531-superJumbo.jpeg',
	'https://my-table-pro.s3.amazonaws.com/rest_pics/bernardin/lobster-on-a-bed-of-truffled.jpeg'
]

bernardin.each do |path, i|
		file = open(path)
		rest21.photos.attach(io: file, filename: "bernardin_#{i}.jpeg")
end


# rest1 reviews
Review.create!(
	body: "The food was great but the serving sizes were tiny! If I'm going out for Italian food I want a feast! Overall a great restaurant but a little too 'hip' for me", 
	author_id: user1.id,
	rest_id: rest1.id, 
	food: 4, 
	service: 5, 
	ambience: 4,
	overall: 4 
)

Review.create!(
	body: "The best restaurant in NY. Food is amazing, the service, and the price. They are all astonishing. I loved it.", 
	author_id: user2.id, 
	rest_id: rest1.id, 
	food: 5, 
	service: 5, 
	ambience: 5,
	overall: 5 
)

Review.create!(
	body: "I went here for an anniversary date and it was spectacular. The staff was extremely professional. Try the cacao bars for dessert!", 
	author_id: user3.id,
	rest_id: rest1.id, 
	food: 5, 
	service: 5, 
	ambience: 5,
	overall: 5 
)

# rest2 reviews
Review.create!(
	body: "This place is a New York institution for a reason. The Gnocchi bolognese will change your life.", 
	author_id: user4.id, 
	rest_id: rest2.id, 
	food: 5, 
	service: 5, 
	ambience: 5,
	overall: 5 
)

Review.create!(
	body: "The best restaurant in NY. The food, the service, and the prices are all amazing. They are all astonishing. I loved it.", 
	author_id: user5.id, 
	rest_id: rest2.id, 
	food: 5, 
	service: 5, 
	ambience: 5,
	overall: 5 
)

Review.create!(
	body: "This restaurant is a shadow of its former self. Now just a tourist trap. Oh well, there's plenty of other great spots for NY Italian.", 
	author_id: user6.id,
	rest_id: rest2.id, 
	food: 3, 
	service: 2,
	ambience: 4,
	overall: 3 
)

bad_reviews = [
	'There was a bug in my food. Yuck.',
	"I'm never coming back. The manager was rude and condescending.",
	"I thought this was supposed to be a New York legend! What a dump.",
	"This place isn't what it used to be...",
	'The bathroom was disgusting, what kind of place are they running here?',
	"The waiter couldn't keep his eyes off my date. Very unprofessional.",
	"I've been to a lot of restaurants but this one takes the cake as the worst experience i've had. Unprofessional staff and food was cold.",
	"Waited an hour to be seated, and the food was cold!",
	"Waitress was rude, and gave us a dirty look when we asked to split the bill.",
	"Terrible!  We waited over an hour for our food",
	"I would not eat here. Service is horrible.",
	"Horrible...did not get water for over 15 minutes...finally got drinks after 20 minutes.  "
]

good_reviews = [
	"We walked in, and immediately got a table.",
	"We had an amazing server, which unfortunately I do not remember his name. He was a training a new waitress who was also very lovely.",
	"The food was plentiful, the kids portion was a great size, my daughter barely finished.",
	"The drinks (alcoholic and non alcoholic) were delicious.",
	"Great playlist, great last minute find. 100% recommend.",
	"I had a great time, there's a reason this place has been open for so long",
	"I took my family out here and everyone had a great time! Can't wait to come back",
	"This place is my favorite!! If you haven't been here make plans to come ASAP!!!",
	"WOW I love this place so much !! I'll always bring friends here when they visit just because I need another excuse to go! LOL",
	"Amazing wait staff. Food comes quick. Very impressed! Also well priced. :)",
	"Amazing ambiance, amazing service, and amazing food.",
	"We ate here twice and both times had great service and fantastic food! This place is top notch!",
	"Energetic atmosphere. Awesome waiter with a fantastic personality. Dinner was fun and lively. It was Saturday night and crowded. Make sure to give yourself plenty of time if your dining on a weekend. It will be  well worth it.",
	"Amazing service. Johnatan was wonderful. Friendly, knowledgeable and thorough. Went above and beyond.",
	"We had so much fun, great food and great atmostphere. Will definitely be coming back!",
	"Take your time while you're there and enjoy it. This place is legendary for a reason"
]

250.times do
	Review.create!(
		body: good_reviews.sample,
		author_id: rand(1..30),
		rest_id: rand(1..21), 
		food: rand(4..5),
		service: rand(4..5),
		ambience: rand(4..5),
		overall: 5 
	)
end

150.times do
	Review.create!(
		body: good_reviews.sample,
		author_id: rand(1..30),
		rest_id: rand(1..21), 
		food: rand(4..5),
		service: rand(4..5),
		ambience: rand(4..5),
		overall: rand(4..5) 
	)
	
end

95.times do
	Review.create!(
		body: bad_reviews.sample,
		author_id: rand(1..30),
		rest_id: rand(1..21), 
		food: rand(1..3),
		service: rand(1..3),
		ambience: rand(1..3),
		overall: rand(1..3) 
	)
end

(1..21).each do |idx|
	6.times do
		MenuItem.create!(
			rest_id: idx,
			item: [
				Faker::Food.dish,
				Faker::Food.description,
				rand(1..35).to_s
			]
		)
	end
end

dates = [
	"2022-06-08",
	"2022-05-10",
	"2022-05-30",
	"2022-08-20",
	"2022-09-01",
	"2022-10-15",
	"2022-11-05",
	"2023-01-06"
]

times = [
	"08:00",
	"15:00",
	"13:30",
	"12:00",
	"17:15"
]

(1..5).each do |idx|
	3.times do
		Booking.create!(
			date: dates.sample,
			time: times.sample,
			rest_id: rand(1..21),
			user_id: idx,
			party_size: rand(1..20),
			cancelled: false
		)
	end
end

(1..10).each do |idx|
	Favorite.create!(
		user_id: idx,
		rest_id: rand(1..7)
	)
	Favorite.create!(
		user_id: idx,
		rest_id: rand(8..14)
	)
	Favorite.create!(
		user_id: idx,
		rest_id: rand(15..21)
	)
end