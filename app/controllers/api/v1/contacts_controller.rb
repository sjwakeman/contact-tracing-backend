class Api::V1::ContactsController < ApplicationController
    def index
        contacts = Contact.all

        # options = {
            # include associated relationship in model has to match (individual)
        #     include: [:individual] 
        # }
        # @contacts = Contact.all # WORKS
        # render json: contacts # WORKS
        render json: ContactSerializer.new(contacts)

        # TO ADD A RELATIONSHIP IN SERIALIZER
        # render json: ContactSerializer.new(contacts, options) # WORKS
        # render json: ContactSerializer.new(@contacts) # WORKS

    end

    def create
        contact = Contact.new(contact_params)
        if contact.save
            render json: ContactSerializer.new(contact), status: :accepted
        else
            render json: {errors: contact.errors.full_messages }, status: :unprocessible_entity
        end
    end

    private

    def contact_params
        params.require(:contact).permit(:name, :date, :category, :location, :occurrence, :individual_id)
    end
end
