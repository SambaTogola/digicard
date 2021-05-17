require "application_system_test_case"

class OrganizationTypesTest < ApplicationSystemTestCase
  setup do
    @organization_type = organization_types(:one)
  end

  test "visiting the index" do
    visit organization_types_url
    assert_selector "h1", text: "Organization Types"
  end

  test "creating a Organization type" do
    visit organization_types_url
    click_on "New Organization Type"

    fill_in "Description", with: @organization_type.description
    fill_in "Name", with: @organization_type.name
    fill_in "Status", with: @organization_type.status
    fill_in "User", with: @organization_type.user_id
    click_on "Create Organization type"

    assert_text "Organization type was successfully created"
    click_on "Back"
  end

  test "updating a Organization type" do
    visit organization_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @organization_type.description
    fill_in "Name", with: @organization_type.name
    fill_in "Status", with: @organization_type.status
    fill_in "User", with: @organization_type.user_id
    click_on "Update Organization type"

    assert_text "Organization type was successfully updated"
    click_on "Back"
  end

  test "destroying a Organization type" do
    visit organization_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Organization type was successfully destroyed"
  end
end
