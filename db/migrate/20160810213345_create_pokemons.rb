class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :nickname
      t.float :weight
      t.float :height
      t.integer :cp
      t.integer :user_id
    end
  end
end
