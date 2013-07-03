# class PostFilter < WillFilter::Filter
#   def model_class
#     Post
#   end

#   def definition
#     defs = super  
#     defs[:published][:is] = :list
#     defs[:published][:is_not] = :list
#     defs
#   end

#   def value_options_for(condition_key)
#     if condition_key == :published
#       return ["true", "false"]
#     end
#     return []
#   end
# end
