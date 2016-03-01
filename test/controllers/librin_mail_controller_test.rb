require 'test_helper'

class LibrinMailControllerTest < ActionController::TestCase
  test "should get suggestion" do
    get :suggestion
    assert_response :success
  end

end
