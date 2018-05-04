require 'test_helper'

class TheDetail::PicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @the_detail_picture = the_detail_pictures(:one)
  end

  test "should get index" do
    get the_detail_pictures_url
    assert_response :success
  end

  test "should get new" do
    get new_the_detail_picture_url
    assert_response :success
  end

  test "should create the_detail_picture" do
    assert_difference('Picture.count') do
      post the_detail_pictures_url, params: { the_detail_picture: {  } }
    end

    assert_redirected_to the_detail_picture_url(Picture.last)
  end

  test "should show the_detail_picture" do
    get the_detail_picture_url(@the_detail_picture)
    assert_response :success
  end

  test "should get edit" do
    get edit_the_detail_picture_url(@the_detail_picture)
    assert_response :success
  end

  test "should update the_detail_picture" do
    patch the_detail_picture_url(@the_detail_picture), params: { the_detail_picture: {  } }
    assert_redirected_to the_detail_picture_url(@the_detail_picture)
  end

  test "should destroy the_detail_picture" do
    assert_difference('Picture.count', -1) do
      delete the_detail_picture_url(@the_detail_picture)
    end

    assert_redirected_to the_detail_pictures_url
  end
end
