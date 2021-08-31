module ApplicationHelper
def villesmagasin(d)
l=villes(d).length
"#{l} #{"magasin".pluralize(l)} en #{@monpays.capitalize}"
end
def resource
user_signed_in? ? current_user : User.new
end
def resource_name
:user
end
def villes(dpt)
d =dpt||'GF'
ile=Island.find_by_dpt(d)
ile.cities.collect {|x| [x.name, x.id]}
end
def pagemagasin
dptname=['Martinique','Guadeloupe','Guyane']
['MQ','GP','GF'].map.with_index {|x,i|[dptname[i], request.path+'?page=magasin&dpt='+x]}
end
def dpt(x)
session[:dpt]||='GF'
request.path+'?page=magasin&dpt='+session[:dpt]
end
end
