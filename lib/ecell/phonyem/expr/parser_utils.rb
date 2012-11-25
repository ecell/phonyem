module ECell
  module Phonyem
    module Expr
      module ExpressionProcessScript
        module Utils
          def self.find_ast_node_in_cst(n)
            n = n.elements[0] until n.respond_to?(:ast_node)
            return n.ast_node
          end
        end
      end
    end
  end
end
