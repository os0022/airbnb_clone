require 'test_helper'

class SignUpControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sign_up_index_url
    assert_response :success
  end

end
