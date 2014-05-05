class Status < ActiveRecord::Base
	attr_accessible :image_file_name

  belongs_to :wound
  belongs_to :patient
  
  has_attached_file :image, 
  	:bucket => ENV['AWS_BUCKET'],
  	:style => {
  	thumb: '150x150>',
  	medium: '300x300>'
  }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
