module ApplicationHelper

  def sign_in_or_out_link
    if signed_in?
      link_to 'Sign Out', destroy_user_session_path, method: :delete, class: 'nav-link'
    else
      link_to 'Sign In', new_user_session_path, class: 'nav-link'
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end    

end
