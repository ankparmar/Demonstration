require "application_system_test_case"

class BookRequestsTest < ApplicationSystemTestCase
  setup do
    @book_request = book_requests(:one)
  end

  test "visiting the index" do
    visit book_requests_url
    assert_selector "h1", text: "Book requests"
  end

  test "should create book request" do
    visit book_requests_url
    click_on "New book request"

    click_on "Create Book request"

    assert_text "Book request was successfully created"
    click_on "Back"
  end

  test "should update Book request" do
    visit book_request_url(@book_request)
    click_on "Edit this book request", match: :first

    click_on "Update Book request"

    assert_text "Book request was successfully updated"
    click_on "Back"
  end

  test "should destroy Book request" do
    visit book_request_url(@book_request)
    click_on "Destroy this book request", match: :first

    assert_text "Book request was successfully destroyed"
  end
end
