class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model
   # @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)
    session["devise.facebook_data"] = env["omniauth.auth"]
    redirect_to new_user_registration_url
    #render :text => request.env['omniauth.auth'].to_yaml
  end
end