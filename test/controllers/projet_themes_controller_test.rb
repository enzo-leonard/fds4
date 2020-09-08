require 'test_helper'

class ProjetThemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @projet_theme = projet_themes(:one)
  end

  test "should get index" do
    get projet_themes_url
    assert_response :success
  end

  test "should get new" do
    get new_projet_theme_url
    assert_response :success
  end

  test "should create projet_theme" do
    assert_difference('ProjetTheme.count') do
      post projet_themes_url, params: { projet_theme: { projet_id: @projet_theme.projet_id, theme_id: @projet_theme.theme_id } }
    end

    assert_redirected_to projet_theme_url(ProjetTheme.last)
  end

  test "should show projet_theme" do
    get projet_theme_url(@projet_theme)
    assert_response :success
  end

  test "should get edit" do
    get edit_projet_theme_url(@projet_theme)
    assert_response :success
  end

  test "should update projet_theme" do
    patch projet_theme_url(@projet_theme), params: { projet_theme: { projet_id: @projet_theme.projet_id, theme_id: @projet_theme.theme_id } }
    assert_redirected_to projet_theme_url(@projet_theme)
  end

  test "should destroy projet_theme" do
    assert_difference('ProjetTheme.count', -1) do
      delete projet_theme_url(@projet_theme)
    end

    assert_redirected_to projet_themes_url
  end
end
