require 'test_helper'

class ActivityFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_field = activity_fields(:one)
  end

  test "should get index" do
    get activity_fields_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_field_url
    assert_response :success
  end

  test "should create activity_field" do
    assert_difference('ActivityField.count') do
      post activity_fields_url, params: { activity_field: { description: @activity_field.description, name: @activity_field.name, status: @activity_field.status, user_id: @activity_field.user_id } }
    end

    assert_redirected_to activity_field_url(ActivityField.last)
  end

  test "should show activity_field" do
    get activity_field_url(@activity_field)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_field_url(@activity_field)
    assert_response :success
  end

  test "should update activity_field" do
    patch activity_field_url(@activity_field), params: { activity_field: { description: @activity_field.description, name: @activity_field.name, status: @activity_field.status, user_id: @activity_field.user_id } }
    assert_redirected_to activity_field_url(@activity_field)
  end

  test "should destroy activity_field" do
    assert_difference('ActivityField.count', -1) do
      delete activity_field_url(@activity_field)
    end

    assert_redirected_to activity_fields_url
  end
end
