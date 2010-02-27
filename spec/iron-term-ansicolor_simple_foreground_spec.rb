require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "IronTermANSIColor", "when given a string with ANSI foreground color control characters" do
  
  before(:all) do
    @original_fgcolor = System::ConsoleColor.Gray
  end
  
  it "should set the foreground color to black when doing a puts of a string with only blackforeground ANSI control code and reset the foreground color after" do
    string = "Black".black
    System::Console.should_receive(:foreground_color=).once.with(System::ConsoleColor.black)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the foreground color to dark red when doing a puts of a string with only redforeground ANSI control code and reset the foreground color after" do
    string = "Red".red
    System::Console.should_receive(:foreground_color=).once.with(System::ConsoleColor.dark_red)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the foreground color to dark green when doing a puts of a string with only greenforeground ANSI control code and reset the foreground color after" do
    string = "Green".green
    System::Console.should_receive(:foreground_color=).once.with(System::ConsoleColor.dark_green)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the foreground color to dark yellow when doing a puts of a string with only yellowforeground ANSI control code and reset the foreground color after" do
    string = "Yellow".yellow
    System::Console.should_receive(:foreground_color=).once.with(System::ConsoleColor.DarkYellow)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the foreground color to dark blue when doing a puts of a string with only blueforeground ANSI control code and reset the foreground color after" do
    string = "Blue".blue
    System::Console.should_receive(:foreground_color=).once.with(System::ConsoleColor.DarkBlue)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the foreground color to dark magenta when doing a puts of a string with only magentaforeground ANSI control code and reset the foreground color after" do
    string = "Magenta".magenta
    System::Console.should_receive(:foreground_color=).at_least(:once).with(System::ConsoleColor.DarkMagenta)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the foreground color to dark cyan when doing a puts of a string with only cyanforeground ANSI control code and reset the foreground color after" do
    string = "Cyan".cyan
    System::Console.should_receive(:foreground_color=).once.with(System::ConsoleColor.DarkCyan)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
  
  it "should set the foreground color to gray when doing a puts of a string with only whiteforeground ANSI control code and reset the foreground color after" do
    string = "Gray".white
    System::Console.should_receive(:foreground_color=).at_least(:once).with(System::ConsoleColor.Gray)
    System::Console.should_receive(:reset_color).at_least(:once)
    puts string
  end
end

