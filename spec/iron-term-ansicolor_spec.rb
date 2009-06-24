require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "IronTermANSIColor" do
  it "should set the foreground color to red when presented with a string with only red ANSI control code" do
    string = "Red".red
    original_color = System::ConsoleColor.Gray
    System::Console.should_receive(:ForegroundColor).once.and_return(original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.Red)
    System::Console.should_receive(:ForegroundColor=).ordered.with(original_color)
    puts string
  end
  
  it "should set the foreground color to green when presented with a string with only green ANSI control code" do
    string = "Green".green
    original_color = System::ConsoleColor.Gray
    System::Console.should_receive(:ForegroundColor).once.and_return(original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.Green)
    System::Console.should_receive(:ForegroundColor=).ordered.with(original_color)
    puts string
  end
end

