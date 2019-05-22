class OceansController < ApplicationController 
    @@continentvalues = ['Africa', 'Europe', 'Asia', 'North America', 'South America', 'Australia', 'Antarctica']

    def index
        @oceans = Ocean.all
    end

    def show
        @ocean = Ocean.find params[:id]
    end

    def new
        @continentslookup = setupContinents nil
        @ocean = Ocean.new
    end

    def create
        s = params[:continents].join(', ')
        ocean = Ocean.create oceans_params
        ocean.continents = s
        ocean.save   
        redirect_to ocean_path(ocean.id)
    end

    def edit
        @ocean = Ocean.find params[:id]
        @continentslookup = setupContinents @ocean
    end

    def setupContinents ocean
        continentslookup = Hash.new
        ifchecked = ""
        @@continentvalues.each do |c| 
            if ocean != nil && ocean.continents != nil
                ifchecked = (ocean.continents.include? c) ? "checked" : ""
            end
            continentslookup[c] = ifchecked
        end
        return continentslookup
    end

    def update
        ocean = Ocean.find params[:id]
        s = params[:continents].join(', ')
        ocean.update oceans_params
        ocean.continents = s
        ocean.save
#binding.pry
        redirect_to ocean_path(ocean.id)
    end

    def destroy
        ocean = Ocean.find params[:id]
        ocean.destroy
        redirect_to oceans_path
    end

    private
    def oceans_params
        #strong parameters: whitelist of sanitized input
        params.require(:ocean).permit(:name, :continents, :area, :volume, :image, :depth, :knownexplorers)
    end
end
