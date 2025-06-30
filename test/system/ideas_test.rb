require "application_system_test_case"

class postsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "posts"
  end

  test "should create post" do
    visit posts_url
    click_on "New post"

    fill_in "Description", with: @post.description
    fill_in "Picture", with: @post.picture
    fill_in "Published at", with: @post.published_at
    fill_in "Title", with: @post.title
    click_on "Create post"

    assert_text "post was successfully created"
    click_on "Back"
  end

  test "should update post" do
    visit post_url(@post)
    click_on "Edit this post", match: :first

    fill_in "Description", with: @post.description
    fill_in "Picture", with: @post.picture
    fill_in "Published at", with: @post.published_at
    fill_in "Title", with: @post.title
    click_on "Update post"

    assert_text "post was successfully updated"
    click_on "Back"
  end

  test "should destroy post" do
    visit post_url(@post)
    click_on "Destroy this post", match: :first

    assert_text "post was successfully destroyed"
  end
end
