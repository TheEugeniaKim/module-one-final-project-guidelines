class Loan < ActiveRecord::Base
    belongs_to :book
    belongs_to :patron
end
