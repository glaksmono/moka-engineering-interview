ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  def login(user)
    session[:user_id] = user.id
  end

  teardown do
    (ActiveRecord::Base.connection.tables - %w{schema_migrations}).each do |table_name|
      ActiveRecord::Base.connection.execute "TRUNCATE TABLE #{table_name};"
    end
  end
end
