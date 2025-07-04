require "test_helper"

class videosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @video = videos(:one)
  end

  test "should get index" do
    get videos_url
    assert_response :success
  end

  test "should get new" do
    get new_video_url
    assert_response :success
  end

  test "should create video" do
    assert_difference("video.count") do
      video videos_url, params: { video: { body: @video.body, youtube_url: @video.youtube_url } }
    end

    assert_redirected_to video_url(video.last)
  end

  test "should show video" do
    get video_url(@video)
    assert_response :success
  end

  test "should get edit" do
    get edit_video_url(@video)
    assert_response :success
  end

  test "should update video" do
    patch video_url(@video), params: { video: { body: @video.body, youtube_url: @video.youtube_url } }
    assert_redirected_to video_url(@video)
  end

  test "should destroy video" do
    assert_difference("video.count", -1) do
      delete video_url(@video)
    end

    assert_redirected_to videos_url
  end
end
