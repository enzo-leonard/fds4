
require 'csv'
ProjetTheme.destroy_all
ProjetTarget.destroy_all
ProjetForm.destroy_all
Projet.destroy_all
Target.destroy_all
Form.destroy_all
Theme.destroy_all


difficulty_array = ["Curieux","Amateur","Averti"]
def test_in(word, array)
    array.index(word)
end


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

# Target.all.each { |x| puts "#{x.id} #{x.name}" }
# Form.all.each { |x| puts "#{x.id} #{x.name}" }
# Theme.all.each { |x| puts "#{x.id} #{x.name}" }
#creer target 
#creer Form
#creer 


csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
CSV.foreach("db/data.csv", csv_options) do |item|

#a l'ajout
#a la vue 
#au filtre


#PROJET_Form (projet.projet_Form.each ) 
#OU projet.f1 == false; projet.f2 projet.f3 projet.f4 == true 
#Ou projet.Form.each

# puts "1 - structure :    \t #{item[1]}"
# puts "2 - titre :      \t\t #{item[2]}"
# puts "3 - location :     \t #{item[3]}"
# puts "4 - url :        \t\t #{item[4]}"
# puts "5 - themes :     \t\t #{item[5]}"
# puts "6 - Form :     \t\t #{item[6][1..].to_i}"
# puts "7 - target :     \t\t #{item[7][1..].to_i}"
# puts "8 - durée :      \t\t #{item[8][1..].to_i}"
# puts "9 - mots clef :    \t #{item[9]}"
# puts "---------------------------------"



arg_projet = {
    name_structure:         item[1],
    title:                  item["title"],
    url:                    item[4],
    keywords:               item[9],
    difficulty:             nil,
    date:                   nil,
    live:                   nil,
    image:                  nil,
    territory:              item[3],
    duration:               item[8]
 }

projet = Projet.create!(arg_projet)

id_target = []
id_form = []
id_theme = []

item[7].split(',').each { |uid| id_target << uid[1..].to_i }
item[6].split(',').each {|uid| id_form << uid[1..].to_i }
item[5].split(',').each { |uid| id_theme << uid[2..].to_i }


# puts "#{item[7]} > #{id_target}"
# puts "#{item["title"]} : #{item[6]} > #{id_form}"
# puts "#{item[5]} > #{id_theme}"
# puts "-----------------------"
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

    puts "target:" 
    projet.projet_target.each { |target| puts "- #{target.target.name}"}

    puts "format:" 
    projet.projet_form.each { |form| puts "- #{form.form.name}"}

    puts "theme:" 
    projet.projet_theme.each { |theme| puts "- #{theme.theme.name}"}
    
    puts '----------------------------'
end