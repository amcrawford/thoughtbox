require 'test_helper'

class Api::V1::LinksControllerTest < ActionController::TestCase

  test '#show responds to json' do
    get :show, format: :json, id: Link.first.id
    assert_response :success
  end

  test '#show returns one record' do
    get :show, format: :json, id: Link.first.id
    assert_kind_of Hash, json_response
  end

  test "#show returns the correct link" do
    link = Link.first
    get :show, format: :json, id: link.id
    assert_equal link.id, json_response[:id]
    assert_equal link.title, json_response[:title]
    assert_equal link.url, json_response[:url]
  end

  test "#update responds to json" do
    put :update, format: :json, id: Link.first.id, link: {title: "NewTitle"}
    assert_response :success
  end

end
