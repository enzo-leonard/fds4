require 'test_helper'

class ProjetFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @projet_form = projet_forms(:one)
  end

  test "should get index" do
    get projet_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_projet_form_url
    assert_response :success
  end

  test "should create projet_form" do
    assert_difference('ProjetForm.count') do
      post projet_forms_url, params: { projet_form: { form_id: @projet_form.form_id, projet_id: @projet_form.projet_id } }
    end

    assert_redirected_to projet_form_url(ProjetForm.last)
  end

  test "should show projet_form" do
    get projet_form_url(@projet_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_projet_form_url(@projet_form)
    assert_response :success
  end

  test "should update projet_form" do
    patch projet_form_url(@projet_form), params: { projet_form: { form_id: @projet_form.form_id, projet_id: @projet_form.projet_id } }
    assert_redirected_to projet_form_url(@projet_form)
  end

  test "should destroy projet_form" do
    assert_difference('ProjetForm.count', -1) do
      delete projet_form_url(@projet_form)
    end

    assert_redirected_to projet_forms_url
  end
end
