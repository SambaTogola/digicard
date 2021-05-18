require 'test_helper'

class SmtpConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @smtp_config = smtp_configs(:one)
  end

  test "should get index" do
    get smtp_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_smtp_config_url
    assert_response :success
  end

  test "should create smtp_config" do
    assert_difference('SmtpConfig.count') do
      post smtp_configs_url, params: { smtp_config: { smtp_host: @smtp_config.smtp_host } }
    end

    assert_redirected_to smtp_config_url(SmtpConfig.last)
  end

  test "should show smtp_config" do
    get smtp_config_url(@smtp_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_smtp_config_url(@smtp_config)
    assert_response :success
  end

  test "should update smtp_config" do
    patch smtp_config_url(@smtp_config), params: { smtp_config: { smtp_host: @smtp_config.smtp_host } }
    assert_redirected_to smtp_config_url(@smtp_config)
  end

  test "should destroy smtp_config" do
    assert_difference('SmtpConfig.count', -1) do
      delete smtp_config_url(@smtp_config)
    end

    assert_redirected_to smtp_configs_url
  end
end
