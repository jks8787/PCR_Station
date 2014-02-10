require 'spec_helper'

describe User do

  describe "associations" do
  	it { should have_many :primers }
  	it { should have_and_belong_to_many :articles }
	end

end
