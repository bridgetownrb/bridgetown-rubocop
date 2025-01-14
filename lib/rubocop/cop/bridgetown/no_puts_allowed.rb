# frozen_string_literal: true

module RuboCop
  module Cop
    module Bridgetown
      class NoPutsAllowed < Base
        MSG = "Avoid using `puts` to print things. Use `Bridgetown.logger` instead."

        def_node_search :puts_called?, "(send nil? :puts _)"

        def on_send(node)
          add_offense(node) if puts_called?(node)
        end
      end
    end
  end
end
