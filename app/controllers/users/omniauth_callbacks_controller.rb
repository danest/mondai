class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model
   # user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)
    if user = User.find_by_uid(env["omniauth.auth"]['uid'])
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect user, :event => :authentication
      #redirect_to root_path
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      user_name = session["devise.facebook_data"]['user_info']['first_name'] + " " + session["devise.facebook_data"]['user_info']['last_name']
    	user_email = session["devise.facebook_data"]['user_info']['email']
    	picture_url = session["devise.facebook_data"]['user_info']['image']
    	facebook_uid = session["devise.facebook_data"]['uid']
    	facebook_url = session["devise.facebook_data"]['extra']['user_hash']['link']
      flash[:notice] = "Thank you for signing up"
      #redirect_to new_user_registration_url
      User.create!(:name => user_name, :email => user_email, :picture => picture_url, :fb_link => facebook_url, :uid => facebook_uid, :password => Devise.friendly_token[0,20])
      user = User.find_by_uid(env["omniauth.auth"]['uid'])
      #send mail to the user
      UserMailer.registration_confirmation(user.id).deliver
      sign_in_and_redirect user, :event => :authentication
    end
    #render :text => request.env['omniauth.auth'].to_yaml
  end
end