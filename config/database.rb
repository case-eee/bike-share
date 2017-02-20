
  # set the database based on the current environment
  database_name = "postgresql-deep-63648"
  db = URI.parse("postgres://yvtuqxnktvqeyw:7dc27b5b24fcc5d929df8e811cb5493828308c4c8ed2c54da9a78df86b4ae8c2@ec2-23-21-224-106.compute-1.amazonaws.com:5432/d6k1mjdukb042q")

  # connect ActiveRecord with the current database
  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :port     => db.port,
    :username => db.user,
    :password => db.password,
    :database => "d6k1mjdukb042q",
    :encoding => 'utf8'
  )
