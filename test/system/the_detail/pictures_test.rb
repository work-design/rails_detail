require "application_system_test_case"

class PicturesTest < ApplicationSystemTestCase
  setup do
    @rails_detail_picture = rails_detail_pictures(:one)
  end

  test "visiting the index" do
    visit rails_detail_pictures_url
    assert_selector "h1", text: "Pictures"
  end

  test "creating a Picture" do
    visit rails_detail_pictures_url
    click_on "New Picture"

    click_on "Create Picture"

    assert_text "Picture was successfully created"
    click_on "Back"
  end

  test "updating a Picture" do
    visit rails_detail_pictures_url
    click_on "Edit", match: :first

    click_on "Update Picture"

    assert_text "Picture was successfully updated"
    click_on "Back"
  end

  test "destroying a Picture" do
    visit rails_detail_pictures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Picture was successfully destroyed"
  end
end
