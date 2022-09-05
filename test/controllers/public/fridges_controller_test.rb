require "test_helper"

class Public::FridgesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_fridges_index_url
    assert_response :success
  end
end
