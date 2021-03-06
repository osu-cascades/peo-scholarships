module ApplicationsHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    link_to(name, '#', class: 'add_fields btn btn-primary', data: {id: id, fields: fields.gsub("\n", "")})
  end
  #TODO implement new helper for experiences, instead of association, passs in the kind of enum

  def link_to_add_experiences(name, f, association, kind)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(kind.to_s.singularize + '_fields', f: builder)
    end
    link_to(name, '#', class: 'add_fields btn btn-primary', data: {id: id, fields: fields.gsub("\n", "")})    
  end
end
