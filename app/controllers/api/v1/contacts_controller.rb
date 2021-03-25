class Api::V1::ContactsController < ApplicationController
    before_action :find_contact, only: [:update]
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

    # CANT NAVE TWO IF ELSE STATEMENTS COMBINE ALL POSSIBILITIES IN ONE IF ELSEIF ELSEIF >>> ELSE STATEMENT
    def create
        # Set instance of contact equal to Contact class.new(contact_params)
        @contact = Contact.new(contact_params) # pass in individual.id 

        # need to determine if you need to create the individual
        # Set instance of individual to Individual class.new(name: contact_params[:individual_name])
        @individual = Individual.new(name: contact_params[:individual_name])
        # Save @individual
        @individual.save

        # Set instance individual variable to equal instance of contact.individual
        @contact.individual = @individual
        # Save @contact
        @contact.save

        if(@contact) 
                if(! @individual)
                    render json: {errors: @individual.errors.full_messages }, status: :unprocessible_entity
                else 
                    render json: IndividualSerializer.new(@individual), status: :accepted
                        # render json: ContactSerializer.new(@contact), status: :accepted
                
                end
        else 
                render json: {errors: @contact.errors.full_messages }, status: :unprocessible_entity
        
        end
    end

    def update
        @contact.update(contact_params)
        if @contact.save
            render json: ContactSerializer.new(@contact), status: :accepted 
        else
            render json: {errors: @contact.errors.full_messages }, status: :unprocessible_entity
        end
    end

    # def individual_name
    #     Individual.name
    # end

    private

    def contact_params
        # params.require(:contact).permit(:name, :date, :category, :location, :occurrence, :individual_id) # ORIGINAL
        params.require(:contact).permit(:name, :date, :category, :location, :occurrence, :individual_id, :individual_name)
        # params.require(:contact).permit(:name, :date, :category, :location, :occurrence, :individual_id, :individual_name => {})
            # error: "Bad Request"
            # exception: "#<ActionController::ParameterMissing: param is missing or the value is empty: contact>"
        # params.require(:contact).permit(:name, :date, :category, :location, :occurrence, :individual_id, individual_name: [])
        # params.require(:contact).permit(:name, :date, :category, :location, :occurrence, :individual_id, individual: [:id, :individual_name])
        # params.require(:contact).permit(:name, :date, :category, :location, :occurrence, :individual_id, individual_name: [])
    end

    def find_contact
        @contact = Contact.find(params[:id])
    end
end
