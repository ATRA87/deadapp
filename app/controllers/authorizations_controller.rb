class AuthorizationsController < ApplicationController
  def linkedin
    @user = User.from_omniauth(request.env["omniauth.auth"])

    sign_in_and_redirect @user, event: :authentication
  end

  def callback
    begin
      oauth = OauthService.new(request.env['omniauth.auth'])
      if oauth_account = oauth.create_oauth_account!
          ...
          redirect_to Config.provider_login_path
      end
      rescue => e
        flash[:alert] = "There was an error while trying to authenticate your account."
        redirect_to register_path
    end
  end

  def failure
    flash[:alert] = "There was an error while trying to authenticate your account."
    redirect_to root_path
  end
end
