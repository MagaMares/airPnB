puts "Cleaning database..."
sleep(2)

Booking.destroy_all
Planet.destroy_all
User.destroy_all

require "open-uri"

romano = User.new(first_name: "Romano", last_name: "Caillardo", email: "romain@gmail.com", password: "azerty")
annabelle = User.new(first_name: "Annabelle", last_name: "Etoile", email: "annabelletoile@hotmail.fr", password: "azerty")

file = File.open(Rails.root.to_s + "/app/assets/images/annabelle.png")
annabelle.photo.attach(io: file, filename: "profile_picture", content_type: "image/png")
annabelle.save!

file = File.open(Rails.root.to_s + "/app/assets/images/romano.png")
romano.photo.attach(io: file, filename: "profile_picture", content_type: "image/png")
romano.save!

puts "created #{romano['first_name']}"
puts "created #{annabelle['first_name']}"

planets = [
  [{ name: "212-Beach", description: "Cette planète vous charmera par sa mono plage d'une surface de 15 millions de m2. Vous pourrez y bronzer 29h par jour. N'oubliez pas votre crème solaire indice 10.000 car ses 2 étoiles sont super massives.", address: "10600 galaxie R27 (1ere à droite après l'étoile Vega)", planet_type: "Sablonneuse", price: 10000 }, "sand"],
  [{ name: "456-Volcania", description: "Cette planète vous charmera par ses 14767 volcans en activité. Cette planète est une aventure à explorer. Un vrai bonheur pour tout les pompiers intergalactiques, à qui nous réservons des réductions sur les locations à l'année. En effet, il est difficile de les éteindre en moins d'un an, les 14767 volcans.", address: "137, galaxie QZ-45-RT , Proximus Actarus (juste derrière le cygne)", planet_type: "Volcanique", price: 10000 }, "volcania"],
  [{ name: "70-Ocean's Eleven", description: "Cette planète vous charmera par son mono océan de 15 millions de km2. Elle peut acceuillir les Kite Surfers des plus débutants aux plus expérimentés. Les vagues de l'hemisphere nord atteignent des hauteurs de 127 mètres avec un temps de reflux de 15600 minutes Alpha. C'est un paramètre important, très recherché au sein des galaxies humides. Au sud, à l'inverse, les vents nuls permettent une pratique du pédalo.", address: "2, nébuleuse du drakar noir , Oceanus Pupus (derrière la voile bleue)", planet_type: "Oceanique", price: 15500 },"ocean"]
]

planets.each do |planet|
  new_planet = Planet.new(planet[0])
  file = File.open(Rails.root.to_s + '/app/assets/images/planets' + "/#{planet[1]}.png")
  new_planet.photo.attach(io: file, filename: "#{planet[1]}", content_type: "image/png")
  new_planet.user = annabelle
  puts "created #{new_planet['name']}"
  sleep(1)
  new_planet.save!
end

planets = [
  [{ name: "36-Luxuria", description: "Cette planète vous charmera par sa luxiuriance. Ses 3 jungles d'une superficie totale de 15000 km2 abritent une faune et une flore exceptionnelle. ATTENTION certaines espèces venimeuses tombent des fougères géantes, aussi prévoyez un extracteur venimique à double insertion et alimentation solaire. La marque Aspi-venin est recommandée", address: "36 Interespace forestier de la nébuleuse du tilleul, galaxie de la tete de renard.", planet_type: "Forestière", price: 37000 }, "forest-ok"],
  [{ name: "Z36-GALAK", description: "Cette planète boule de neige vous charmera par son air vivifiant, son environnement paisible et ses températures glaciales. Aucun congélateur n'est à prévoir concernant vos réserves de nourritures, stockable en plein air. L'activité principale proposée aux visiteurs est le patin à glace. 125.690km de pistes vous sont dédiées.", address: "137 piste interstallaire ZZ-67 , galaxie du traineau.", planet_type: "Snowball", price: 45000}, "snowball"],
  [{ name: "ASTEROID-B612", description: "Cette planète astéroide charmera les enfants terriens qui y retrouveront l'un des personnages phare de leur enfance, le petit prince. Les activités proposées sont le ramonage des petits volcans de l'asteroide ainsi que l'arrachage de baobabs qui fleurissent à sa surface. Enfin, en déplaçant leurs chaises de quelques centimètres par heure, les enfants pourront voir le soleil se coucher 44 fois par jour.", address: "37, passage galactique de l'allumeur de réverbère, constellation du mouton.", planet_type: "Asteroide", price: 1200 }, "asteroid"],
  [{ name: "ZEF-Air-Planet", description: "Cette planète vous charmera par ses vents puissants. Elle n'a pas de sol, ce qui permet une pratique longue du saut en chute libre ( 3 jours de traversée). ATTENTION, il est important de prévoir 2 véhicules spaciaux, l'un pour le départ, l'autre pour l'arrivée, car les sauteurs traversent la planète et doivent être récupérés à la sortie.", address: "Nuage de Magellan, galaxyie Ventus Parapentus (derrière la constellation du parapente)", planet_type: "Air Planet", price: 27600 }, "air"]
]

planets.each do |planet|
  new_planet = Planet.new(planet[0])
  file = File.open(Rails.root.to_s + '/app/assets/images/planets' + "/#{planet[1]}.png")
  new_planet.photo.attach(io: file, filename: "#{planet[1]}", content_type: "image/png")
  new_planet.user = romano
  puts "created #{new_planet['name']}"
  sleep(1)
  new_planet.save!
end
