class ContactsController < ApplicationController
include SimpleCaptcha::ViewHelper

  def new
    @contact = Contact.new
    expires_in 2.days, :public => true, :'s-maxage' => '2592000'
    if stale?(:etag, :last_modified => Cms::Site.first.updated_at)
      if request.fullpath == "/contact-us"
	render :cms_page => '/contact-us'
      else
	render :cms_page => '/getting-started'
      end
    end
  end

  def create
    @contact = Contact.new(contact_params)
    
    if simple_captcha_valid?
      if @contact.valid?
	if UserMailer.new_message(@contact).deliver
	  flash.now[:success] = "Your message was sent.  Thank you for your interest in ExpatCPA."
	  render :cms_page => '/'
	else
          contact_redirect
	end
      else
        contact_redirect
      end
    else
      flash.now[:error] = 'Failed Human Authentication'
      contact_redirect
    end
  end
  
  def getform
    redirect_to 'https://s3.amazonaws.com/expatcpa/questionnaires/2013.xlsx'
  end

  private

    def contact_params
      params.require(:contact).permit!
    end
    
    def contact_redirect
      if request.referrer.index "/contact-us"
	render :cms_page => '/contact-us'
      else
	render :cms_page => '/getting-started'
      end
    end
end
