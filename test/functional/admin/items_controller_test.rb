require 'test_helper'

class Admin::ItemsControllerTest < ActionController::TestCase
  setup do
    @admin_item = admin_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_item" do
    assert_difference('Admin::Item.count') do
      post :create, admin_item: { availability: @admin_item.availability, category: @admin_item.category, picture1: @admin_item.picture1, picture2: @admin_item.picture2, picture3: @admin_item.picture3, price: @admin_item.price }
    end

    assert_redirected_to admin_item_path(assigns(:admin_item))
  end

  test "should show admin_item" do
    get :show, id: @admin_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_item
    assert_response :success
  end

  test "should update admin_item" do
    put :update, id: @admin_item, admin_item: { availability: @admin_item.availability, category: @admin_item.category, picture1: @admin_item.picture1, picture2: @admin_item.picture2, picture3: @admin_item.picture3, price: @admin_item.price }
    assert_redirected_to admin_item_path(assigns(:admin_item))
  end

  test "should destroy admin_item" do
    assert_difference('Admin::Item.count', -1) do
      delete :destroy, id: @admin_item
    end

    assert_redirected_to admin_items_path
  end
end
