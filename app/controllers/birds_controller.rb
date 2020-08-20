class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: 
  end
end