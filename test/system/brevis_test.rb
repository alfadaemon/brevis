require "application_system_test_case"

class BrevisTest < ApplicationSystemTestCase
  setup do
    @brevi = brevis(:one)
  end

  test "visiting the index" do
    visit brevis_url
    assert_selector "h1", text: "Brevis"
  end

  test "creating a Brevi" do
    visit brevis_url
    click_on "New Brevi"

    fill_in "Clicks", with: @brevi.clicks
    fill_in "Original Url", with: @brevi.original_url
    fill_in "Protocol", with: @brevi.protocol
    fill_in "Slug", with: @brevi.slug
    click_on "Create Brevi"

    assert_text "Brevi was successfully created"
    click_on "Back"
  end

  test "updating a Brevi" do
    visit brevis_url
    click_on "Edit", match: :first

    fill_in "Clicks", with: @brevi.clicks
    fill_in "Original Url", with: @brevi.original_url
    fill_in "Protocol", with: @brevi.protocol
    fill_in "Slug", with: @brevi.slug
    click_on "Update Brevi"

    assert_text "Brevi was successfully updated"
    click_on "Back"
  end

  test "destroying a Brevi" do
    visit brevis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Brevi was successfully destroyed"
  end
end
