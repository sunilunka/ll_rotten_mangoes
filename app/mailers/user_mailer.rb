class UserMailer < ActionMailer::Base
  default from: "admin@rottenmangoes.com"

  def email_removed_user
    @user = current_user
    @url = www.rottenmangoes.com/contact_us
    mailto: (to: @user.email, subject: "You have been removed from Rotten Mangoes.")
  end
end
