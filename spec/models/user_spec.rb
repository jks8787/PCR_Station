require 'spec_helper'

describe User do
  describe "associations" do
  	it { should have_many :primers }
	end
end
