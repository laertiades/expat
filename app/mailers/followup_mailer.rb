class FollowupMailer < ActionMailer::Base
  default from: "contact@expatcpa.com"
  default to:   "john@expatcpa.com"
#  default to:   "jesse@goodfellowsites.com"
  if !Rails.env.production?
     default to: "jesse@goodfellowsites.com"
  end

  def new_message(followup)
    @followup = followup
    address = followup.email.strip
    mail(:subject => "Instructions for your ExpatCPA tax return", to: "#{address}")
  end
  
end
