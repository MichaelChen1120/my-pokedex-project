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
    pokemon.reject! {|p| p =~ /Evolutions|Rainer|Sparky|Pyro/i}
    pokemon.sort
  end

  def self.not_missing_params?(params)
    params[:cp] != "" && params[:attack_move] != "" && params[:attack_move_damage] != "" && params[:special_move] != "" && params[:special_move_damage_move] != "" &&
    params[:p_type] != ""
  end

end
