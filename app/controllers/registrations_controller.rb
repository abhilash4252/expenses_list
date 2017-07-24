class RegistrationsController < ::Devise::RegistrationsController
  def create
    if params['user'].present?
      params['user']['is_admin'] = params['user']['is_admin'] == '1' ? true : false
      user = User.new(user_params)
      user.save!
      sign_in(user)
      redirect_to user_path(user)
    end
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :is_admin, :password_confirmation)
  end
end
