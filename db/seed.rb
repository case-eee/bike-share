  def self.up

    create_table :stations do |u|
      u.name
      u.created_at
    end
