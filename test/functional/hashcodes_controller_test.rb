require 'test_helper'

class HashcodesControllerTest < ActionController::TestCase
  setup do
    @hashcode = hashcodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hashcodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hashcode" do
    assert_difference('Hashcode.count') do
      post :create, :hashcode => @hashcode.attributes
    end

    assert_redirected_to hashcode_path(assigns(:hashcode))
  end

  test "should show hashcode" do
    get :show, :id => @hashcode.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hashcode.to_param
    assert_response :success
  end

  test "should update hashcode" do
    put :update, :id => @hashcode.to_param, :hashcode => @hashcode.attributes
    assert_redirected_to hashcode_path(assigns(:hashcode))
  end

  test "should destroy hashcode" do
    assert_difference('Hashcode.count', -1) do
      delete :destroy, :id => @hashcode.to_param
    end

    assert_redirected_to hashcodes_path
  end
end
