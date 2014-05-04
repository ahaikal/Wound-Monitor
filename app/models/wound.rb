class Wound < ActiveRecord::Base
  has_many :statuses
  belongs_to :patient

  validates :location, presence: true, :on => :create
end
