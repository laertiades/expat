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
          @years = params[:contact][:years] || 1
          @followup = Followup.new({ :name => params[:contact][:name], :years => @years, :email => params[:contact][:email] })
          if @followup.email.present?
            FollowupMailer.new_message(@followup).deliver
          end
# 	  flash.now[:success] = "Your message was sent.  Thank you for your interest in ExpatCPA."
#           render :cms_page => '/'
          rawName = params[:contact][:name].strip
          if rawName.present?
            if rawName.index(', ')
              arrName = rawName.split(', ')
              @name = "#{arrName[1].strip} #{arrName[0].strip}"
            else
              @name = rawName
            end
          else
            @name = "customer"
          end
          render 'message'
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
  
  def message
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
