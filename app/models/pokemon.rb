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
    !params[:cp].blank? && !params[:attack_move].blank? && !params[:attack_move_damage].blank? && !params[:special_move].blank? && !params[:special_move_damage].blank? &&
    !params[:p_type].blank?
  end

end
