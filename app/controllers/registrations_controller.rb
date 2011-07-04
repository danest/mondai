class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # add custom create logic here
    if  session["devise.facebook_data"] 
    	facebook_uid = session["devise.facebook_data"]['uid']
    	facebook_url = session["devise.facebook_data"]['extra']['user_hash']['link']
    	facebook_picture = session["devise.facebook_data"]['user_info']['image']
    else
      facebook_uid = ""
      facebook_url = ""
      facebook_picture = ""
    end
    
    @user = User.new(:name => params[:user][:name], :email => params[:user][:email], :password => params[:user][:password], 
                :uid => facebook_uid, :picture => facebook_picture, :fb_link => facebook_url)
    if @user.save
      redirect_to home_show_path
    else
      render 'new'
    end
  end

  def update
    # Override Devise to use update_attributes instead of update_with_password.
    # This is the only change we make.
    if resource.update_attributes(params[resource_name])
      set_flash_message :notice, :updated
      # Line below required if using Devise >= 1.2.0
      sign_in resource_name, resource, :bypass => true
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
  end
end