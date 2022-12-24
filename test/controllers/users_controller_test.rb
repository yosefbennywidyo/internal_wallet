require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: 'user-5@test.com', name: 'User-5' } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should not create user with empty name" do
    post users_url, params: { user: { email: 'user-5@test.com', name: nil } }
    assert_response 422
  end

  test "should not create user with empty email" do
    post users_url, params: { user: { email: nil, name: 'Team-5' } }
    assert_response 422
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: 'user-update@test.com', name: 'user-update' } }
    assert_redirected_to user_url(@user)
  end

  test "should not update user with empty name" do
    patch user_url(@user), params: { user: { email: 'user-update@test.com', name: nil } }
    assert_response 422
  end

  test "should not update user with empty email" do
    patch user_url(@user), params: { user: { email: nil, name: 'user-update' } }
    assert_response 422
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
