class Consultant < ActiveRecord::Base
  has_many :accounts
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :password, length: { minimum: 6 }
  has_secure_password
  
  before_create do
    self.password = "consultant"
    self.password_confirmation = "consultant"
  end

end
