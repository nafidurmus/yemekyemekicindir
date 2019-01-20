class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :your_name
      t.text :note
      t.references :food, foreign_key: true

      t.timestamps
    end
  end
end
