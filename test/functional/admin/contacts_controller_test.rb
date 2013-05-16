require 'test_helper'

class Admin::ContactsControllerTest < ActionController::TestCase
  setup do
    @admin_contact = admin_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_contact" do
    assert_difference('Admin::Contact.count') do
      post :create, admin_contact: { aboutus: @admin_contact.aboutus, email1: @admin_contact.email1, email2: @admin_contact.email2, name: @admin_contact.name, phone1: @admin_contact.phone1, phone2: @admin_contact.phone2, skype: @admin_contact.skype, url1: @admin_contact.url1, url2: @admin_contact.url2, url3: @admin_contact.url3 }
    end

    assert_redirected_to admin_contact_path(assigns(:admin_contact))
  end

  test "should show admin_contact" do
    get :show, id: @admin_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_contact
    assert_response :success
  end

  test "should update admin_contact" do
    put :update, id: @admin_contact, admin_contact: { aboutus: @admin_contact.aboutus, email1: @admin_contact.email1, email2: @admin_contact.email2, name: @admin_contact.name, phone1: @admin_contact.phone1, phone2: @admin_contact.phone2, skype: @admin_contact.skype, url1: @admin_contact.url1, url2: @admin_contact.url2, url3: @admin_contact.url3 }
    assert_redirected_to admin_contact_path(assigns(:admin_contact))
  end

  test "should destroy admin_contact" do
    assert_difference('Admin::Contact.count', -1) do
      delete :destroy, id: @admin_contact
    end

    assert_redirected_to admin_contacts_path
  end
end
