require 'test_helper'

class SubscriptionPackFeaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription_pack_feature = subscription_pack_features(:one)
  end

  test "should get index" do
    get subscription_pack_features_url
    assert_response :success
  end

  test "should get new" do
    get new_subscription_pack_feature_url
    assert_response :success
  end

  test "should create subscription_pack_feature" do
    assert_difference('SubscriptionPackFeature.count') do
      post subscription_pack_features_url, params: { subscription_pack_feature: { description: @subscription_pack_feature.description, name: @subscription_pack_feature.name, status: @subscription_pack_feature.status, user_id: @subscription_pack_feature.user_id } }
    end

    assert_redirected_to subscription_pack_feature_url(SubscriptionPackFeature.last)
  end

  test "should show subscription_pack_feature" do
    get subscription_pack_feature_url(@subscription_pack_feature)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscription_pack_feature_url(@subscription_pack_feature)
    assert_response :success
  end

  test "should update subscription_pack_feature" do
    patch subscription_pack_feature_url(@subscription_pack_feature), params: { subscription_pack_feature: { description: @subscription_pack_feature.description, name: @subscription_pack_feature.name, status: @subscription_pack_feature.status, user_id: @subscription_pack_feature.user_id } }
    assert_redirected_to subscription_pack_feature_url(@subscription_pack_feature)
  end

  test "should destroy subscription_pack_feature" do
    assert_difference('SubscriptionPackFeature.count', -1) do
      delete subscription_pack_feature_url(@subscription_pack_feature)
    end

    assert_redirected_to subscription_pack_features_url
  end
end
