class Resource < ActiveRecord::Base
  has_many :documents
  has_and_belongs_to_many :tags
has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/introduccion_rails.png"
	validates_attachment :cover, content_type: { content_type: /\Aimage\/.*\Z/ } 
	
	
end