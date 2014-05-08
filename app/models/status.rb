class Status < ActiveRecord::Base

  belongs_to :wound
  belongs_to :patient
  
  has_attached_file :image, 
  	:storage => :s3,
    :s3_credentials => {
    	:bucket => ENV['S3_BUCKET_NAME'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    },
  	:style => { :thumb => '150x150#', :medium => '300x300>'},
    :default_url => 'original/missing.png',
  	:path => "app/public/system/images/:id/:style/:basename.:extension"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def area
    self.length * self.width
  end

end
