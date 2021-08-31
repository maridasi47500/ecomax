require 'nokogiri'
require 'open-uri'
@doc=Nokogiri::HTML(URI.open("https://fr.wikipedia.org/wiki/Liste_des_communes_de_la_France_d%27outre-mer"))
@l1=@doc.css('table')[0]
@i=0
100.times do
@i+=2
@ligne=@l1.children[1].children[@i].children
@ville=@ligne[3].children.last.children.last.text rescue nil
p @ville
#@ile=@ligne[13].children[0].attributes['title'].value rescue nil
#@ile=@ligne.children[8].attributes['title'].value rescue nil
@ile=@ligne[5].children[0].attributes['title'].value rescue nil
p @ile
if ['Martinique','Guadeloupe','Guyane'].include?(@ile) && @ville && @ile
@island=Island.find_or_create_by(name: @ile)
@city=City.find_or_create_by(name: @ville,island:@island)
end
end
dpt=['MQ','GP','GF']
['Martinique','Guadeloupe','Guyane'].each_with_index do |q,y|
i=Island.find_by(name: q)
i.update(dpt: dpt[y])
end
@ecomaxguyane="https://www.infogreffe.fr/entreprise-societe/393351085-ecomax-guyane-972110B00869/liste-etablissements-1.html?typeProduitOnglet=EXTRAIT&afficherretour=false"
@guy=Nokogiri::HTML(URI.open(@ecomaxguyane))
