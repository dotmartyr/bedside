class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
    respond_with(@users)
  end

  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end
  
  def edit
    respond_with(@user = current_user)
  end


  def update
    @user = User.find(params[:id])
    
    respond_with @user, status: :unauthorized if @user.id != current_user.id

    if params[:user][:password].blank? 
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if @user.update_attributes(params[:user])
      #prevent the user from being logged out by 
      #changing their password
      sign_in(@user, :bypass => true)
    end

    respond_with(@user)
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end