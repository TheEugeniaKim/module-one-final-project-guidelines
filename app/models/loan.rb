class Loan < ActiveRecord::Base
    belongs_to :book
    belongs_to :patron


    def self.find_by_patronid_and_bookid(patronid, bookid)
        Loan.all.find_by(patron_id: patronid, book_id: bookid)
    end

    def self.select_loans_by_checked_out_status

    end


   # user = user from user input
# book_title = from user input = "What book do you want to return?", selects from a list
# book = Book.find_by(name: book_title)
# loan = Loan.find_by(user: user, book: book)
# loan.update(status: 'returned')
# <#Date> + 3.weeks
end
