require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "IronTermANSIColor", "when given a string with ANSI background color control characters" do
  
  before(:all) do
    @original_bgcolor = System::ConsoleColor.Gray
  end
  
  it "should set the background color to black when doing a puts of a string with only black background ANSI control code and reset the background color after" do
    string = "Black".on_black
    System::Console.should_receive(:background_color=).once.with(System::ConsoleColor.Black)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the background color to dark red when doing a puts of a string with only red background ANSI control code and reset the background color after" do
    string = "Red".on_red
    System::Console.should_receive(:background_color=).once.with(System::ConsoleColor.DarkRed)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the background color to dark green when doing a puts of a string with only green background ANSI control code and reset the background color after" do
    string = "Green".on_green
    System::Console.should_receive(:background_color=).once.with(System::ConsoleColor.DarkGreen)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the background color to dark yellow when doing a puts of a string with only yellow background ANSI control code and reset the background color after" do
    string = "Yellow".on_yellow
    System::Console.should_receive(:background_color=).once.with(System::ConsoleColor.DarkYellow)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the background color to dark blue when doing a puts of a string with only blue background ANSI control code and reset the background color after" do
    string = "Blue".on_blue
    System::Console.should_receive(:background_color=).once.with(System::ConsoleColor.DarkBlue)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the background color to dark magenta when doing a puts of a string with only magenta background ANSI control code and reset the background color after" do
    string = "Magenta".on_magenta
    System::Console.should_receive(:background_color=).once.with(System::ConsoleColor.DarkMagenta)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the background color to dark cyan when doing a puts of a string with only cyan background ANSI control code and reset the background color after" do
    string = "Cyan".on_cyan
    System::Console.should_receive(:background_color=).once.with(System::ConsoleColor.DarkCyan)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the background color to gray when doing a puts of a string with only white background ANSI control code and reset the background color after" do
    string = "Gray".on_white
    System::Console.should_receive(:background_color=).once.with(System::ConsoleColor.Gray)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
end

