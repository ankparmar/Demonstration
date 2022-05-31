class BookRequestsController < ApplicationController
  before_action :set_book_request, only: :destroy

  def index
    @book_requests = current_user.book_requests

    if params[:status].present?
      @book_requests = @book_requests.where(status: params[:status])
    end
  end

  def create
    @book_request = BookRequest.new(book_request_params.merge(user_id: current_user.id))

    if @book_request.save
      UserMailer.with(user: current_user,book_request: @book_request  ).new_book_request_email.deliver_now

      redirect_to book_requests_path, notice: "Book request was successfully created."
    else
      redirect_to book_requests_path, alert: @book_request.errors.full_messages.first
    end
  end

  def destroy
    @book_request.destroy

    UserMailer.with(user: current_user,book_request: @book_request).cancle_book_request_email.deliver_now 

    redirect_to book_requests_path, notice: "Book request was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_request
      @book_request = BookRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_request_params
      params.require(:book_request).permit(:book_id)
    end
end
