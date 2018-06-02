require 'test_helper'

class UsersHelperTest < ActionView::TestCase
  def setup
    @user = User.new(name: 'Example User',
                     email: 'user@example.com',
                     password: 'password',
                     password_digest: 'password')
  end

  test 'creates link for Gravatar of the given user' do
    BASE_URL = 'https://secure.gravatar.com/avatar/'.freeze
    GRAVATER_ID = Digest::MD5.hexdigest(@user.email.downcase).freeze
    DEFAULT_SIZE = 80
    ASSIGNED_SIZE = 50
    LINK = "<img alt=\"#{@user.name}\" class=\"gravatar\" src=\"#{BASE_URL}#{GRAVATER_ID}".freeze
    DEFAULT_LINK = "#{LINK}?s=#{DEFAULT_SIZE}\" />".freeze
    ASSIGNED_LINK = "#{LINK}?s=#{ASSIGNED_SIZE}\" />".freeze
    assert_equal DEFAULT_LINK, gravatar_for(@user)
    assert_equal ASSIGNED_LINK, gravatar_for(@user, size: ASSIGNED_SIZE)
  end
end
