class CityController < ApplicationController
  def show
    @city = City.find(params[:id])
  end

def index
    @city = City.all
end

end
