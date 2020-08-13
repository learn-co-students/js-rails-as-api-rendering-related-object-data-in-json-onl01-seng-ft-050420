class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: sightings.to_json(include: [:bird, :location])
      end
       
      def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting.to_json(include: [:bird, :location], except: [:updated_at])
            
        else
            render json: {
                message: "No Sighting for this id found"
            }
        end
      end
end
