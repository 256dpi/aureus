require_relative "spec_helper"

describe Aureus do

  before do
    @resource = Resource.create! title: "the title", text: "some long text"
    @resources = [@resource,@resource,@resource]
  end

  Dir["spec/lib/views/*.haml"].each do |file|
    it "should render #{file}" do
      Haml::Engine.new(File.read(file)).render(self)
    end
  end
  
end