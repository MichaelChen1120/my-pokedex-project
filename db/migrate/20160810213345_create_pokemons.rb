class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :nickname
      t.string :weight
      t.integer :cp
    end
  end
end
