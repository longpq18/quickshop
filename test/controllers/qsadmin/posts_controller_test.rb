require 'test_helper'

class Qsadmin::PostsControllerTest < ActionController::TestCase
  setup do
    @qsadmin_post = qsadmin_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qsadmin_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qsadmin_post" do
    assert_difference('Qsadmin::Post.count') do
      post :create, qsadmin_post: {  }
    end

    assert_redirected_to qsadmin_post_path(assigns(:qsadmin_post))
  end

  test "should show qsadmin_post" do
    get :show, id: @qsadmin_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qsadmin_post
    assert_response :success
  end

  test "should update qsadmin_post" do
    patch :update, id: @qsadmin_post, qsadmin_post: {  }
    assert_redirected_to qsadmin_post_path(assigns(:qsadmin_post))
  end

  test "should destroy qsadmin_post" do
    assert_difference('Qsadmin::Post.count', -1) do
      delete :destroy, id: @qsadmin_post
    end

    assert_redirected_to qsadmin_posts_path
  end
end
