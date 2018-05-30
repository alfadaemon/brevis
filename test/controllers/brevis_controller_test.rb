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
      post brevis_url, params: { brevi: { original_url: @brevi.original_url } }
    end

    assert_redirected_to brevi_url(Brevi.last)
  end

  test "should redirect to original_url" do
    get brevi_url(@brevi.slug)
    assert_redirected_to @brevi.original_url
  end
end
