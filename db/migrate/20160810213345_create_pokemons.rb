class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :nickname
      t.string :p_type
      t.float :weight
      t.float :height
      t.integer :cp
      t.integer :user_id
      t.string :attack_move
      t.integer :attack_move_damage
      t.string :special_move
      t.integer :special_move_damage
    end
  end
end
