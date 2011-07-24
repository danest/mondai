ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "www.mondai.me",
  :user_name            => "mondai.team",
  :password             => "kevinnorwich",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "www.mondai.me"