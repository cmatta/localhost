class FoodController < ApplicationController
  def new
    @food = Food.new()
  end
  def create
    @food = Food.new(params[:food])
    if @food.save
      redirect_to food_create_url(), :notice => "Successfully created a food."
    end
  end

  def destroy
  end
  
  def index
    @Food = Food.all
    respond_to do |format|
      format.html
    end
  end

end
