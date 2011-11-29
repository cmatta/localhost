class UsersController < ApplicationController
  before_filter :require_login, except: [:new, :create, :show]

  filter_access_to :edit, :update, :attribute_check => true
  
  def index
      @user = User.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @user }
      end
  end
    
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @user}
    end
  end
  
  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end