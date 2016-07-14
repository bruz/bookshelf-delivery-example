# Require this file for feature tests
require_relative './spec_helper'

require_relative './../apps/cli'

BIN_PATH = File.join(File.dirname(__FILE__), '..', 'bin', 'bookshelf')

# Based on https://github.com/erikhuda/thor/blob/d634d240bdc0462fe677031e1dc6ed656e54f27e/spec/helper.rb#L49
def cli_command(*args)
  begin
    eval '$stdout = StringIO.new'
    eval '$stderr = StringIO.new'

    CLI.start(args)

    stdout = eval('$stdout').string
    stderr = eval('$stderr').string
  ensure
    eval('$stdout = STDOUT')
    eval('$stderr = STDERR')
  end

  [stdout, stderr]
end
