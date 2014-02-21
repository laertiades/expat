class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    if request.fullpath == "/contact-us"
      render :cms_page => '/contact-us'
    else
      render :cms_page => '/getting-started'
    end      
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.valid?
      if UserMailer.new_message(@contact).deliver
        flash[:success] = "Your message was sent.  Thank you for your interest in ExpatCPA."
        redirect_to '/'
      else
	puts request.referrer
	if request.referrer.index "/contact-us"
          render :cms_page => '/contact-us'
	else
          render :cms_page => '/getting-started'
	end
      end
    else
      if request.referrer.index "/contact-us"
	render :cms_page => '/contact-us'
      else
	render :cms_page => '/getting-started'
      end
    end
  end
  
  def getform
    redirect_to 'https://s3.amazonaws.com/expatcpa/questionnaires/2013.xlsx'
  end

  private

    def contact_params
      params.require(:contact).permit!
    end
end
