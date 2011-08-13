require 'test_helper'

class UserEssionsControllerTest < ActionController::TestCase
  setup do
    @user_ession = user_essions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_essions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_ession" do
    assert_difference('UserEssion.count') do
      post :create, user_ession: @user_ession.attributes
    end

    assert_redirected_to user_ession_path(assigns(:user_ession))
  end

  test "should show user_ession" do
    get :show, id: @user_ession.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_ession.to_param
    assert_response :success
  end

  test "should update user_ession" do
    put :update, id: @user_ession.to_param, user_ession: @user_ession.attributes
    assert_redirected_to user_ession_path(assigns(:user_ession))
  end

  test "should destroy user_ession" do
    assert_difference('UserEssion.count', -1) do
      delete :destroy, id: @user_ession.to_param
    end

    assert_redirected_to user_essions_path
  end
end
