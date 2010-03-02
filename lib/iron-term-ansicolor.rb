require 'mscorlib'
require 'term/ansicolor'

class String
  include Term::ANSIColor
end

module IronTermAnsiColor
  include System
  module Version
    MAJOR=0
    MINOR=0
    PATCH=3
    STRING="#{MAJOR}.#{MINOR}.#{PATCH}"
  end
  
  ANSI_REGEXP = /\e\[([1349][0-7][0-7]?|[01])m/
  
  FGCOLORS = {
    30 => ConsoleColor.black,
    31 => ConsoleColor.dark_red,
    32 => ConsoleColor.dark_green,
    33 => ConsoleColor.dark_yellow,
    34 => ConsoleColor.dark_blue,
    35 => ConsoleColor.dark_magenta,
    36 => ConsoleColor.dark_cyan,
    37 => ConsoleColor.gray,
    90 => ConsoleColor.dark_gray,
    91 => ConsoleColor.red,
    92 => ConsoleColor.green,
    93 => ConsoleColor.yellow,
    94 => ConsoleColor.blue,
    95 => ConsoleColor.magenta,
    96 => ConsoleColor.cyan,
    97 => ConsoleColor.white
  }
  
  BGCOLORS = {
    40 => ConsoleColor.black,
    41 => ConsoleColor.dark_red,
    42 => ConsoleColor.dark_green,
    43 => ConsoleColor.dark_yellow,
    44 => ConsoleColor.dark_blue,
    45 => ConsoleColor.dark_magenta,
    46 => ConsoleColor.dark_cyan,
    47 => ConsoleColor.gray,
    100 => ConsoleColor.dark_gray,
    101 => ConsoleColor.red,
    102 => ConsoleColor.green,
    103 => ConsoleColor.yellow,
    104 => ConsoleColor.blue,
    105 => ConsoleColor.magenta,
    106 => ConsoleColor.cyan,
    107 => ConsoleColor.white
  }  
    
  def set_color(num)
    if num == 0
      Console.reset_color
    elsif num == 1
      #since we can't do bold, invert the colors
      bg = Console.background_color
      Console.background_color = Console.foreground_color
      Console.foreground_color = bg       
    else
      Console.foreground_color = FGCOLORS[num] || Console.foreground_color
      Console.background_color = BGCOLORS[num] || Console.background_color
    end
  end
end

class IO
  include IronTermAnsiColor
  
  def puts(*args)
    if args.empty?
      syswrite "\n"
    else
      args.each do |str| 
        write(str)
        syswrite "\n"
      end
    end
    nil
  end
  
  def write(str)
    result = 0
    str = str.to_s
    match = ANSI_REGEXP.match(str)
    if match.nil?
      #no ansi code in string
      result += syswrite str
    else
      #write what comes before the ansi code in the current color
      result += syswrite str[0, match.begin(1) - 2]
      set_color(match[1].to_i)
      #write what comes after the ansi code in the new color
      result += write(str[(match.end(1) + 1)..-1])
    end
    result
  end
end
