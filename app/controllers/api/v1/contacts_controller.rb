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
            render json: contact, status: :accepted
        else
            render json: {errors: contact.errors.full_messages }, status: :unprocessible_entity
        end
    end

    private

    def contact_params
        # params.require(:contact).permit(:name, :date, :category, :location, :occurrence, :individual_id)
        
        params.require(:contact).permit(:name, :date, :category, :location, :occurrence, :individual_id, :individual_name)
        # REFRESH WSL WEBPAGE
        # index.js:16 GET http://localhost:3000/api/v1/contacts 500 (Internal Server Error)
            # getContacts @ index.js:16
            # (anonymous) @ index.js:5
            # index.js:21 Uncaught (in promise) TypeError: Cannot read property 'forEach' of undefined
            #     at index.js:21
    end
end
