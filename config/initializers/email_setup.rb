EmailerConfig = YAML.load(File.read(Rails.root + 'config' + 'emailer.yml'))

#set global email related variables
EMAIL_HOST_URL = EmailerConfig[Rails.env]["email_host_url"]

if Rails.env.development? or Rails.env.test?
  ActionMailer::Base.smtp_settings = {
    :address  => EmailerConfig[Rails.env]["smtp_url"],
    :port  => EmailerConfig[Rails.env]["smtp_port"],
    :domain  => EmailerConfig[Rails.env]["smtp_domain"],
    :user_name  => EmailerConfig[Rails.env]["smtp_user"],
    :password  => EmailerConfig[Rails.env]["smtp_password"],
    :authentication  => EmailerConfig[Rails.env]["authentication"]
  }
else
  ActionMailer::Base.smtp_settings = {
    :user_name => ENV['BEDSIDE_SMTP_USER_NAME'],
    :password => ENV['BEDSIDE_SMTP_PASSWORD'],
    :domain => "bedsideapp.com",
    :address => "smtp.sendgrid.net",
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end