require 'test_helper'

class GuildControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get guild_new_url
    assert_response :success
  end

  test "should get create" do
    get guild_create_url
    assert_response :success
  end

end
