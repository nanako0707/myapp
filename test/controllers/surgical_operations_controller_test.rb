require 'test_helper'

class SurgicalOperationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get surgical_operations_index_url
    assert_response :success
  end

end
