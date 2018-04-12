require 'nokogiri'
require 'open-uri'

def directory
	#Scrapping d'un annuaire des entreprises technologiques
	doc = Nokogiri::HTML(open('https://www.verif.com/Hit-parade/01-CA/03-Par-activite/62-Programmation-conseil-et-autres-activites-informatiques'))

	#Insertion dans un tableau des noms 
	arrayname = []
	doc.css('td.verif_col1 a').each do |link|
		arrayname << link.text
	end

	#Insertion dans un tableau des codes postales 
	arraycp= []
	doc.css('td.verif_col2 a').each do |link|
		arraycp << link.text
	end

	#Insertion dans un tableau des chiffres d'affaires 
	arrayca = []
	doc.css('td.verif_col5 a').each do |link|
		arrayca << link.text
	end

	#Création du hash
	global = {}

	number = arrayca.length

	number.times do |x|
		puts global.merge!(name: arrayname[x], cp: arraycp[x], ca: arrayca[x] )
	end

end

directory