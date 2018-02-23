module ApplicationHelper
    def link_to_add_field(name, f, association)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
            render(association.to_s, f: builder)
        end
        link_to(name, '#', class:'btn btn-success background-color glyphicon glyphicon-plus add_fields', data: {id: id, fields: fields.gsub("\n", "")})
    end
end
