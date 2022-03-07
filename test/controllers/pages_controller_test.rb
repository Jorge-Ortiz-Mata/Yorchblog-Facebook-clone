require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should home path" do
    get root_path
    assert_response :success
  end
end
