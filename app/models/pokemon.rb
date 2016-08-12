class Pokemon <ActiveRecord::Base
  belongs_to :user
  require 'nokogiri'
  require 'open-uri'

  def self.scrape_pokemon
    doc= Nokogiri::HTML(open("http://www.ign.com/wikis/pokemon-go/List_of_Pokemon_(Pokedex)"))
    pokemon= doc.search("table a").collect do |pokemon|
      pokemon.text
    end
    pokemon.reject! {|p| p.empty?}
    pokemon.reject! {|p| p.include?("Evolutions")}
    pokemon.reject! {|p| p.include?("Rainer")}
    pokemon.reject! {|p| p.include?("Sparky")}
    pokemon.reject! {|p| p.include?("Pyro")}
  end

end
