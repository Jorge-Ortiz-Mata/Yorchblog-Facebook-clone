require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "Root path" do
    get root_path
    assert_response :success
  end
end
