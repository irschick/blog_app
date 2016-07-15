require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get landing_page" do
    get :landing_page
    assert_response :success
  end

end
