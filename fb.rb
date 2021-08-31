require 'nokogiri'
require 'open-uri'
#@doc=Nokogiri::HTML(URI.open("https://www.facebook.com/EcomaxGuyane/photos/1083725171833559"))
@doc=Nokogiri::HTML(URI.open("https://www.facebook.com/hashtag/lessuggestionsecomax?source=feed_text&epa=HASHTAG"))
