require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    def set_auth_hash
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
      auth_hash = request.env['omniauth.auth']
      session[:auth_hash]=auth_hash
    end


    test "can see the new user registration page if they are a new user" do
      set_auth_hash
      get :new
      assert_response :success
    end

     test "get redirected to the page they were on if they are a current user" do
      request.env["HTTP_REFERER"]="blah"
      set_auth_hash
      session[:user_id]=users(:current_user).id
      get :new
      assert_redirected_to "blah"
    end

    test "can create/register a new user" do
      assert_difference('User.count', 1) do
        set_auth_hash
        user_params = {user:{name: "Ada", email: "a@b.com", uid: "12345", provider: "github"}}
        post :create, user_params
      end
    end

  # test "should get logged_in_index" do
  #   get :logged_in_index
  #   assert_response :success
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

end
