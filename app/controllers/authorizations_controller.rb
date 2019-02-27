class AuthorizationsController < Devise::OmniauthCallbacksController
  # def passthru
  #   redirect_to https://www.linkedin.com/oauth/v2/authorization
  # end

  def linkedin
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
    else
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:alert] = "There was an error while trying to authenticate your account."
    redirect_to root_path
  end
end
