require_relative "spec_helper"

describe Aureus::Box do

  before do
    @out = Haml::Engine.new(File.read("spec/lib/views/box.haml")).render(self)
  end

  it "should render simple box" do
    @out.length > 0
  end
  
end