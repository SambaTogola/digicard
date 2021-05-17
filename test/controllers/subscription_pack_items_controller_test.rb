require 'test_helper'

class SubscriptionPackItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription_pack_item = subscription_pack_items(:one)
  end

  test "should get index" do
    get subscription_pack_items_url
    assert_response :success
  end

  test "should get new" do
    get new_subscription_pack_item_url
    assert_response :success
  end

  test "should create subscription_pack_item" do
    assert_difference('SubscriptionPackItem.count') do
      post subscription_pack_items_url, params: { subscription_pack_item: { quantity: @subscription_pack_item.quantity, status: @subscription_pack_item.status, subscription_pack_feature_id: @subscription_pack_item.subscription_pack_feature_id, subscription_pack_id: @subscription_pack_item.subscription_pack_id, user_id: @subscription_pack_item.user_id } }
    end

    assert_redirected_to subscription_pack_item_url(SubscriptionPackItem.last)
  end

  test "should show subscription_pack_item" do
    get subscription_pack_item_url(@subscription_pack_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscription_pack_item_url(@subscription_pack_item)
    assert_response :success
  end

  test "should update subscription_pack_item" do
    patch subscription_pack_item_url(@subscription_pack_item), params: { subscription_pack_item: { quantity: @subscription_pack_item.quantity, status: @subscription_pack_item.status, subscription_pack_feature_id: @subscription_pack_item.subscription_pack_feature_id, subscription_pack_id: @subscription_pack_item.subscription_pack_id, user_id: @subscription_pack_item.user_id } }
    assert_redirected_to subscription_pack_item_url(@subscription_pack_item)
  end

  test "should destroy subscription_pack_item" do
    assert_difference('SubscriptionPackItem.count', -1) do
      delete subscription_pack_item_url(@subscription_pack_item)
    end

    assert_redirected_to subscription_pack_items_url
  end
end
