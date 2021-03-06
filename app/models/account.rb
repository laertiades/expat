class Account < ActiveRecord::Base
  belongs_to :manager
  belongs_to :consultant
  
  validates :name, presence: true
  
  before_save do
    sub = 0
    sub = sub + (basic ? 299 : 0)
    sub = sub + (state ? 175 : 0)
    sub = sub + (f1116 ? 135 : 0)
    sub = sub + (a ? 85 : 0)
    sub = sub + (b ? 35 : 0)
    sub = sub + (c ? 125 : 0)
    sub = sub + (d ? 75 : 0)
    sub = sub + (e ? 125 : 0)
    sub = sub + (extension ? 75 : 0)
    sub = sub + (f ? 75 : 0)
    sub = sub + (f8938 ? 75 : 0)
    sub = sub + (f5471 ? 600 : 0)
    sub = sub + (misc || 0)
    
    self.fee = sub
    self.cost = sub * 0.4
  end
end
