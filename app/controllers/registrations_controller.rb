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
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    super
  end
end