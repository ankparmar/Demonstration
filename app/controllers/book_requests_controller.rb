class BookRequestsController < ApplicationController
  load_and_authorize_resource
  before_action :set_book_request, only: %i[ edit update destroy ]

  # GET /book_requests or /book_requests.json
  def index
    @book_requests = BookRequest.all
  end

  # GET /book_requests/1 or /book_requests/1.json
  def show
    # byebug
    @book_requests =BookRequest.where(user_id:current_user.id )
    # byebug
  end

  # GET /book_requests/new
  def new
    @book_request = BookRequest.new
  end

  # GET /book_requests/1/edit
  def edit
  end

  # POST /book_requests or /book_requests.json
  def create
    if current_user.admin?
      flash[:alert] = "User not found."
    else
      @book_request = BookRequest.new(book_request_params)

      respond_to do |format|
        if @book_request.save
          @user=current_user
          @admin=User.where(user_type:"admin")
          UserMailer.with(user: @user,book_request: @book_request ,admin: @admin ).new_book_request_email.deliver_now 
          format.html { redirect_to book_request_url(@book_request), notice: "Book request was successfully created." }
          format.json { render :show, status: :created, location: @book_request }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @book_request.errors, status: :unprocessable_entity }
        end
      end 
    end

  end

  # PATCH/PUT /book_requests/1 or /book_requests/1.json
  def update
    respond_to do |format|
      if @book_request.update(book_request_params)
        format.html { redirect_to book_request_url(@book_request), notice: "Book request was successfully updated." }
        format.json { render :show, status: :ok, location: @book_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_requests/1 or /book_requests/1.json
  def destroy
    @book_request.destroy

    respond_to do |format|
      format.html { redirect_to books_path, notice: "Book request was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def approve
    @book_request = BookRequest.find(params[:id])
    if @book_request.approved?
      @book_request.update_attribute(:approved, false)
    else
      @book_request.update_attribute(:approved, true)
    end
    redirect_to book_requests_path


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_request
      @book_request = BookRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_request_params
      #  params.fetch(:book_request, {})
      # params.require(:user_id, :book_id, :issue_date)
      # byebug
      params.require(:book_request).permit(:user_id, :book_id, :request_date)

    end
end
