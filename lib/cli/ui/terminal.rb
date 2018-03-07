require 'cli/ui'
require 'io/console'

module CLI
  module UI
    module Terminal
      # Returns the width of the terminal, if possible
      # Otherwise will return 80
      #
      def self.width
        if console = IO.respond_to?(:console) && IO.console
          width = console.winsize[1]
          width.zero? ? 80 : width
        else
          80
        end
      rescue Errno::EIO
        80
      end
    end
  end
end
