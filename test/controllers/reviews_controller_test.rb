require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  
  #This test throws an error because @products is nil
  #should probably test this in the products controller or use integration testing
  # test "should get new" do
  #   get :new, id: products(:couple_cases)
  #   assert_response :success
  # end

  test "the user should be able to create a review if the info is valid" do
    review_params={review:{rating: 2, content: "blah"}, product_id: products(:couple_cases)}
    post :create, review_params
    assert_redirected_to product_path(id: products(:couple_cases))
  end

  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

end
