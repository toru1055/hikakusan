require 'test_helper'

class ColumnsControllerTest < ActionController::TestCase
  setup do
    @column = columns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:columns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create column" do
    assert_difference('Column.count') do
      post :create, column: { default_value: @column.default_value, name: @column.name, not_null: @column.not_null, table_id: @column.table_id, type_id: @column.type_id, unique: @column.unique, unit: @column.unit }
    end

    assert_redirected_to column_path(assigns(:column))
  end

  test "should show column" do
    get :show, id: @column
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @column
    assert_response :success
  end

  test "should update column" do
    patch :update, id: @column, column: { default_value: @column.default_value, name: @column.name, not_null: @column.not_null, table_id: @column.table_id, type_id: @column.type_id, unique: @column.unique, unit: @column.unit }
    assert_redirected_to column_path(assigns(:column))
  end

  test "should destroy column" do
    assert_difference('Column.count', -1) do
      delete :destroy, id: @column
    end

    assert_redirected_to columns_path
  end
end
