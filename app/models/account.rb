class Account < ActiveRecord::Base
  belongs_to :manager
  belongs_to :consultant
  
  validates :name, presence: true
end
