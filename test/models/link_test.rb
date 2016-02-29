require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  def setup
    user = User.create(email_address: "John", password: "Password")
    @link = user.links.create(title: "link", url: "https://www.facebook.com/")
  end

  test "#links have the correct attributes" do
    assert @link.title
    assert @link.url
    assert @link.user_id
  end

  test "#read quality defaults to false" do
    assert_equal false, @link.read
  end
end
