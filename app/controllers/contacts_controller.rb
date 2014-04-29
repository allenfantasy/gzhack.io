class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.js
      else
        format.js
      end
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :tel, :email, :role, :project_id, :intention)
  end
end
