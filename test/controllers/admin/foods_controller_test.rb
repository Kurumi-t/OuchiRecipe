require "test_helper"

class Admin::FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_foods_edit_url
    assert_response :success
  end
end
