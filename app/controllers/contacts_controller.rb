class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    render :cms_page => '/contact-us'
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.valid?
      if UserMailer.new_message(@contact).deliver
        flash[:success] = "Your message was sent.  Thank you for your interest in ExpatCPA."
        redirect_to '/'
      else
        render :cms_page => '/contact-us'
      end
    else
      render :cms_page => '/contact-us'
    end
  end

  private

    def contact_params
      params.require(:contact).permit!
    end
end
