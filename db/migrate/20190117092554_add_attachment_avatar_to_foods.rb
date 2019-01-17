class AddAttachmentAvatarToFoods < ActiveRecord::Migration[5.2]
  def self.up
    change_table :foods do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :foods, :avatar
  end
end
