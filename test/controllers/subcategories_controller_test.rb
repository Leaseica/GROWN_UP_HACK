require "test_helper"

class SubcategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subcategories_index_url
    assert_response :success
  end

  test "should get show" do
    get subcategories_show_url
    assert_response :success
  end
end
