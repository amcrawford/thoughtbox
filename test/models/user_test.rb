require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email_address: "John", password: "Password")
  end

  test "#users have the correct attributes" do
    assert @user.email_address
    assert @user.password_digest
  end
end
