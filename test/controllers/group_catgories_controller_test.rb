require 'test_helper'

class GroupCatgoriesControllerTest < ActionController::TestCase
  setup do
    @group_catgory = group_catgories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_catgories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_catgory" do
    assert_difference('GroupCatgory.count') do
      post :create, group_catgory: { name: @group_catgory.name, status: @group_catgory.status }
    end

    assert_redirected_to group_catgory_path(assigns(:group_catgory))
  end

  test "should show group_catgory" do
    get :show, id: @group_catgory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_catgory
    assert_response :success
  end

  test "should update group_catgory" do
    patch :update, id: @group_catgory, group_catgory: { name: @group_catgory.name, status: @group_catgory.status }
    assert_redirected_to group_catgory_path(assigns(:group_catgory))
  end

  test "should destroy group_catgory" do
    assert_difference('GroupCatgory.count', -1) do
      delete :destroy, id: @group_catgory
    end

    assert_redirected_to group_catgories_path
  end
end
