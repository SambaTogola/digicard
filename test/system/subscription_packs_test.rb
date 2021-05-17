require "application_system_test_case"

class SubscriptionPacksTest < ApplicationSystemTestCase
  setup do
    @subscription_pack = subscription_packs(:one)
  end

  test "visiting the index" do
    visit subscription_packs_url
    assert_selector "h1", text: "Subscription Packs"
  end

  test "creating a Subscription pack" do
    visit subscription_packs_url
    click_on "New Subscription Pack"

    fill_in "Description", with: @subscription_pack.description
    fill_in "Name", with: @subscription_pack.name
    fill_in "Price", with: @subscription_pack.price
    fill_in "Status", with: @subscription_pack.status
    fill_in "User", with: @subscription_pack.user_id
    click_on "Create Subscription pack"

    assert_text "Subscription pack was successfully created"
    click_on "Back"
  end

  test "updating a Subscription pack" do
    visit subscription_packs_url
    click_on "Edit", match: :first

    fill_in "Description", with: @subscription_pack.description
    fill_in "Name", with: @subscription_pack.name
    fill_in "Price", with: @subscription_pack.price
    fill_in "Status", with: @subscription_pack.status
    fill_in "User", with: @subscription_pack.user_id
    click_on "Update Subscription pack"

    assert_text "Subscription pack was successfully updated"
    click_on "Back"
  end

  test "destroying a Subscription pack" do
    visit subscription_packs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subscription pack was successfully destroyed"
  end
end
