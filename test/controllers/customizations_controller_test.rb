require 'test_helper'

class CustomizationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customizations_new_url
    assert_response :success
  end

  test "should get create" do
    get customizations_create_url
    assert_response :success
  end

  test "should get edit" do
    get customizations_edit_url
    assert_response :success
  end

  test "should get update" do
    get customizations_update_url
    assert_response :success
  end

  test "should get delete" do
    get customizations_delete_url
    assert_response :success
  end

end
