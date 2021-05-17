require "application_system_test_case"

class SubscriptionTypesTest < ApplicationSystemTestCase
  setup do
    @subscription_type = subscription_types(:one)
  end

  test "visiting the index" do
    visit subscription_types_url
    assert_selector "h1", text: "Subscription Types"
  end

  test "creating a Subscription type" do
    visit subscription_types_url
    click_on "New Subscription Type"

    fill_in "Description", with: @subscription_type.description
    fill_in "Name", with: @subscription_type.name
    fill_in "Status", with: @subscription_type.status
    fill_in "User", with: @subscription_type.user_id
    click_on "Create Subscription type"

    assert_text "Subscription type was successfully created"
    click_on "Back"
  end

  test "updating a Subscription type" do
    visit subscription_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @subscription_type.description
    fill_in "Name", with: @subscription_type.name
    fill_in "Status", with: @subscription_type.status
    fill_in "User", with: @subscription_type.user_id
    click_on "Update Subscription type"

    assert_text "Subscription type was successfully updated"
    click_on "Back"
  end

  test "destroying a Subscription type" do
    visit subscription_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subscription type was successfully destroyed"
  end
end
