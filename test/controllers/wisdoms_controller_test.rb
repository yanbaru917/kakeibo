require 'test_helper'

class WisdomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wisdoms_index_url
    assert_response :success
  end

end
