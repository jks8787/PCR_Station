require 'spec_helper'

describe Article do

	describe "validations" do
		it { should validate_uniqueness_of(:uid) }
	end

  describe "associations" do
  	it { should have_and_belong_to_many :users }
	end

end
