require './lib/salon'

class Client
  attr_reader( :name, :stylist, :id )
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist = attributes.fetch(:stylist)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:get_client_by_id) do |id|
    return DBSalon.get_specific_from_column("clients", "id", id.to_i)
  end

  define_singleton_method(:get_clients_with_no_stylist) do
    return DBSalon.get_all_specific_from_column( "clients", "stylist", '' )
  end

  define_singleton_method(:change_stylist) do |stylist_id, id|
    DBSalon.update_specific_from_column("clients", "stylists", stylist_id, "id", id.to_i)
  end

  define_singleton_method(:rename) do |new_name, id|
    DBSalon.update_specific_from_column("clients", "name", new_name, "id", id.to_i)
  end

  define_singleton_method(:delete) do |id|
    DBSalon.delete_specific_from_column("clients", "id", id)
  end

  define_singleton_method(:save_to_db) do |client_name, stylist_name|
    @id = DBSalon.add_two_to_column( "clients", client_name, stylist_name, "name", "stylists" )
    return @id
  end
end
