require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'provide default title if more specific not provided' do
    @title = 'Provide Title'
    assert_equal 'Ruby on Rails Tutorial Sample App', full_title
    assert_equal "#{@title} | Ruby on Rails Tutorial Sample App",
                 full_title(@title)
  end
end
