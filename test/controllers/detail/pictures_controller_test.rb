require 'test_helper'

class RailsDetail::PicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rails_detail_picture = rails_detail_pictures(:one)
  end

  test "should get index" do
    get rails_detail_pictures_url
    assert_response :success
  end

  test "should get new" do
    get new_rails_detail_picture_url
    assert_response :success
  end

  test "should create rails_detail_picture" do
    assert_difference('Picture.count') do
      post rails_detail_pictures_url, params: { rails_detail_picture: {  } }
    end

    assert_redirected_to rails_detail_picture_url(Picture.last)
  end

  test "should show rails_detail_picture" do
    get rails_detail_picture_url(@rails_detail_picture)
    assert_response :success
  end

  test "should get edit" do
    get edit_rails_detail_picture_url(@rails_detail_picture)
    assert_response :success
  end

  test "should update rails_detail_picture" do
    patch rails_detail_picture_url(@rails_detail_picture), params: { rails_detail_picture: {  } }
    assert_redirected_to rails_detail_picture_url(@rails_detail_picture)
  end

  test "should destroy rails_detail_picture" do
    assert_difference('Picture.count', -1) do
      delete rails_detail_picture_url(@rails_detail_picture)
    end

    assert_redirected_to rails_detail_pictures_url
  end
end
