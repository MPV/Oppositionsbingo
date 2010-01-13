require 'test_helper'

class SquaresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:squares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create square" do
    assert_difference('Square.count') do
      post :create, :square => { }
    end

    assert_redirected_to square_path(assigns(:square))
  end

  test "should show square" do
    get :show, :id => squares(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => squares(:one).to_param
    assert_response :success
  end

  test "should update square" do
    put :update, :id => squares(:one).to_param, :square => { }
    assert_redirected_to square_path(assigns(:square))
  end

  test "should destroy square" do
    assert_difference('Square.count', -1) do
      delete :destroy, :id => squares(:one).to_param
    end

    assert_redirected_to squares_path
  end
end
