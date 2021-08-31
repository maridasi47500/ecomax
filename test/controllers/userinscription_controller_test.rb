require 'test_helper'

class UserinscriptionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get userinscription_new_url
    assert_response :success
  end

end
