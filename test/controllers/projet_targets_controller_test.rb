require 'test_helper'

class ProjetTargetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @projet_target = projet_targets(:one)
  end

  test "should get index" do
    get projet_targets_url
    assert_response :success
  end

  test "should get new" do
    get new_projet_target_url
    assert_response :success
  end

  test "should create projet_target" do
    assert_difference('ProjetTarget.count') do
      post projet_targets_url, params: { projet_target: { projet_id: @projet_target.projet_id, target_id: @projet_target.target_id } }
    end

    assert_redirected_to projet_target_url(ProjetTarget.last)
  end

  test "should show projet_target" do
    get projet_target_url(@projet_target)
    assert_response :success
  end

  test "should get edit" do
    get edit_projet_target_url(@projet_target)
    assert_response :success
  end

  test "should update projet_target" do
    patch projet_target_url(@projet_target), params: { projet_target: { projet_id: @projet_target.projet_id, target_id: @projet_target.target_id } }
    assert_redirected_to projet_target_url(@projet_target)
  end

  test "should destroy projet_target" do
    assert_difference('ProjetTarget.count', -1) do
      delete projet_target_url(@projet_target)
    end

    assert_redirected_to projet_targets_url
  end
end
