require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "IronTermANSIColor", "when given a string with ANSI foreground color control characters" do
  
  before(:all) do
    @original_fgcolor = SsC.Gray
  end
  
  it "should set the foreground color to black when doing a puts of a string with only blackforeground ANSI control code and reset the foreground color after" do
    string = "Black".black
    SC.should_receive(:foreground_color).at_least(:once).and_return(@original_fgcolor)
    SC.should_receive(:foreground_color=).once.with(SsC.black)
    SC.should_receive(:foreground_color=).at_least(:once).with(@original_fgcolor)
    puts string
  end
  
  it "should set the foreground color to dark red when doing a puts of a string with only redforeground ANSI control code and reset the foreground color after" do
    string = "Red".red
    SC.should_receive(:foreground_color).at_least(:once).and_return(@original_fgcolor)
    SC.should_receive(:foreground_color=).once.with(SsC.red)
    SC.should_receive(:foreground_color=).at_least(:once).with(@original_fgcolor)
    puts string
  end
  
  it "should set the foreground color to dark green when doing a puts of a string with only greenforeground ANSI control code and reset the foreground color after" do
    string = "Green".green
    SC.should_receive(:foreground_color).at_least(:once).and_return(@original_fgcolor)
    SC.should_receive(:foreground_color=).once.with(SsC.DarkGreen)
    SC.should_receive(:foreground_color=).at_least(:once).with(@original_fgcolor)
    puts string
  end
  
  it "should set the foreground color to dark yellow when doing a puts of a string with only yellowforeground ANSI control code and reset the foreground color after" do
    string = "Yellow".yellow
    # SC.should_receive(:foreground_color).at_least(:once).and_return(@original_fgcolor)
    # SC.should_receive(:foreground_color=).once.with(SsC.DarkYellow)
    # SC.should_receive(:foreground_color=).at_least(:once).with(@original_fgcolor)
    puts string
  end
  
  it "should set the foreground color to dark blue when doing a puts of a string with only blueforeground ANSI control code and reset the foreground color after" do
    string = "Blue".blue
    # SC.should_receive(:foreground_color).at_least(:once).and_return(@original_fgcolor)
    # SC.should_receive(:foreground_color=).once.with(SsC.DarkBlue)
    # SC.should_receive(:foreground_color=).at_least(:once).with(@original_fgcolor)
    puts string
  end
  
  it "should set the foreground color to dark magenta when doing a puts of a string with only magentaforeground ANSI control code and reset the foreground color after" do
    string = "Magenta".magenta
    # SC.should_receive(:foreground_color).at_least(:once).and_return(@original_fgcolor)
    # SC.should_receive(:foreground_color=).at_least(:once).with(SsC.DarkMagenta)
    # SC.should_receive(:foreground_color=).at_least(:once).with(@original_fgcolor)
    puts string
  end
  
  it "should set the foreground color to dark cyan when doing a puts of a string with only cyanforeground ANSI control code and reset the foreground color after" do
    string = "Cyan".cyan
    # SC.should_receive(:foreground_color).at_least(:once).and_return(@original_fgcolor)
    # SC.should_receive(:foreground_color=).once.with(SsC.DarkCyan)
    # SC.should_receive(:foreground_color=).at_least(:once).with(@original_fgcolor)
    puts string
  end
  
  it "should set the foreground color to gray when doing a puts of a string with only whiteforeground ANSI control code and reset the foreground color after" do
    string = "Gray".white
    # SC.should_receive(:foreground_color).at_least(:once).and_return(@original_fgcolor)
    # SC.should_receive(:foreground_color=).at_least(:once).with(SsC.Gray)
    # SC.should_receive(:foreground_color=).at_least(:once).with(@original_fgcolor)
    puts string
  end
end

