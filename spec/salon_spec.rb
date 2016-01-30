require 'rspec'
require 'client'
require 'stylist'
require 'pg'
require 'pry'

DB_TEST_SALON = PG.connect( {:dbname => 'salon_test'} )

RSpec.configure do |config|
  config.after(:each) do
    config.after(:each) do
      DBSALON.exec("DELETE FROM stylists *;")
      DBSALON.exec("DELETE FROM clients *;")
    end
  end
end

describe Stylist do
  describe "#new" do
    it 'creates a new stylist, with name' do
      new_stylist = Stylist.new( {name: "Cindy", id: 0} )
      expect(new_stylist.name).to(eq("Cindy"))
    end
    it 'creates a new stylist, with id of Fixnum' do
      new_stylist = Stylist.new( {name: "edward", id: 1} )
      expect(new_stylist.id).to(be_instance_of(Fixnum))
    end
    it 'adds stylist to the db' do
      new_stylist = Stylist.new( {name: "edward", id: nil } )
      DB_TEST_SALON.exec("INSERT INTO stylists (name) VALUES ('#{new_stylist.name}');")
      found = DB_TEST_SALON.exec("SELECT * FROM stylists;")
      result_list = []
      found.each do |stylist|
        result_list.push( Stylist.new( {name: stylist.fetch("name"), id: stylist.fetch("id")} ) )
      end
      expect(result_list[0].name).to(eq(new_stylist.name))
    end
  end
end

describe Client do
  describe "#new" do
    it 'creates a new stylist, with name' do
      new_client = Client.new( {name: "Matt", stylist_id: -1, id: 0} )
      expect(new_client.name).to(eq("Matt"))
    end
    it 'creates a new stylist, with id of Fixnum' do
      new_client = Client.new( {name: "Matt", stylist_id: -1, id: 1} )
      expect(new_client.id).to(be_instance_of(Fixnum))
    end
    it 'adds client to the db' do
      new_client = Client.new( {name: "kyle", stylist_id: -1, id: nil } )
      DB_TEST_SALON.exec("INSERT INTO clients (name) VALUES ('#{new_client.name}');")
      found = DB_TEST_SALON.exec("SELECT * FROM clients;")
      result_list = []
      found.each do |client|
        result_list.push( Client.new( {name: client.fetch("name"), stylist_id: -1, id: client.fetch("id")} ) )
      end
      expect(result_list[0].name).to(eq(new_client.name))
    end
  end
end
