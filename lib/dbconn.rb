require 'mysql2'
# This is class Connection
class Connection
  @@client = Mysql2::Client.new(host: 'localhost', username: 'root',
                                password: 'root', database: 'rubyshopapp')
  def self.conn
    @@client
  end
end
