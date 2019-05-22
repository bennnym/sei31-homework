class MountainsController < ApplicationController
def index
@mountains = Mountain.all
render :index
end

def new
render :new
end

def show
@mountain = Mountain.find params[:id]
render :show
end

def create
mountain = Mountain.new
mountain.name = params[:name]
mountain.image = params[:image]
mountain.height = params[:height]
mountain.location = params[:location]
mountain.save
redirect_to mountain_path(mountain.id)
end

def edit
@mountain = Mountain.find params[:id]
render :edit
end

def update
mountain = Mountain.find params[:id]
mountain.name = params[:name]
mountain.image = params[:image]
mountain.height = params[:height]
mountain.location = params[:location]
mountain.save
redirect_to mountain_path(mountain.id)
end

def destroy
mountain = Mountain.find params[:id]
mountain.destroy
redirect_to mountain_path
end

end
