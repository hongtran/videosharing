require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "should get signup" do
  #   get signup_url 
  #   assert_response :success
  # end

  test "should get login" do
    get login_url, params: { email: 'hong@example.com', password: '123456' }
    assert_response :success
  end
end
