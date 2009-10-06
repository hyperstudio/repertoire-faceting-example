require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/citizens" do
  before(:each) do
    @response = request("/citizens")
  end
end