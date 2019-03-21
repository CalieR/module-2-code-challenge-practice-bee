class FlowersController < ApplicationController

    def index 
        @flowers = Flower.all 
    end
    
    def show
        @flower = Flower.find(params[:id])
    end

    def new
        @flower = Flower.new
        @bees = Bee.all
    end

    def create 
        @flower = Flower.create(flower_params)
        if @flower.valid?
            redirect_to flower_path
        end
    end

    private

    def flower_params
        params.require(:flower).permit(:name, :pollen_capacity, :bee_ids [])
    end
end
