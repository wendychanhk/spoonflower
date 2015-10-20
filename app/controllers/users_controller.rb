class UsersController < ApplicationController
	before_action :authenticate_user!
 #  named_scope :without_user, lambda{|user| user ? {:conditions => ["id != ?", user.id]} : {} }
  # GET /users
  def index

	end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
    
  end

  def profile
    @user = current_user
    render 'users/profile'
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user = current_user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
