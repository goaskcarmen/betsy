require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "You should see the new products form if you are a merchant" do
    session[:user_id]= users(:current_user).id
    get :new
    assert_response :success
  end

  test "You should get redirected if you are a guest if you try to make a new product" do
    request.env["HTTP_REFERER"]="blah"
    get :new
    assert_redirected_to "blah"
  end

  test "A guest/buyer cannot create a new product" do
    request.env["HTTP_REFERER"]="blah"
    get :create #put vailid params here
    assert_redirected_to "blah"
  end

  test "A merchant can create a new product if they put in valid info" do
    session[:user_id]= users(:current_user).id
    product_params={product:{name: 2, unit_price: "blah", quantity: 9}, user_id: users(:current_user).id}
    get :create, product_params
    assert_redirected_to index_path
  end

  test "A merchant a product is not created unless it includes a quantity" do
    session[:user_id]= users(:current_user).id
    product_params={product:{name: 2, unit_price: "blah"}, user_id: users(:current_user).id}
    get :create, product_params
    assert_template :new
  end

  # Also test that name and unit price are present
  
  test "You can see the edit a product page if it is your product" do
    session[:user_id]= users(:current_user).id
    get :edit, id: products(:couple_cases)
    assert_response :success
  end
    #product_params={product:{name: 2, unit_price: "blah", quantity: 3}}
  test "You cannot see the edit a product page if it isn't your product" do
    session[:user_id]= users(:current_user).id
    get :edit, id: products(:couple_cases)
    assert_response :success
  end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

  
  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

end
