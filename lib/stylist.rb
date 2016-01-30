require './lib/salon'

class Stylist
  attr_reader( :name, :id )
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    return Salon.get_all_from_column("stylists")
  end

  define_singleton_method(:get_stylist_by_id) do |id|
    return Salon.get_specific_from_column("stylists", "id", id.to_i)
  end

  define_singleton_method(:get_all_clients) do |match|
    return Salon.get_all_specific_from_column("clients", "stylist_id", match)
  end

  define_singleton_method(:rename) do |new_name, id|
    Salon.update_specific_from_column("stylists", "name", new_name, "id", id.to_i)
  end

  define_singleton_method(:delete) do |id|
    Salon.delete_specific_from_column("stylists", "id", id)
  end

  define_singleton_method(:save_to_db) do |stylist_name|
    existing_stylist = Salon.get_specific_from_column("stylists", "name", stylist_name )
    if existing_stylist.name != nil
      if existing_stylist.name.length == 0
        @id = Salon.add_to_column( "stylists", stylist_name, "name" ).first.fetch("id").to_i
      else
        @id = existing_stylist.id.to_i
      end
      return @id
    else
      @id = Salon.add_to_column( "stylists", stylist_name, "name" ).first.fetch("id").to_i
      return @id
    end
  end
end
