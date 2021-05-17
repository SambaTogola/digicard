require "application_system_test_case"

class SubscriptionPackFeaturesTest < ApplicationSystemTestCase
  setup do
    @subscription_pack_feature = subscription_pack_features(:one)
  end

  test "visiting the index" do
    visit subscription_pack_features_url
    assert_selector "h1", text: "Subscription Pack Features"
  end

  test "creating a Subscription pack feature" do
    visit subscription_pack_features_url
    click_on "New Subscription Pack Feature"

    fill_in "Description", with: @subscription_pack_feature.description
    fill_in "Name", with: @subscription_pack_feature.name
    fill_in "Status", with: @subscription_pack_feature.status
    fill_in "User", with: @subscription_pack_feature.user_id
    click_on "Create Subscription pack feature"

    assert_text "Subscription pack feature was successfully created"
    click_on "Back"
  end

  test "updating a Subscription pack feature" do
    visit subscription_pack_features_url
    click_on "Edit", match: :first

    fill_in "Description", with: @subscription_pack_feature.description
    fill_in "Name", with: @subscription_pack_feature.name
    fill_in "Status", with: @subscription_pack_feature.status
    fill_in "User", with: @subscription_pack_feature.user_id
    click_on "Update Subscription pack feature"

    assert_text "Subscription pack feature was successfully updated"
    click_on "Back"
  end

  test "destroying a Subscription pack feature" do
    visit subscription_pack_features_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subscription pack feature was successfully destroyed"
  end
end
