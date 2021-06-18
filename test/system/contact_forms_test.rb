require "application_system_test_case"

class ContactFormsTest < ApplicationSystemTestCase
  setup do
    @contact_form = contact_forms(:one)
  end

  test "visiting the index" do
    visit contact_forms_url
    assert_selector "h1", text: "Contact Forms"
  end

  test "creating a Contact form" do
    visit contact_forms_url
    click_on "New Contact Form"

    click_on "Create Contact form"

    assert_text "Contact form was successfully created"
    click_on "Back"
  end

  test "updating a Contact form" do
    visit contact_forms_url
    click_on "Edit", match: :first

    click_on "Update Contact form"

    assert_text "Contact form was successfully updated"
    click_on "Back"
  end

  test "destroying a Contact form" do
    visit contact_forms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contact form was successfully destroyed"
  end
end
