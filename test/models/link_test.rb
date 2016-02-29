require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  def setup
    user = User.create(email_address: "John", password: "Password")
    @link = user.links.create(title: "link", url: "https://www.facebook.com/")
  end

  test "#ideas have a title body and quality" do
    assert @link.title
    assert @link.url
    assert @link.user_id
  end

  test "#read quality defaults to false" do
    assert_equal false, @link.read
  end
end
