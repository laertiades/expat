class Contact

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :body, :email, :title, :company, :local, :foreign, :phone, :quote, :gaapfee, :gaap, :individual, :corporate, :russian

  validates :name, :presence => true
  validates :name, :email, :title, :company, :local, :foreign, :phone, length: { maximum: 100 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, allow_blank: true
  validates :body, length: { maximum: 1000 }
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end
