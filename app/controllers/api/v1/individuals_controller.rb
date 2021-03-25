class Api::V1::IndividualsController < ApplicationController
    before_action :find_individual, only: [:update]
    def index
        individuals = Individual.all
        
        # render json: individuals
        render json: IndividualSerializer.new(individuals)
    end

    def create
        # byebug
        individual = Individual.new(individual_params)
        if @individual.save
            render json: IndividualSerializer.new(@individual), status: :accepted
        else
            render json: {errors: @individual.errors.full_messages }, status: :unprocessible_entity
        end
    end
    
    def update
        @individual.update(individual_params)
        if @individual.save
            render json: IndividualSerializer.new(@individual), status: :accepted 
        else
            render json: {errors: @individual.errors.full_messages }, status: :unprocessible_entity
        end
    end

    private

    def individual_params
        # params.require(:individual).permit(:name, :contact_id) // contact_id was copied from contact_params template
        params.require(:individual).permit(:name) # Individual have only :name attribute 
    end

    def find_individual
        @individual = Individual.find(params[:id])
    end

end
