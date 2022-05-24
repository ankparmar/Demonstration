class UserMailer < ApplicationMailer
    def new_book_request_email
        @user = params[:user]
        @book_request= params[:book_request]
        mail(to: @user.email , subject: "You got a new book issue request !")
    end

    def approved_book_request_email
        @user = params[:user]
        @book_request= params[:book_request]
        mail(to: @user.email , subject: "You Book Request get approved!")  
    end

    def cancle_book_request_email
        @user = params[:user]
        @book_request= params[:book_request]
        mail(to: @user.email , subject: "Book Request get cancled")  

    end
end
