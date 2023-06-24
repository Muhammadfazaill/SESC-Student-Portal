class UsersController < ApplicationController

  def index
    @profiles = User.all
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
     @user = current_user
    if @user.update(profile_params)
      redirect_to @user, notice: "Profile updated successfully."
    else
      render :edit
    end
  end


  def destroy
    @profile = current_user.profile
    @profile.destroy
    redirect_to profiles_path, notice: "Profile deleted successfully."
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:user).permit(:name)
  end
end