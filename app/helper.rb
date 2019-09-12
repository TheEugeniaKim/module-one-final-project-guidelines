require_relative "models/book.rb"

class Helper

    #test commit to future branch

    attr_accessor :current_patron 

    def start
        puts "Welcome to the library"
        puts "Do you have an account with us? (Y/N)"
        answer = gets.chomp
        if answer == "Y"
            puts "Welcome Back"
            login
        elsif answer == "N"
            create_account 
        end
    end

    def create_account
        puts "Create Account"
        puts "Enter name: " 
        name = gets.chomp
        puts "Enter birthdate (YYYY-DD-MM): "
        birthdate = gets.chomp
        @current_patron = Patron.create(name: name, birthdate: birthdate)
        main_menu
    end

    def find_patron(patron_name, patron_birthdate)
        Patron.find_by(name: patron_name, birthdate: patron_birthdate)
    end

    def login
        puts "Enter username"
        name = gets.chomp
        puts "Enter birthdate"
        birthdate = gets.chomp
        @current_patron = find_patron(name, birthdate) 
        main_menu
    end

    def main_menu 
        puts "Welcome to Main Menu"
        puts "Please select an action by typing a number"
        puts "1. View My Books on Loan"
        puts "2. Search Library Catalog"
        puts "3. Check out book"
        puts "4. Logout"
        input = gets.chomp
        if input == "1"
            view_my_books    
        elsif input == "2"
            search_library_catalog
        elsif input == "3"
            check_out_book
        end
    end

    def view_my_books
        my_books = @current_patron.books
        my_books.each do |book|
            puts book.title
            puts book.author
            puts book.fiction_nonfiction
            puts book.genre
            puts book.publication_year
            puts "*" * 20
        end
        return_to_main_menu
    end

    def return_to_main_menu
        puts "Return to main menu? (Y/N)?"
        input = gets.chomp.upcase
        if input == "Y"
            main_menu
        end
    end

    def search_library_catalog
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
end