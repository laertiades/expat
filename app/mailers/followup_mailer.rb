class FollowupMailer < ActionMailer::Base
  default from: "info@expatcpa.com"
  default to:   "john@expatcpa.com"
#  default to:   "jesse@goodfellowsites.com"
  if !Rails.env.production?
     default to: "jesse@goodfellowsites.com"
  end

  def new_message(followup)
    @followup = followup
    address = followup.email 
    mail(:subject => "Instructions for you Expatcpa tax return", to: "#{address}")
  end
  
end
