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
      
      fg_color = System::Console.ForegroundColor
      bg_color = System::Console.BackgroundColor
      
      data = extract_ansi_data(arg)
      
      System::Console.ForegroundColor = data[:foreground] || fg_color
      System::Console.BackgroundColor = data[:background] || bg_color
      original_puts(data[:text])
      System::Console.BackgroundColor = bg_color
      System::Console.ForegroundColor = fg_color
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
    when 40
      bg_color = System::ConsoleColor.Black
    when 41
      bg_color = System::ConsoleColor.DarkRed
    when 42
      bg_color = System::ConsoleColor.DarkGreen
    when 43
      bg_color = System::ConsoleColor.DarkYellow
    when 44
      bg_color = System::ConsoleColor.DarkBlue
    when 45
      bg_color = System::ConsoleColor.DarkMagenta
    when 46
      bg_color = System::ConsoleColor.DarkCyan
    when 47
      bg_color = System::ConsoleColor.Gray
    else
      fg_color = System::Console.ForegroundColor
      bg_color = System::Console.BackgroundColor
    end
    
    { 
      :foreground => fg_color,
      :background => bg_color,
      :text => matches[2]  
    }
  end
end