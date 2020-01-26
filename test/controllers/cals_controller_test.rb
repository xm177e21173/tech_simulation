require 'test_helper'

class CalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cals_new_url
    assert_response :success
  end

end
