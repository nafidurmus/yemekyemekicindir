class AddSlugToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :slug, :string
    add_index :foods, :slug, unique: true
  end
end
