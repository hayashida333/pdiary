require "application_system_test_case"

class videosTest < ApplicationSystemTestCase
  setup do
    @video = videos(:one)
  end

  test "visiting the index" do
    visit videos_url
    assert_selector "h1", text: "videos"
  end

  test "should create video" do
    visit videos_url
    click_on "New video"

    fill_in "Body", with: @video.body
    fill_in "Youtube url", with: @video.youtube_url
    click_on "Create video"

    assert_text "video was successfully created"
    click_on "Back"
  end

  test "should update video" do
    visit video_url(@video)
    click_on "Edit this video", match: :first

    fill_in "Body", with: @video.body
    fill_in "Youtube url", with: @video.youtube_url
    click_on "Update video"

    assert_text "video was successfully updated"
    click_on "Back"
  end

  test "should destroy video" do
    visit video_url(@video)
    click_on "Destroy this video", match: :first

    assert_text "video was successfully destroyed"
  end
end
