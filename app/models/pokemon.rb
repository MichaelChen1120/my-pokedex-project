class Pokemon <ActiveRecord::Base
  belongs_to :user

  def self.scrape_pokemon
    doc=Nokogiri::HTML(open("http://www.ign.com/wikis/pokemon-go/List_of_Pokemon_(Pokedex)"))
  end

end
