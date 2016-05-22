class Product < ActiveRecord::Base
	belongs_to :product_category
	has_many :reviews
	belongs_to :users
	has_attached_file :product_image
	validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\Z/

	def self.search(search)
	  if search
	    where("name like ?", "%#{search}%") 
	  else
	    all
	  end
	end


end
