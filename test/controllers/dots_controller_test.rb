require 'test_helper'

class DotsControllerTest < ActionController::TestCase
  setup do
    @dot = dots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dot" do
    assert_difference('Dot.count') do
      post :create, dot: { description: @dot.description }
    end

    assert_redirected_to dot_path(assigns(:dot))
  end

  test "should show dot" do
    get :show, id: @dot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dot
    assert_response :success
  end

  test "should update dot" do
    patch :update, id: @dot, dot: { description: @dot.description }
    assert_redirected_to dot_path(assigns(:dot))
  end

  test "should destroy dot" do
    assert_difference('Dot.count', -1) do
      delete :destroy, id: @dot
    end

    assert_redirected_to dots_path
  end
end
