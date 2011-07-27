class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ensure_domain
  include SessionsHelper

  # Customize the Devise after_sign_in_path_for() for redirecct to previous page after login
  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope
    when :user, User
      store_location = session[:return_to]
      clear_stored_location
      (store_location.nil?) ? "/" : store_location.to_s
    else
      super
    end
  end
  
  def ensure_domain 
      something = request.url
      if something.include?('www.mondai.me')
          tt = something.gsub(/^www.mondai.me/, 'mondai.me')
          puts tt
      end
  end
  private
    def store_location
      session[:return_to] = request.fullpath
    end
end