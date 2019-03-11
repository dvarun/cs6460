require 'test_helper'

class AssignmentDiscussionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get assignment_discussions_show_url
    assert_response :success
  end

end
