require "application_system_test_case"

class SmtpConfigsTest < ApplicationSystemTestCase
  setup do
    @smtp_config = smtp_configs(:one)
  end

  test "visiting the index" do
    visit smtp_configs_url
    assert_selector "h1", text: "Smtp Configs"
  end

  test "creating a Smtp config" do
    visit smtp_configs_url
    click_on "New Smtp Config"

    fill_in "Smtp host", with: @smtp_config.smtp_host
    click_on "Create Smtp config"

    assert_text "Smtp config was successfully created"
    click_on "Back"
  end

  test "updating a Smtp config" do
    visit smtp_configs_url
    click_on "Edit", match: :first

    fill_in "Smtp host", with: @smtp_config.smtp_host
    click_on "Update Smtp config"

    assert_text "Smtp config was successfully updated"
    click_on "Back"
  end

  test "destroying a Smtp config" do
    visit smtp_configs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Smtp config was successfully destroyed"
  end
end
