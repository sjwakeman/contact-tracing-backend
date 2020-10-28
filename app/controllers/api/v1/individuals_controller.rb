class Api::V1::IndividualsController < ApplicationController
    def index
        individuals = Individual.all
        
        # render json: individuals
        render json: IndividualSerializer.new(individuals)
    end
end
