require "test_helper"

class UserCanLoginTest < ActionDispatch::IntegrationTest
  test "unauthorized user is directed to login on visit to root" do
    user = User.create(email_address: "John", password: "Password")

    visit root_path

    assert_equal root_path, current_path
  end

  test "logged in user is directed to their show page on visit to root" do
    user = User.create(email_address: "John", password: "Password")
    login_user

    visit root_path

    assert_equal links_path, current_path
  end

  test "user can login" do

    user = User.create(email_address: "John", password: "Password")

    visit root_path

    fill_in "Email address", with: "John"
    fill_in "Password", with: "Password"

    click_button "Login"

    assert page.has_content? "Logout"
    assert_equal links_path, current_path
  end

  test 'user cannot login with incorrect information' do
    User.create(email_address: "John", password: "Password")

    visit root_path

    fill_in "Email address", with: "Amber"
    fill_in "Password", with: "Password"

    click_button "Login"
    assert page.has_content?("Invalid Login.")
  end
end
