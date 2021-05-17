require "application_system_test_case"

class SubscriptionPackItemsTest < ApplicationSystemTestCase
  setup do
    @subscription_pack_item = subscription_pack_items(:one)
  end

  test "visiting the index" do
    visit subscription_pack_items_url
    assert_selector "h1", text: "Subscription Pack Items"
  end

  test "creating a Subscription pack item" do
    visit subscription_pack_items_url
    click_on "New Subscription Pack Item"

    fill_in "Quantity", with: @subscription_pack_item.quantity
    fill_in "Status", with: @subscription_pack_item.status
    fill_in "Subscription pack feature", with: @subscription_pack_item.subscription_pack_feature_id
    fill_in "Subscription pack", with: @subscription_pack_item.subscription_pack_id
    fill_in "User", with: @subscription_pack_item.user_id
    click_on "Create Subscription pack item"

    assert_text "Subscription pack item was successfully created"
    click_on "Back"
  end

  test "updating a Subscription pack item" do
    visit subscription_pack_items_url
    click_on "Edit", match: :first

    fill_in "Quantity", with: @subscription_pack_item.quantity
    fill_in "Status", with: @subscription_pack_item.status
    fill_in "Subscription pack feature", with: @subscription_pack_item.subscription_pack_feature_id
    fill_in "Subscription pack", with: @subscription_pack_item.subscription_pack_id
    fill_in "User", with: @subscription_pack_item.user_id
    click_on "Update Subscription pack item"

    assert_text "Subscription pack item was successfully updated"
    click_on "Back"
  end

  test "destroying a Subscription pack item" do
    visit subscription_pack_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subscription pack item was successfully destroyed"
  end
end
