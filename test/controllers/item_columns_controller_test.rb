require 'test_helper'

class ItemColumnsControllerTest < ActionController::TestCase
  setup do
    @item_column = item_columns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_columns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_column" do
    assert_difference('ItemColumn.count') do
      post :create, item_column: { column_id: @item_column.column_id, item_id: @item_column.item_id, table_id: @item_column.table_id, value: @item_column.value }
    end

    assert_redirected_to item_column_path(assigns(:item_column))
  end

  test "should show item_column" do
    get :show, id: @item_column
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_column
    assert_response :success
  end

  test "should update item_column" do
    patch :update, id: @item_column, item_column: { column_id: @item_column.column_id, item_id: @item_column.item_id, table_id: @item_column.table_id, value: @item_column.value }
    assert_redirected_to item_column_path(assigns(:item_column))
  end

  test "should destroy item_column" do
    assert_difference('ItemColumn.count', -1) do
      delete :destroy, id: @item_column
    end

    assert_redirected_to item_columns_path
  end
end
