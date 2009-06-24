require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "IronTermANSIColor" do
  it "should set the forground color to red when presented with a string with only red ANSI controls codes" do
    red_string = "Red".red
    original_color = System::ConsoleColor.Gray
    System::Console.should_receive(:ForegroundColor).once.and_return(original_color)
    System::Console.should_receive(:ForegroundColor=).ordered.with(System::ConsoleColor.Red)
    System::Console.should_receive(:ForegroundColor=).ordered.with(original_color)
    puts red_string
  end
end

