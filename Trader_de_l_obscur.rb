# On appelle ici les GEM dont on a besoin
require 'rubygems'
require 'nokogiri'
require 'open-uri'


def coin_market_fluctuation
#On crée 2 arrays pour récupérer les noms et les valeurs.
#On crée 1 hash pour nous permettre de regrouper nos 2 arrays
	array = []
	array1 = []
	crypto_hash = {}
		doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
		doc.css('tbody a.currency-name-container').each do |crypto|
		array << crypto.text
#On récupére le nom des cryptomonnaies que l'on incrémente dans notre array		
		end

		doc.css('tbody a.price').each do |price|
		array1 << price.text
#On récupére le prix des cryptomonnaies	que l'on incrémente dans notre 2éme array
		end
#On compile nos 2 arrays dans un hash avec clé et index
	array.each_with_index {|k,i|crypto_hash[k] = array1[i]}
	puts crypto_hash
# Ici on ajoute un compteur de 1 heure avant de relancer la méthode,
# celle ci tournera en boucle toutes les heures
# ctrl + c pour arréter le processus
	sleep(3600) 
	coin_market_fluctuation
	
end

coin_market_fluctuation