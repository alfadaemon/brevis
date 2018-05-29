require 'test_helper'

class BrevisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brevi = brevis(:one)
  end

  test "should get index" do
    get brevis_url
    assert_response :success
  end

  test "should get new" do
    get new_brevi_url
    assert_response :success
  end

  test "should create brevi" do
    assert_difference('Brevi.count') do
      post brevis_url, params: { brevi: { clicks: @brevi.clicks, original_url: @brevi.original_url, protocol: @brevi.protocol, slug: @brevi.slug } }
    end

    assert_redirected_to brevi_url(Brevi.last)
  end

  test "should show brevi" do
    get brevi_url(@brevi)
    assert_response :success
  end

  test "should get edit" do
    get edit_brevi_url(@brevi)
    assert_response :success
  end

  test "should update brevi" do
    patch brevi_url(@brevi), params: { brevi: { clicks: @brevi.clicks, original_url: @brevi.original_url, protocol: @brevi.protocol, slug: @brevi.slug } }
    assert_redirected_to brevi_url(@brevi)
  end

  test "should destroy brevi" do
    assert_difference('Brevi.count', -1) do
      delete brevi_url(@brevi)
    end

    assert_redirected_to brevis_url
  end
end
