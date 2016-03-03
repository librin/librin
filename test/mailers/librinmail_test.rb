require 'test_helper'

class LibrinmailTest < ActionMailer::TestCase
  test "welcome" do
    mail = Librinmail.welcome
    assert_equal "Welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "suggestion" do
    mail = Librinmail.suggestion
    assert_equal "Suggestion", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
