require "test_helper"

class FidelityCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fidelity_card_new_url
    assert_response :success
  end
end
