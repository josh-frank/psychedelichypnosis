require 'test_helper'

class ReleaseSignaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @release_signature = release_signatures(:one)
  end

  test "should get index" do
    get release_signatures_url
    assert_response :success
  end

  test "should get new" do
    get new_release_signature_url
    assert_response :success
  end

  test "should create release_signature" do
    assert_difference('ReleaseSignature.count') do
      post release_signatures_url, params: { release_signature: { date: @release_signature.date, e_signature: @release_signature.e_signature, release_version: @release_signature.release_version, user_id: @release_signature.user_id } }
    end

    assert_redirected_to release_signature_url(ReleaseSignature.last)
  end

  test "should show release_signature" do
    get release_signature_url(@release_signature)
    assert_response :success
  end

  test "should get edit" do
    get edit_release_signature_url(@release_signature)
    assert_response :success
  end

  test "should update release_signature" do
    patch release_signature_url(@release_signature), params: { release_signature: { date: @release_signature.date, e_signature: @release_signature.e_signature, release_version: @release_signature.release_version, user_id: @release_signature.user_id } }
    assert_redirected_to release_signature_url(@release_signature)
  end

  test "should destroy release_signature" do
    assert_difference('ReleaseSignature.count', -1) do
      delete release_signature_url(@release_signature)
    end

    assert_redirected_to release_signatures_url
  end
end
