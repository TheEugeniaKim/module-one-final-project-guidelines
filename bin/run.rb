require_relative '../config/environment'
require 'pry'

Book.destroy_all
require_relative '../app/helper.rb'
require_relative '../db/seed.rb'



helper = Helper.new
helper.start