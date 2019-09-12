class Book < ActiveRecord::Base
    has_many :loans
    has_many :patrons, through: :loans

    def self.find_all_books_by_author(author_search)
        binding.pry
        Book.all.select {|book| book.author == author_search}
    end

    def self.find_all_books_by_genre(genre_search)
        Book.all.select {|book| book.genre == genre_search}
    end

end