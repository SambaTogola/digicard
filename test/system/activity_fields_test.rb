require "application_system_test_case"

class ActivityFieldsTest < ApplicationSystemTestCase
  setup do
    @activity_field = activity_fields(:one)
  end

  test "visiting the index" do
    visit activity_fields_url
    assert_selector "h1", text: "Activity Fields"
  end

  test "creating a Activity field" do
    visit activity_fields_url
    click_on "New Activity Field"

    fill_in "Description", with: @activity_field.description
    fill_in "Name", with: @activity_field.name
    fill_in "Status", with: @activity_field.status
    fill_in "User", with: @activity_field.user_id
    click_on "Create Activity field"

    assert_text "Activity field was successfully created"
    click_on "Back"
  end

  test "updating a Activity field" do
    visit activity_fields_url
    click_on "Edit", match: :first

    fill_in "Description", with: @activity_field.description
    fill_in "Name", with: @activity_field.name
    fill_in "Status", with: @activity_field.status
    fill_in "User", with: @activity_field.user_id
    click_on "Update Activity field"

    assert_text "Activity field was successfully updated"
    click_on "Back"
  end

  test "destroying a Activity field" do
    visit activity_fields_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activity field was successfully destroyed"
  end
end
