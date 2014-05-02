class Wound < ActiveRecord::Base
  has_many :statuses
  belongs_to :patient

end
