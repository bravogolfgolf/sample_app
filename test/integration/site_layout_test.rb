require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:example_user1)
  end

  test 'layout links for user not logged in' do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', login_path
    assert_select 'a[href=?]', signup_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
  end

  test 'layout links for user logged in' do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', users_path
    assert_select 'a[href=?]', user_path(@user)
    assert_select 'a[href=?]', edit_user_path(@user)
    assert_select 'a[href=?]', logout_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
  end
end
