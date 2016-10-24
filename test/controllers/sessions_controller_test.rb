require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def log_in_a_user
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    get :create,  {provider: "github"}
  end

  # # test "should get create" do
  # #   get :create
  # #   assert_response :success
  # # end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end




  test "Can log in a user who is already registered" do
    registered_user=User.new
    registered_user.uid   = '123545'
    registered_user.provider = 'github'
    registered_user.name = 'Ada'
    registered_user.email = 'a@b.com'
    registered_user.save
    log_in_a_user

    assert_redirected_to index_path
    assert_equal flash[:notice], "successfully logged in!"
   end
      # assert_response :redirect
      # assert_redirected_to index_path


  # test "If a user logs in twice it doesn't create a 2nd user" do
  #   assert_difference('User.count', 1) do
  #     login_a_user
  #   end
  #   assert_no_difference('User.count') do
  #     login_a_user
  #     assert_response :redirect
  #     assert_redirected_to index_path
  #   end
  # end
end
