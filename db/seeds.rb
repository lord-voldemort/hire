# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

names = ["Rex Feng","Joseph DeVenuta","James Vanneman","Aaron Streiter","Corinna Brock","Josh Rowley","Brad Wheel","Adam Jonas","Jack Nolan","Jenya Zueva","Josh Rowey"]

companies = ["10sheet","42Floors","Alorus","Art.sy","Behance","Birchbox","Bloomberg","Blue Fountain Media","Bonobos","Breakfast","Bust Out Solutions","Canvas","CapLinked","Carrot Creative","Case Commons","Casual Corp","ChartBeat","Code 42","Code School/Envy Labs","codecademy","Codecademy","Collective","ConciergeLive","Contently","Critical Media","Crowd Tap","Cyrus Innovation","Foursquare","Fueled","Gust","Harvest","HopStop","Howcast","Ideeli","iMustardsoft","internet exposure","Intridea","iStrategyLabs","Jingle Punks","KickStarter","Lab49","Lifebooker","Lot18","Lover.ly","Lua","Medivo","ml gaming","Nerdery","Ny TImes","NYC Dev Shop","NYC Devshop","NYC on rails","OKCupid","OnDeck","One Kings Lane","Ordr.in","ParkAssist","PBS / POV","Peek","Pivotal Labs","Platform45","Plenishable","Quirky","reKiosk","SeatGeek","Sevenfifty","ShowMe","Sidetour","Skillshare","SmartAsset","Sumall","TalkSession","TimeHop","tst media","Universum","Viget","Wander","Warby Parker","WeWork","Zocdoc"]

names.each do |n|
  name = Student.new
  name.name = n
  name.save
end

companies.each do |c|
  company = Employer.new
  company.name = c
  company.save
end


