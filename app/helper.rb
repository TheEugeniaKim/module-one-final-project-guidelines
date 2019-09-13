require_relative "models/book.rb"

class Helper

    attr_accessor :current_patron 

    def welcome_page 
        system "clear"
        print ("""
                   ##       #### ########  ########     ###    ########  ##    ##    ##     ##  #######  ##     ## ######## 
                   ##        ##  ##     ## ##     ##   ## ##   ##     ##  ##  ##     ##     ## ##     ## ###   ### ##       
                   ##        ##  ##     ## ##     ##  ##   ##  ##     ##   ####      ##     ## ##     ## #### #### ##       
                   ##        ##  ########  ########  ##     ## ########     ##       ######### ##     ## ## ### ## ######   
                   ##        ##  ##     ## ##   ##   ######### ##   ##      ##       ##     ## ##     ## ##     ## ##       
                   ##        ##  ##     ## ##    ##  ##     ## ##    ##     ##       ##     ## ##     ## ##     ## ##       
                   ######## #### ########  ##     ## ##     ## ##     ##    ##       ##     ##  #######  ##     ## ########
                   
                ***************************************************************************************************************
        """)
    end

    def start
        welcome_page
        puts ""
        puts "                                                   Welcome to the library"
        puts "                                                   Do you have an account with us? (Y/N)"
        puts "                                                   Exit (press 'q')"
        answer = gets.chomp.upcase
        system 'clear'
        if answer == "Y"
            login
        elsif answer == "N"
            create_account 
        elsif answer == "Q"
            system "clear"
            abort 
        end
    end

    def login
        system "clear"
        puts "Welcome Back"
        puts "Enter username"
        name = gets.chomp
        puts "Enter birthdate"
        birthdate = gets.chomp
        set_current_patron(name, birthdate)
        main_menu
    end

    def create_account
        system "clear"
        puts "Create Account"
        puts "Enter name: " 
        name = gets.chomp
        puts "Enter birthdate (YYYY-MM-DD): "
        birthdate = gets.chomp
        @current_patron = Patron.create(name: name, birthdate: birthdate)
        main_menu
    end

    def set_current_patron(patron_name, patron_birthdate)
        if find_patron(patron_name, patron_birthdate)
            @current_patron = find_patron(patron_name, patron_birthdate) 
        else       
            incorrect_login
        end
    end

    def incorrect_login
        system "clear"
        puts "Sorry, no account found."
        puts "Would you like to:"
        puts "   1. Try again"
        puts "   2. Exit"  
        input = gets.chomp
        if input == "1"
            login
        elsif input == "2"
            welcome_page
            start
        end
    end

    def find_patron(patron_name, patron_birthdate)
        Patron.find_by(name: patron_name, birthdate: patron_birthdate)
    end

    def main_menu 
        system 'clear'
        puts "Welcome to Main Menu"
        puts "Please select an action by typing a number"
        puts "1. View My Books on Loan"
        puts "2. Search Library Catalog"
        puts "3. Check out book"
        puts "4. Return book"
        puts "5. Logout"
        input = gets.chomp
        if input == "1"
            view_my_books
            return_to_main_menu    
        elsif input == "2"
            search_library_catalog
        elsif input == "3"
            check_out_book
        elsif input == "4"
            return_book
        elsif input == "5"
            welcome_page
            start
        end
    end

    def view_my_books
        system 'clear'
        # binding.pry
        @current_patron.loans
        my_loans = @current_patron.loans.select {|loan| loan.status == "checked out"}
        if my_loans.each do |loan|
                puts loan.book.title
                puts loan.book.author
                puts loan.book.fiction_nonfiction
                puts loan.book.genre
                puts loan.book.publication_year
                puts loan.status
                puts "*" * 20
            end
        else
            puts "You do not have any loans"
        end
    end

    def return_to_main_menu
        puts "Return to main menu? (Y/N)?"
        input = gets.chomp.upcase 
        if input == "Y"
            main_menu
        elsif input == "N"
            # add logout method
            welcome_page
            start
        end
    end

    def search_library_catalog
        system 'clear'
        puts "Please select how you would like to search by inputting a number: "
        puts "1. Search by title"
        puts "2. Search by author"
        puts "3. Search by genre"
        search_selection = gets.chomp

        if search_selection == "1"
            search_by_title
        elsif search_selection == "2"
            search_by_author
        elsif search_selection == "3"
            search_by_genre
        end
    end

    def search_by_title
        puts "Enter title you want to search: "
            title_search = gets.chomp
            searched_book = Book.find_by(title: title_search)
            if searched_book 
                puts "Title: #{searched_book.title}"
                puts "Author: #{searched_book.author}"
                puts "*" * 20
                search_again
            else 
                puts "Sorry, book not found."
                search_again
            end
    end

    def search_by_author
        puts "Enter author you want to search: "
        author_search = gets.chomp 
        results = Book.find_all_books_by_author(author_search)
        if results
            results.each do |book|
                puts book.title
                puts book.author
                puts book.fiction_nonfiction
                puts book.genre
                puts book.publication_year
                puts "*" * 25
            end
            puts "*" * 20
            search_again
        else 
            puts "Sorry, book not found."
            search_again
        end
    end

    def search_by_genre
        puts "Enter genre you want to search: "
        genre_search = gets.chomp 
        results = Book.find_all_books_by_genre(genre_search)
        if results
            results.each do |book|
                puts book.title
                puts book.author
                puts book.fiction_nonfiction
                puts book.genre
                puts book.publication_year
                puts "*" * 25
            end
            puts "*" * 20
            search_again
        else 
            puts "Sorry, book not found."
            search_again
        end
    end

    def search_again
        puts "Search again? (Y/N)"
        answer = gets.chomp.upcase
        if answer == "Y"
            search_library_catalog
        elsif answer == "N"
            return_to_main_menu
        end
    end

    def check_out_book
        system 'clear'
        puts "Please enter the title of the book you'd like to check out: "
        input = gets.chomp
        book_to_loan = Book.find_by(title: input)

        if book_to_loan
            @current_patron.books << book_to_loan
            puts "Book checked out."
            return_to_main_menu
        else 
            puts "Sorry, book not found."
            puts "Try again? (Y/N)"
            answer = gets.chomp.upcase
            if answer == "Y"
                check_out_book
            elsif answer == "N"
                return_to_main_menu
            end
        end
    end
    
    def return_book
        puts "These are your checked out books: "
        view_my_books
        puts "Please write the title of the book you'd like to return"
        book_title = gets.chomp 
        if Book.find_all_books_by_title(book_title)
            found_book = Book.find_all_books_by_title(book_title)
            loan = Loan.find_by(patron_id: @current_patron.id, book_id: found_book.id, status: "checked out")
            loan.update(status: "available")
            # loan.reload
            @current_patron.loans.reset
            # binding.pry     
            puts "Your book has been returned"
            puts "Would you like to return to the main menu? (Y/N)"
            input = gets.chomp.upcase
            if input == "Y"
                main_menu
            else
                welcome_page
            end
        else
            puts "Book title entered incorrectly please try again"
            return_book
        end
    end

end