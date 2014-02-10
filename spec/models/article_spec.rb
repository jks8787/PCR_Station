require 'spec_helper'

describe Article do

  describe "associations" do
  	it { should have_and_belong_to_many :users }
	end

end
