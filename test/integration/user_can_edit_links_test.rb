require "test_helper"

class AddLinksTest < ActionDispatch::IntegrationTest
  test "user can edit link" do
    user = User.create(email_address: "John", password: "Password")
    link = user.links.create(title: "link", url: "https://www.facebook.com/")
    login_user

    visit links_path

    within "#link-#{link.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: "EditedName"
    click_button "Update Link"

    assert_equal links_path, current_path
    assert page.has_content? "EditedName"
  end

  test "edited link must still have valid url" do
    user = User.create(email_address: "John", password: "Password")
    link = user.links.create(title: "link", url: "https://www.facebook.com/")
    login_user

    visit links_path

    within "#link-#{link.id}" do
      click_link "Edit"
    end

    fill_in "Url", with: "link!"
    click_button "Update Link"

    refute links_path == current_path
    assert page.has_content? "A link must have a name and url"
  end
end
