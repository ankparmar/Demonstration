class Admin::BookRequestsController < ApplicationController
  before_action :set_book_request, only: :update

  def index
    @book_requests = BookRequest.all
  end

  def update
    if params[:status] == "approve"
      @book_request.approved!
      UserMailer.with(user: @book_request.user, book_request: @book_request).approved_book_request_email.deliver_now
    elsif params[:status] == "deny"
      @book_request.denied!
      UserMailer.with(user: @book_request.user, book_request: @book_request).cancle_book_request_email.deliver_now
    end

    redirect_to admin_book_requests_path, notice: "Book request was successfully updated."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_request
      @book_request = BookRequest.find(params[:id])
    end
end
