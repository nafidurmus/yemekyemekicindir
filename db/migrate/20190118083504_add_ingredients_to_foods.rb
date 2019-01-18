class AddIngredientsToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :prep_time, :string
    add_column :foods, :cook_time, :string
    add_column :foods, :level_of_difficulty, :string
    add_column :foods, :serving_time, :string
    add_column :foods, :ingredients, :text
  end
end
