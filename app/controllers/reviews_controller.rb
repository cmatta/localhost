class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(params[:review])
    @review.reviewer = current_user
    @review.user = current_user
    if @review.save
      redirect_to user_url(@review.reviewee), :notice => "Successfully created review."
    else
      render :action => 'new'
    end
  end
  
  def show
    @review = Review.find(params[:id])
    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @product }
    end
      
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_url, :notice => "Successfully destroyed review."
  end
end
