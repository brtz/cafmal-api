require 'test_helper'

class ChecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @check = checks(:one)
  end

  test "should get index" do
    get checks_url, as: :json
    assert_response :success
  end

  test "should create check" do
    assert_difference('Check.count') do
      post checks_url, params: { check: { category: @check.category, condition_aggegrator: @check.condition_aggegrator, condition_operand: @check.condition_operand, condition_query: @check.condition_query, interval: @check.interval, is_locked: @check.is_locked, last_ran_at: @check.last_ran_at, name: @check.name, severity: @check.severity } }, as: :json
    end

    assert_response 201
  end

  test "should show check" do
    get check_url(@check), as: :json
    assert_response :success
  end

  test "should update check" do
    patch check_url(@check), params: { check: { category: @check.category, condition_aggegrator: @check.condition_aggegrator, condition_operand: @check.condition_operand, condition_query: @check.condition_query, interval: @check.interval, is_locked: @check.is_locked, last_ran_at: @check.last_ran_at, name: @check.name, severity: @check.severity } }, as: :json
    assert_response 200
  end

  test "should destroy check" do
    assert_difference('Check.count', -1) do
      delete check_url(@check), as: :json
    end

    assert_response 204
  end
end
