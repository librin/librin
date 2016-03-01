# Preview all emails at http://localhost:3000/rails/mailers/librin_mailer
class LibrinMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/librin_mailer/welcome
  def welcome
    LibrinMailer.welcome
  end

  # Preview this email at http://localhost:3000/rails/mailers/librin_mailer/suggestion
  def suggestion
    LibrinMailer.suggestion
  end

end
