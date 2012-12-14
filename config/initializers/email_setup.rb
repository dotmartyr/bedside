EmailerConfig = YAML.load(File.read(Rails.root + 'config' + 'emailer.yml'))

#set global email related variables
EMAIL_HOST_URL = EmailerConfig[Rails.env]["email_host_url"]

ActionMailer::Base.smtp_settings = {
  :address  => EmailerConfig[Rails.env]["smtp_url"],
  :port  => EmailerConfig[Rails.env]["smtp_port"],
  :domain  => EmailerConfig[Rails.env]["smtp_domain"],
  :user_name  => EmailerConfig[Rails.env]["smtp_user"],
  :password  => EmailerConfig[Rails.env]["smtp_password"],
  :authentication  => EmailerConfig[Rails.env]["authentication"]
}