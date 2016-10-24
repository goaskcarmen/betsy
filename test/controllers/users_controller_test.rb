require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    def set_auth_hash
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
      session[:auth_hash]=request.env['omniauth.auth']
    end

    ### Action: NEW ###
    test "can see the new user registration page if they are a new user" do
      set_auth_hash
      get :new
      assert_response :success
    end

     test "get redirected to the page they were on if they are a current user" do
      request.env["HTTP_REFERER"]="blah"
      session[:user_id]=users(:current_user).id
      get :new
      assert_redirected_to "blah"
      assert_equal flash[:notice], "You are already registered with github"
    end

     test "get redirected to the auth page if they haven't authorized github yet" do
      get :new
      assert_redirected_to "/auth/github" 
    end

    ### Action: CREATE ###
    test "can create/register a new user" do
      assert_difference('User.count', 1) do
        user_params = {user:{name: "Ada", email: "a@b.com", uid: "12345", provider: "github"}}
        post :create, user_params
        assert_redirected_to index_path
      end
    end

     test "cannot create a new user without email and name" do
      assert_difference('User.count', 0) do
        user_params = {user:{uid: "12345", provider: "github"}}
        post :create, user_params
        assert_equal flash[:notice], "unable to save user"
      end
    end


    ### Action: EDIT ###
    test "should get edit" do
      #user_params = {user:{name: "Ada", email: "a@b.com", uid: "12345", provider: "github"}}
      session[:user_id]= users(:current_user).id
      get :edit, id: users(:current_user)
      assert_response :success
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

  

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

end
