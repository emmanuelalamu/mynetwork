require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get homepage" do
    get :homepage
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get userlist" do
    get :userlist
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get follower" do
    get :follower
    assert_response :success
  end

  test "should get following" do
    get :following
    assert_response :success
  end

end
