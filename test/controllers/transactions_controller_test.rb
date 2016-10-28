require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase
  test "you can see check out page if you have items in your cart" do
    session[:cart_id]=cart_products(:test_cart_item).cart.id
    get :new
    assert_response :success
  end

  test "if you have no items in your cart you are redirected" do
    request.env["HTTP_REFERER"]="blah"
    session[:cart_id]=cart_products(:test_cart_item).cart.id
    get :new
    assert_redirected_to "blah"
  end
  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end

  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

end
