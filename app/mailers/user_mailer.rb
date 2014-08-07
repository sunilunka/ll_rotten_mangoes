class UserMailer < ActionMailer::Base
  default from: "admin@rottenmangoes.com"

  def email_removed_user(user)
    @user = user
    @url = "www.rottenmangoes.com/contact_us"
    mail(to: @user.email, subject: "You have been removed from Rotten Mangoes.")
  end
end
