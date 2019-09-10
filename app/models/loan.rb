class Loan < ActiveRecord::Base
    belongs_to :books
    belongs_to :patrons
end
