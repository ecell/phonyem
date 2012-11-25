module ECell
  module Phonyem
    module Tree
      class Node
        attr :name
        attr :properties
        attr :children
        def initialize(name, properties = {}, children = [])
          @name = name
          @properties = properties
          @children = children
        end
      end
    end
  end
end
