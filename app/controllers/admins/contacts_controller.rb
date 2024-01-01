class Admins::ContactsController < AdminController
  private

  def find_query
    @query = Contact.all.order(created_at: :desc)
  end

  def find_object
    @object = Contact.find_by(id: params[:id])
  end

  def find_class
    @class = Contact
  end

  def find_config
    @config = {
      partial: "admins/contacts/lists",
      redirect_location: admins_contacts_path
    }
  end

  def object_params
    params.require(:contact).permit(:name, :email, :phone_number, :message)
  end
end
