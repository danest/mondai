class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model
   # user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)
    if user = User.find_by_uid(env["omniauth.auth"]['uid'])
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in user, :event => :authentication
      redirect_to root_path
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      flash[:notice] = "Please Pick a password"
      redirect_to new_user_registration_url
    end
    #render :text => request.env['omniauth.auth'].to_yaml
  end
end