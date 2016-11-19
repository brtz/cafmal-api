require 'test_helper'

class AlertersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alerter = alerters(:one)
  end

  test "should get index" do
    get alerters_url, as: :json
    assert_response :success
  end

  test "should create alerter" do
    assert_difference('Alerter.count') do
      post alerters_url, params: { alerter: { heartbeat_received_at: @alerter.heartbeat_received_at, supported_targets: @alerter.supported_targets, uuid: @alerter.uuid } }, as: :json
    end

    assert_response 201
  end

  test "should show alerter" do
    get alerter_url(@alerter), as: :json
    assert_response :success
  end

  test "should update alerter" do
    patch alerter_url(@alerter), params: { alerter: { heartbeat_received_at: @alerter.heartbeat_received_at, supported_targets: @alerter.supported_targets, uuid: @alerter.uuid } }, as: :json
    assert_response 200
  end

  test "should destroy alerter" do
    assert_difference('Alerter.count', -1) do
      delete alerter_url(@alerter), as: :json
    end

    assert_response 204
  end
end
