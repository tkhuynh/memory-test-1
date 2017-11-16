require 'test_helper'

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get customer_create_url
    assert_response :success
  end

end
