require 'salon'

class Stylist
  attr_reader( :name, :id )
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    return DBSalon.get_all_from_column("stylists")
  end

  define_singleton_method(:get_stylist_by_id) do |id|
    return DBSalon.get_specific_from_column("stylists", "id", id.to_i)
  end

  define_singleton_method(:get_all_clients) do |match|
    return DBSalon.get_all_specific_from_column("clients", "stylists", match)
  end

  define_singleton_method(:rename) do |new_name, id|
    DBSalon.update_specific_from_column("stylists", "name", new_name, "id", id.to_i)
  end

  define_singleton_method(:delete) do |id|
    DBSalon.delete_specific_from_column("stylists", "id", id)
  end

  define_singleton_method(:save_to_db) do |stylist_name|
    existing_stylist = DBSalon.get_specific_from_column("stylists", "name", stylist_name )
    if existing_stylist.name != nil
      if existing_stylist.name.length == 0
        @id = DBSalon.add_to_column( "stylists", stylist_name, "name" ).first.fetch("id").to_i
      else
        @id = existing_stylist.id.to_i
      end
      return @id
    else
      @id = DBSalon.add_to_column( "stylists", stylist_name, "name" ).first.fetch("id").to_i
      return @id
    end
  end
end
