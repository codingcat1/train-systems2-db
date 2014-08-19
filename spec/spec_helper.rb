require 'pg'
require 'line'
require 'station'
require 'stop'
require 'pry'


DB = PG.connect ({:dbname => "test_train_system"})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM lines *;")
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM stops *;")
  end
end
