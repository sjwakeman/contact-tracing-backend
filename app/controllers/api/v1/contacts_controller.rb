class Api::V1::ContactsController < ApplicationController
    def index
        contacts = Contact.all
        # @contacts = Contact.all
        # render json: contacts
        render json: ContactSerializer.new(contacts)
        # render json: ContactSerializer.new(@contacts)

    end

    def create
        contact = Contact.new(contact_params)
        if contact.save
            render json: contact, status: :accepted
        else
            render json: {errors: contact.errors.full_messages }, status: :unprocessible_entity
        end
    end

    private

    def contact_params
        params.require(:contact).permit(:name, :date, :category, :location, :occurrence, :individual_id)
    end
end
