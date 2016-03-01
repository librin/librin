# Preview all emails at http://localhost:3000/rails/mailers/librinmail
class LibrinmailPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/librinmail/welcome
  def welcome
    Librinmail.welcome
  end

  # Preview this email at http://localhost:3000/rails/mailers/librinmail/suggestion
  def suggestion
    Librinmail.suggestion
  end

end
