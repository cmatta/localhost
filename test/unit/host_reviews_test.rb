require 'test_helper'

class HostReviewsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert HostReviews.new.valid?
  end
end
