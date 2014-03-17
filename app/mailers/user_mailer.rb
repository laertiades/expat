class UserMailer < ActionMailer::Base
  default from: "info@expatcpa.com"
  default to:   "john@expatcpa.com"
#  default to:   "jesse@goodfellowsites.com"
  if Rails.env.test?
     default to: "jesse@goodfellowsites.com"
  end
  if Rails.env.development?
     default to: "jesse@goodfellowsites.com"
  end

  def new_message(contact)
    @contact = contact
    address = contact.email 
    if contact.email.blank?
      address = "webmaster@goodfellowsites.com"
      @contact.email = "not given"
    end
    mail(:subject => "#{contact.name} sent this from your website",
		from: "#{address}")
  end
  
end
