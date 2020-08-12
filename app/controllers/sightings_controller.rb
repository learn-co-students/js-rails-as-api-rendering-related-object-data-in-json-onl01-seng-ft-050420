class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: sightings, include: [:bird, :location]
    # Same as `render json: sightings.to_json(include: [:bird, :location])`
  end

  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
      render json: sighting, include: [:bird, :location]
      # Same as `render json: sighting.to_json(include: [:bird, :location])`
      
      # We can use `include` along with `only` and `exclude`...:
      # render json: sighting, include: [:bird, :location], except: [:updated_at]

      # ...but it starts to get complicated with nested resources:
      # render json: sighting.to_json(:include => { 
      #   :bird => {:only => [:name, :species]},
      #   :location => {:only => [:latitude, :longitude]}
      # }, :except => [:updated_at])
    else
      render json: { message: 'No sighting found with that id' }
  end
end
