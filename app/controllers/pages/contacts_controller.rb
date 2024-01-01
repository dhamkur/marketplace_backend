class Pages::ContactsController < ApplicationController
  def index
    @object = Contact.new
  end

  def create
    @object = Contact.new(object_params)

    if @object.save
      messages = "You're message has been sent"
      redirect_back(fallback_location: contacts_path, notice: messages)
    else
      messages = @object.errors.full_messages
      redirect_back(fallback_location: contacts_path, alert: messages)
    end
  end

  private

  def object_params
    params.require(:contact).permit(:name, :email, :phone_number, :message)
  end
end
