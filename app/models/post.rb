class Post < ActiveRecord::Base
	attr_accessible :name, :content, :status, :user_id, :category_id, :image , :tag_list
	belongs_to :user
	belongs_to :category
	has_many :comments

	has_attached_file :image
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

 	#  	def to_param
	# 	"#{id}-#{name}"
	# end

	has_many :taggings
	has_many :tags, through: :taggings

	def self.tagged_with(name)
	  Tag.find_by_name!(name).posts
	end

	def self.tag_counts
	  Tag.select("tags.*, count(taggings.tag_id) as count").
	    joins(:taggings).group("taggings.tag_id")
	end

	def tag_list
	  tags.map(&:name).join(", ")
	end

	def tag_list=(names)
	  self.tags = names.split(",").map do |n|
	    Tag.where(name: n.strip).first_or_create!
	  end
	end
end
