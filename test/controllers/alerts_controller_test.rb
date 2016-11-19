require 'test_helper'

class AlertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alert = alerts(:one)
  end

  test "should get index" do
    get alerts_url, as: :json
    assert_response :success
  end

  test "should create alert" do
    assert_difference('Alert.count') do
      post alerts_url, params: { alert: { alert_method: @alert.alert_method, alert_target: @alert.alert_target, cooldown: @alert.cooldown } }, as: :json
    end

    assert_response 201
  end

  test "should show alert" do
    get alert_url(@alert), as: :json
    assert_response :success
  end

  test "should update alert" do
    patch alert_url(@alert), params: { alert: { alert_method: @alert.alert_method, alert_target: @alert.alert_target, cooldown: @alert.cooldown } }, as: :json
    assert_response 200
  end

  test "should destroy alert" do
    assert_difference('Alert.count', -1) do
      delete alert_url(@alert), as: :json
    end

    assert_response 204
  end
end
