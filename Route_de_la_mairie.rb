# On appelle ici les GEM dont on a besoin
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# 1er exercice, on récupére l'adresse mail d'une page demandé
def get_the_email_of_a_townhal_from_its_webpage
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
	doc.css('td').each do |mail|
		if mail.text.include? "@"
			puts mail.text
		else
		end
	end
end

# 2éme exercie: on récupére les Url d'une liste de mairie demandé
def get_all_the_urls_of_val_doise_townhalls

	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.css('a.lientxt').each do |url|
		nom = url.text.capitalize
		url1 = url["href"]
		url1.slice!(0)
		url_final = "http://annuaire-des-mairies.com" + url1
		puts url_final
	end
	
	
end
# 3éme exercie: on mixe les 2 premiéres méthodes pour récupérer les urls de toutes 
# les mairies du val d'oise, y rentrer et récupérer l'adresse mail.

def get_all_the_email_of_val_doise_townhalls
	mailvo = Hash.new
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.css('a.lientxt').each do |url|
		city = url.text.capitalize
		url1 = url["href"]
		url1.slice!(0)
		doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com" + url1))
		doc.css('td').each do |mail|
			if mail.text.include? "@"
				
				mailvo[city] = mail.text
				

			else
			end
		end
	end
	puts mailvo
end


# Activer les différentes méthodes pour aller plus loin dans l'exercice

get_the_email_of_a_townhal_from_its_webpage
#get_all_the_urls_of_val_doise_townhalls
#get_all_the_email_of_val_doise_townhalls