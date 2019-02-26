require 'test_helper'

class AuthorizationsControllerTest < ActionDispatch::IntegrationTest
  test "should get linkedin" do
    get authorizations_linkedin_url
    assert_response :success
  end

  test "should get failure" do
    get authorizations_failure_url
    assert_response :success
  end

end
