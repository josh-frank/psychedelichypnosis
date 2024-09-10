require "application_system_test_case"

class ReleaseSignaturesTest < ApplicationSystemTestCase
  setup do
    @release_signature = release_signatures(:one)
  end

  test "visiting the index" do
    visit release_signatures_url
    assert_selector "h1", text: "Release Signatures"
  end

  test "creating a Release signature" do
    visit release_signatures_url
    click_on "New Release Signature"

    fill_in "Date", with: @release_signature.date
    fill_in "E signature", with: @release_signature.e_signature
    fill_in "Release version", with: @release_signature.release_version
    fill_in "User", with: @release_signature.user_id
    click_on "Create Release signature"

    assert_text "Release signature was successfully created"
    click_on "Back"
  end

  test "updating a Release signature" do
    visit release_signatures_url
    click_on "Edit", match: :first

    fill_in "Date", with: @release_signature.date
    fill_in "E signature", with: @release_signature.e_signature
    fill_in "Release version", with: @release_signature.release_version
    fill_in "User", with: @release_signature.user_id
    click_on "Update Release signature"

    assert_text "Release signature was successfully updated"
    click_on "Back"
  end

  test "destroying a Release signature" do
    visit release_signatures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Release signature was successfully destroyed"
  end
end
