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
      data = extract_ansi_data(arg)
      original_fg_color = System::Console.ForegroundColor
      System::Console.ForegroundColor = data[:foreground]
      original_puts(data[:text])
      System::Console.ForegroundColor = original_fg_color
    end
    nil
  end
  
  private
  def extract_ansi_data(arg)
    matches = ANSI_REGEXP.match(arg)
    color_code = matches[1]
    case color_code.to_i
    when 30
      fg_color = System::ConsoleColor.Black
    when 31 
      fg_color = System::ConsoleColor.DarkRed
    when 32
      fg_color = System::ConsoleColor.DarkGreen
  	when 33
  		fg_color = System::ConsoleColor.DarkYellow
		when 34
			fg_color = System::ConsoleColor.DarkBlue
		when 35
			fg_color = System::ConsoleColor.DarkMagenta
		when 36
		  fg_color = System::ConsoleColor.DarkCyan
	  when 37
	    fg_color = System::ConsoleColor.Gray
    end
    
    { 
      :foreground => fg_color, 
      :text => matches[2]  
    }
  end
end