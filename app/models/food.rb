class Food < ApplicationRecord
	has_many :comments, :dependent => :destroy

	extend FriendlyId
  	friendly_id :title, use: :slugged

	has_attached_file :avatar, styles: { large: "450x450",medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  	def self.search(search)
	  where("title LIKE ?", "%#{search}%") 
	end
end
