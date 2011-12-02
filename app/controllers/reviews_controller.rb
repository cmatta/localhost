class ReviewsController < ApplicationController
  filter_resource_access
  before_filter :require_login, except: :show
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(params[:review])
    @review.reviewer = current_user
    @review.user = @review.reviewer
    if @review.save
      redirect_to user_url(@review.reviewee), :notice => "Successfully created review."
    else
      render :action => 'new'
    end
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    @review.reviewer = current_user
    @review.user = @review.reviewer
    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to review_path(@review), notice: 'Review was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
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
