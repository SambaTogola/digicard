require 'test_helper'

class SubscriptionPacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription_pack = subscription_packs(:one)
  end

  test "should get index" do
    get subscription_packs_url
    assert_response :success
  end

  test "should get new" do
    get new_subscription_pack_url
    assert_response :success
  end

  test "should create subscription_pack" do
    assert_difference('SubscriptionPack.count') do
      post subscription_packs_url, params: { subscription_pack: { description: @subscription_pack.description, name: @subscription_pack.name, price: @subscription_pack.price, status: @subscription_pack.status, user_id: @subscription_pack.user_id } }
    end

    assert_redirected_to subscription_pack_url(SubscriptionPack.last)
  end

  test "should show subscription_pack" do
    get subscription_pack_url(@subscription_pack)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscription_pack_url(@subscription_pack)
    assert_response :success
  end

  test "should update subscription_pack" do
    patch subscription_pack_url(@subscription_pack), params: { subscription_pack: { description: @subscription_pack.description, name: @subscription_pack.name, price: @subscription_pack.price, status: @subscription_pack.status, user_id: @subscription_pack.user_id } }
    assert_redirected_to subscription_pack_url(@subscription_pack)
  end

  test "should destroy subscription_pack" do
    assert_difference('SubscriptionPack.count', -1) do
      delete subscription_pack_url(@subscription_pack)
    end

    assert_redirected_to subscription_packs_url
  end
end
