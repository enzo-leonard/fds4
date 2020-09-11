
require 'csv'
def test_in(word, array) array.index(word) end



ProjetTheme.destroy_all
ProjetTarget.destroy_all
ProjetForm.destroy_all
Projet.destroy_all
Target.destroy_all
Form.destroy_all
Theme.destroy_all


difficulty_array = ["Curieux","Amateur","Averti"]
territory_array = ["Ain", "Ardèche", "Auvergne", "Drôme", "Isère", "Loire", "Rhône", "Savoie", "Haute-Savoie"]
duration_array = ["Moins de 5 minutes", "5 à 15 minutes", "15 à 60 minutes", "Plus d'une heure"]

Theme.create!({id:1, name: "Sciences de l'environnement (Agronomie, écologie, développement durable)"})
Theme.create!({id:2, name: "Sciences de l'ingénieur"})
Theme.create!({id:3, name: "Sciences de la Terre et de l'univers, de l'espace"})
Theme.create!({id:4, name: "Sciences de la vie et de la santé"})
Theme.create!({id:5, name: "Sciences exactes (Maths, physique, chimie)"})
Theme.create!({id:6, name: "Sciences humaines et sociales"} )
Theme.create!({id:7, name: "Sciences numériques"} )

Form.create!({id:1, name: "Conférence-débat"})
Form.create!({id:2, name: "Vidéo"})
Form.create!({id:3, name: "Infographie"})
Form.create!({id:4, name: "Article"})
Form.create!({id:5, name: "Reportage"})
Form.create!({id:6, name: "Visite virtuelle"})
Form.create!({id:7, name: "Spectacle"})
Form.create!({id:8, name: "Animation"})
Form.create!({id:9, name: "Exposition"})
Form.create!({id:10, name: "Jeu"})
Form.create!({id:11, name: "Village des sciences virtuel"})
Form.create!({id:12, name: "Atelier"} )
Form.create!({id:13, name: "Visio-conférence"} )
Form.create!({id:14, name: "Podcast"} )
Form.create!({id:15, name: "Webinaire interactif"} )


Target.create!({id:1, name: "3 - 6 ans | Maternelle"})
Target.create!({id:2, name: "6 - 11 ans | Primaire"})
Target.create!({id:3, name: "11 - 15 ans | Collège"})
Target.create!({id:4, name: "15 - 18 ans | Lycée"})
Target.create!({id:5, name: "18 - 25 ans | Étudiant"})
Target.create!({id:6, name: "25 ans et +"} )#6



csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
CSV.foreach("db/data.csv", csv_options) do |item|


date = nil
if item['date']
    year = item['date'].split('/')[2].to_i
    month = item['date'].split('/')[1].to_i
    day = item['date'].split('/')[0].to_i
    hour = item['date_heure'].split(':')[0].to_i
    puts "year:#{year}, month:#{month} , day:#{day} , hour:#{hour}"
    date = DateTime.new(year, month, day, hour)
end


arg_projet = {
    name_structure:         item["name_structure"],
    title:                  item["title"],
    url:                    item["url"],
    keywords:               item['keywords'],
    date:                   date,
    live:                   item['live'],
    synopsis:               item['synopsis'],
    difficulty:             test_in(item['difficulty'], difficulty_array),
    territory:              test_in(item['territory'], territory_array),
    duration:               item['duration'][1..],
    image:                  nil,
 }

projet = Projet.create!(arg_projet)

id_target = []
id_form = []
id_theme = []

item['target'].split(',').each { |uid| id_target << uid[1..].to_i }
item["form"].split(',').each {|uid| id_form << uid[1..].to_i }
item['theme'].split(',').each { |uid| id_theme << uid[2..].to_i }


id_form.each { |id| ProjetForm.create!({projet: projet, form: Form.find(id)})}
id_target.each { |id| ProjetTarget.create!({projet: projet, target: Target.find(id)})}
id_theme.each { |id| ProjetTheme.create!({projet: projet, theme: Theme.find(id)})}



end


Projet.all.each do |projet|

    puts "name:         \t#{projet.title}"
    puts "structure:    \t#{projet.name_structure}"
    puts "url:          \t#{projet.url}"
    puts "keywords:     \t#{projet.keywords}"
    puts "territory:    \t#{projet.territory}"
    puts "duration:     \t#{projet.duration}"
    puts "synopsis:     \t#{projet.synopsis.first(10)}"
    puts "live:         \t#{projet.live}"
    puts "date:         \t#{projet.date}"

    puts "target:" 
    projet.projet_target.each { |target| puts "- #{target.target.name}"}

    puts "format:" 
    projet.projet_form.each { |form| puts "- #{form.form.name}"}

    puts "theme:" 
    projet.projet_theme.each { |theme| puts "- #{theme.theme.name}"}
    
    puts '----------------------------'
end