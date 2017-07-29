class UsersController < ActionController::Base

  def create
    @user = User.create(user_params)

    if @user.valid?
      render json: @user
    else
      render json: {:errors => @user.errors.full_messages}, status:422
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,:phone_number, :zip_code, :over_21, :access_car)
  end



end
