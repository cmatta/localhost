require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  def test_create_invalid
    Review.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Review.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end

  def test_destroy
    review = Review.first
    delete :destroy, :id => review
    assert_redirected_to root_url
    assert !Review.exists?(review.id)
  end
end
