require "test_helper"

class PresentationParamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get presentation_params_index_url
    assert_response :success
  end
end
