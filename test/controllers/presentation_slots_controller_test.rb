require "test_helper"

class PresentationSlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get presentation_slots_index_url
    assert_response :success
  end
end
