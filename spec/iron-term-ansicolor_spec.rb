require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "IronTermANSIColor" do
  
  before(:all) do
    @original_color = System::ConsoleColor.Gray
  end
  
  it "should set the foreground color to black when doing a puts of a string with only black ANSI control code and reset the foreground color after" do
    string = "Black".black
    System::Console.should_receive(:ForegroundColor).once.and_return(@original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.Black)
    System::Console.should_receive(:ForegroundColor=).ordered.with(@original_color)
    puts string
  end
  
  it "should set the foreground color to red when doing a puts of a string with only red ANSI control code and reset the foreground color after" do
    string = "Red".red
    System::Console.should_receive(:ForegroundColor).once.and_return(@original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.Red)
    System::Console.should_receive(:ForegroundColor=).ordered.with(@original_color)
    puts string
  end
  
  it "should set the foreground color to green when doing a puts of a string with only green ANSI control code and reset the foreground color after" do
    string = "Green".green
    System::Console.should_receive(:ForegroundColor).once.and_return(@original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.Green)
    System::Console.should_receive(:ForegroundColor=).ordered.with(@original_color)
    puts string
  end
end

