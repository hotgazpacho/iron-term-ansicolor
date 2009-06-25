require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "IronTermANSIColor", "when given a string with ANSI background color control characters" do
  
  before(:all) do
    @original_color = System::ConsoleColor.Gray
  end
  
  it "should set the background color to black when doing a puts of a string with only black background ANSI control code and reset the background color after" do
    pending("get background color detection working")
    string = "Black".black
    System::Console.should_receive(:ForegroundColor).once.and_return(@original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.Black)
    System::Console.should_receive(:ForegroundColor=).ordered.with(@original_color)
    puts string
  end
  
  it "should set the background color to dark red when doing a puts of a string with only red background ANSI control code and reset the background color after" do
    pending("get background color detection working")
    string = "Red".red
    System::Console.should_receive(:ForegroundColor).once.and_return(@original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.DarkRed)
    System::Console.should_receive(:ForegroundColor=).ordered.with(@original_color)
    puts string
  end
  
  it "should set the background color to dark green when doing a puts of a string with only green background ANSI control code and reset the background color after" do
    pending("get background color detection working")
    string = "Green".green
    System::Console.should_receive(:ForegroundColor).once.and_return(@original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.DarkGreen)
    System::Console.should_receive(:ForegroundColor=).ordered.with(@original_color)
    puts string
  end
  
  it "should set the background color to dark yellow when doing a puts of a string with only yellow background ANSI control code and reset the background color after" do
    pending("get background color detection working")
    string = "Yellow".yellow
    System::Console.should_receive(:ForegroundColor).once.and_return(@original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.DarkYellow)
    System::Console.should_receive(:ForegroundColor=).ordered.with(@original_color)
    puts string
  end
  
  it "should set the background color to dark blue when doing a puts of a string with only blue background ANSI control code and reset the background color after" do
    pending("get background color detection working")
    string = "Blue".blue
    System::Console.should_receive(:ForegroundColor).once.and_return(@original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.DarkBlue)
    System::Console.should_receive(:ForegroundColor=).ordered.with(@original_color)
    puts string
  end
  
  it "should set the background color to dark magenta when doing a puts of a string with only magenta background ANSI control code and reset the background color after" do
    pending("get background color detection working")
    string = "Magenta".magenta
    System::Console.should_receive(:ForegroundColor).once.and_return(@original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.DarkMagenta)
    System::Console.should_receive(:ForegroundColor=).ordered.with(@original_color)
    puts string
  end
  
  it "should set the background color to dark cyan when doing a puts of a string with only cyan background ANSI control code and reset the background color after" do
    pending("get background color detection working")
    string = "Cyan".cyan
    System::Console.should_receive(:ForegroundColor).once.and_return(@original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.DarkCyan)
    System::Console.should_receive(:ForegroundColor=).ordered.with(@original_color)
    puts string
  end
  
  it "should set the background color to gray when doing a puts of a string with only white background ANSI control code and reset the background color after" do
    pending("get background color detection working")
    string = "Gray".white
    System::Console.should_receive(:ForegroundColor).once.and_return(@original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.Gray)
    System::Console.should_receive(:ForegroundColor=).ordered.with(@original_color)
    puts string
  end
end

