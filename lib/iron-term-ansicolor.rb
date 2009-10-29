require 'mscorlib'
require 'term/ansicolor'

## add the trailing m  because some of the rspec output spans multiple lines
ANSI_REGEXP = /\e\[(.+?)m(.+?)(?=(\e\[0m|\z))/m
SsC=System::ConsoleColor
SC = System::Console

class String
  include Term::ANSIColor
end

module IronTermAnsiColor
  module Version
    MAJOR=0
    MINOR=0
    PATCH=1
    STRING="#{MAJOR}.#{MINOR}.#{PATCH}"
  end
end

class IO
  alias_method :original_write, :write
  alias_method :original_puts, :puts
  
  def puts(*args)
    rewrite(*args) { |text| original_puts text }
    nil
  end

  def write(*args)
    rewrite(*args) { |text| original_write text }
  end

  private
    def extract_ansi_data(arg)
      fg_color_map =    Hash[30,SsC.black,31,SsC.red,32,SsC.dark_green,33,SsC.dark_yellow,34,SsC.dark_blue,35,SsC.dark_magenta,
        36,SsC.dark_cyan,37,SsC.gray]
      bg_color_map = Hash[40,SsC.black,41,SsC.dark_red,42,SsC.dark_green,43,SsC.dark_yellow,44,SsC.dark_blue,45,SsC.dark_magenta,
        46,SsC.dark_cyan,47,SsC.gray]
    
      matches = ANSI_REGEXP.match(arg)
    
      fg_color = fg_color_map[matches[1].to_i] || SC.foreground_color
      bg_color = bg_color_map[matches[1].to_i] || SC.background_color
    
      { :foreground => fg_color, :background => bg_color,:text => matches[2]}
    end
  
    def rewrite(*args, &b)
      raise ArgumentError, "needs a block" unless b
      result=0
      args.each do |arg|
        fg_color = SC.foreground_color
        bg_color = SC.background_color

        ##dkb
        data =  if ANSI_REGEXP =~ arg
                  extract_ansi_data(arg)
                else
                  {:text => arg}
                end  

        SC.foreground_color = data[:foreground] || fg_color
        SC.background_color = data[:background] || bg_color
        result = b.call data[:text]
        SC.background_color = bg_color
        SC.foreground_color = fg_color
      end
      result
    end

end
