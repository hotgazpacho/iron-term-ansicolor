require 'term/ansicolor'
require 'mscorlib'

ANSI_REGEXP = /\e\[(.+?)m(.+?)(?=(\e\[0m|\z))/

class String
  include Term::ANSIColor
end

module Kernel
  alias_method :original_puts, :puts
  
  def puts(*args)
    args.each do |arg|
      originalColor = System::Console.ForegroundColor
      matches = ANSI_REGEXP.match(arg)
      color_code = matches[1]
      case color_code.to_i
      when 30
        System::Console.ForegroundColor = System::ConsoleColor.Black
      when 31 
        System::Console.ForegroundColor = System::ConsoleColor.Red
      when 32
        System::Console.ForegroundColor = System::ConsoleColor.Green
      end
      original_puts(matches[2])
      System::Console.ForegroundColor = originalColor
    end
    nil
  end
end