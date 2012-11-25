require 'ecell/phonyem/tree.rb'

module ECell
  module Phonyem
    module DSL
      class Triplet
        attr :name
        attr :args
        attr :block
        def initialize(name, args, block)
          @name = name
          @args = args
          @block = block
        end
      end

      module Parser
        @@scratch = []

        def System(*args, &block)
          if args.size == 1 && args[0].is_a?(Triplet)
            @@scratch.pop
            @@scratch.push :mark
            args[0].block.call
            properties = {}
            children = []
            while (item = @@scratch.pop) != :mark
              if item.is_a?(Triplet)
                properties[item.name] = item.args
              else
                children.push(item)
              end
            end
            @@scratch.push(ECell::Phonyem::Tree::Node.new(:System, properties, children))
          else
            item = Triplet.new(:System, args, block)
            @@scratch.push(item)
            item
          end
        end

        def Variable(*args, &block)
          if args.size == 1 && args[0].is_a?(Triplet)
            @@scratch.pop
            @@scratch.push :mark
            args[0].block.call
            properties = {}
            children = []
            while (item = @@scratch.pop) != :mark
              if item.is_a?(Triplet)
                properties[item.name] = item.args
              else
                children.push(item)
              end
            end
            @@scratch.push(ECell::Phonyem::Tree::Node.new(:Variable, properties, children))
          else
            item = Triplet.new(:Variable, args, block)
            @@scratch.push(item)
            item
          end
        end

        def Process(*args, &block)
          if args.size == 1 && args[0].is_a?(Triplet)
            @@scratch.pop
            @@scratch.push :mark
            args[0].block.call
            properties = {}
            children = []
            while (item = @@scratch.pop) != :mark
              if item.is_a?(Triplet)
                properties[item.name] = item.args
              else
                children.push(item)
              end
            end
            @@scratch.push(ECell::Phonyem::Tree::Node.new(:Process, properties, children))
          else
            item = Triplet.new(:Process, args, block)
            @@scratch.push(item)
            item
          end
        end

        def Stepper(*args, &block)
          if args.size == 1 && args[0].is_a?(Triplet)
            @@scratch.pop
            @@scratch.push :mark
            args[0].block.call
            properties = {}
            children = []
            while (item = @@scratch.pop) != :mark
              if item.is_a?(Triplet)
                properties[item.name] = item.args
              else
                children.push(item)
              end
            end
            @@scratch.push(ECell::Phonyem::Tree::Node.new(:Stepper, properties, children))
          else
            item = Triplet.new(:Stepper, args, block)
            @@scratch.push(item)
            item
          end
        end
      end

      def self.parse(&block)
        DSL::Parser.class_eval { @@scratch = [] }
        prev_method_missing = Object.send(:instance_method, :method_missing)

        Object.send(:define_method, :method_missing, lambda { |name, *args, &block|
          item = Triplet.new(name, args, block)
          DSL::Parser.class_eval { @@scratch.push(item) }
          item
        })

        eval 'include ECell::Phonyem::DSL', block.binding
        block.call

        Object.send(:define_method, :method_missing, prev_method_missing)
        DSL::Parser.class_eval { @@scratch }
      end
    end
  end
end
