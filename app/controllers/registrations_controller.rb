class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user = User.new(user_params)
    if(@user.save)
      redirect_to :root
    else
      render :new
    end
  end

  def update
    super
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname)
  end
end 