ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "http://servicecall.heroku.com",
  :user_name            => "james@kyokushin.com.ph",
  :password             => "12345678",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
