class User < ActiveRecord::Base
  has_secure_password
  has_many :patients

  validates :email, uniqueness: true
  validates :password, format: {:with => /.{8,20}/, message: "password must be at least 8 characters"}, :on => :create

  def name
  	"#{first_name} #{last_name}"
 	end
end
