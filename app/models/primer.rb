class Primer < ActiveRecord::Base
	belongs_to :user

  validates :primer_seq,
    :presence   => true,
    :format     => { :with => /\A[a|t|c|g|A|T|C|G]+\z/ }
end


