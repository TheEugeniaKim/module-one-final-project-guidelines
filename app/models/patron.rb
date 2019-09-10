class Patron < ActiveRecord::Base
    has_many :loans
    has_many :books, through: :loans
end