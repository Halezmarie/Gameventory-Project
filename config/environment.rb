ENV['SINATRA_ENV'] ||= "development"
require 'bundler/setup'

Bundler.require(:default,ENV['SINATRA_ENV'])

configure :development do
    set :database, 'sqlite3:db/database.db'
end

#or 

ActiveRecord::Base.establish_connection(
:adapter => "sqlite3",
:database => "db/database.db"
)

require './app/controllers/application_controller'
require_all 'app'
