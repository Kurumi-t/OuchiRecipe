require "test_helper"

class Public::ShoppingListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_shopping_lists_index_url
    assert_response :success
  end
end
