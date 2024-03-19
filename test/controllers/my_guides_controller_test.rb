require "test_helper"

class MyGuidesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get my_guides_new_url
    assert_response :success
  end

  test "should get create" do
    get my_guides_create_url
    assert_response :success
  end

  test "should get show" do
    get my_guides_show_url
    assert_response :success
  end

  test "should get edit" do
    get my_guides_edit_url
    assert_response :success
  end

  test "should get update" do
    get my_guides_update_url
    assert_response :success
  end

  test "should get redirect" do
    get my_guides_redirect_url
    assert_response :success
  end
end
