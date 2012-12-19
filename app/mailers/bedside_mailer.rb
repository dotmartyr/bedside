class BedsideMailer < ActionMailer::Base
  include Resque::Mailer
  default from: "\"Bedside\" <contact@bedsideapp.com>"

  def update_posted(page_id, user_id)
    @page = Page.find(page_id)
    @subject = "Update on #{@page.patient_name.possessive} Condition"
    @user = User.find(user_id)
    
    mail(:to => generate_to_text(@user), :subject => @subject ) do |format|
      format.text
      format.html
    end
  end

  def welcome(user_id)
    @user = User.find(user_id)
    @subject = "Welcome to Bedside."

    mail(:to => generate_to_text(@user),
         :subject => @subject ) do |format|
          format.text
          format.html
      end
  end

  def invitation(invited_user_id, page_id)
    @page = Page.find(page_id)
    @user = User.find(invited_user_id)

    @subject = "Visit #{@page.patient_name.possessive} Bedside"

    mail(:to => generate_to_text(@user),
         :subject => @subject ) do |format|
          format.text
          format.html
      end
  end

  def generate_to_text(invitation)
    email = invitation.email

    return "#{email}"
  end 
end