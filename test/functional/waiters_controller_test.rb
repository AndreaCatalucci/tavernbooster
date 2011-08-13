require 'test_helper'

class WaitersControllerTest < ActionController::TestCase
  setup do
    @waiter = waiters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:waiters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create waiter" do
    assert_difference('Waiter.count') do
      post :create, waiter: @waiter.attributes
    end

    assert_redirected_to waiter_path(assigns(:waiter))
  end

  test "should show waiter" do
    get :show, id: @waiter.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @waiter.to_param
    assert_response :success
  end

  test "should update waiter" do
    put :update, id: @waiter.to_param, waiter: @waiter.attributes
    assert_redirected_to waiter_path(assigns(:waiter))
  end

  test "should destroy waiter" do
    assert_difference('Waiter.count', -1) do
      delete :destroy, id: @waiter.to_param
    end

    assert_redirected_to waiters_path
  end
end
