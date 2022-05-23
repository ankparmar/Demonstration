class UserMailer < ApplicationMailer
    def new_book_request_email
        @user = params[:user]
        @book_request= params[:book_request]
        # @book_request
        # @admin=params[:book_request]
    
        mail(to: @user.email , subject: "You got a new book issue request !")
       
      end
end
