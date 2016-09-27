ActionMailer::Base.smtp_settings = {
  :user_name => Rails.application.secrets.sendgrid_username || ENV['SENDGRID_USERNAME'],
  :password => Rails.application.secrets.sendgrid_password || ENV['SENDGRID_PASSWORD'],
  :domain => 'https://overtimesilo.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}