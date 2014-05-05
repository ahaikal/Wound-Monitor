class Status < ActiveRecord::Base
  belongs_to :wound
  belongs_to :patient
  
  has_attached_file :image, style: {
  	thumb: '150x150>',
  	medium: '300x300>'
  }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
