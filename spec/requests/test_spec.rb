require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/test" do
  before(:each) do
    @response = request("/test")
  end
end