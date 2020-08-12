class SightingsController < ApplicationController
    def index 
        sighting = Sighting.all 
        render json: sighting.to_json(include: %i[bird location])
    end 

    def show 
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            # render json: sighting 
            # render json: {id: sighting.id, bird: sighting.bird, location: sighting.location}
            # render json: sighting, include: %i[bird location]
            render json: sighting, include: %i[bird location], except: %i[created_at updated_at]
        else 
            render json: {message: "http://localhost:3000/sightings/#{params[:id] } is not a valid route, sorry!! "}
        end
    end
end
