require 'test_helper'

class LibrinMailerTest < ActionMailer::TestCase
  test "welcome" do
    mail = LibrinMailer.welcome
    assert_equal "Welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "suggestion" do
    mail = LibrinMailer.suggestion
    assert_equal "Suggestion", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
