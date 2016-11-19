require 'test_helper'

class DatasourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @datasource = datasources(:one)
  end

  test "should get index" do
    get datasources_url, as: :json
    assert_response :success
  end

  test "should create datasource" do
    assert_difference('Datasource.count') do
      post datasources_url, params: { datasource: { address: @datasource.address, password: @datasource.password, port: @datasource.port, protocol: @datasource.protocol, sourcetype: @datasource.sourcetype, username: @datasource.username } }, as: :json
    end

    assert_response 201
  end

  test "should show datasource" do
    get datasource_url(@datasource), as: :json
    assert_response :success
  end

  test "should update datasource" do
    patch datasource_url(@datasource), params: { datasource: { address: @datasource.address, password: @datasource.password, port: @datasource.port, protocol: @datasource.protocol, sourcetype: @datasource.sourcetype, username: @datasource.username } }, as: :json
    assert_response 200
  end

  test "should destroy datasource" do
    assert_difference('Datasource.count', -1) do
      delete datasource_url(@datasource), as: :json
    end

    assert_response 204
  end
end
