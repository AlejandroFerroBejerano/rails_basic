class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => :show
  before_filter :set_resource

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  # GET /profile
  # GET /profile.json
  def profile
    respond_to do |format|
      format.html { render 'show' }
      format.json { render json: @user }
    end
  end

  # GET /users/edit
  def edit
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to redirect_path, notice: 'Your profile was successfully updated!' }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_resource
    @user = current_user
  end
end
