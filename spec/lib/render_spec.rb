require_relative "spec_helper"

describe Aureus do

  Dir["spec/lib/views/*.haml"].each do |file|
    it "should render #{file}" do
      Haml::Engine.new(File.read(file)).render(self)
    end
  end
  
end