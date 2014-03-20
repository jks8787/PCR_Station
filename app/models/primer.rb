class Primer < ActiveRecord::Base
	belongs_to :user

  validates :primer_seq,
    :presence   => true,
    :format     => { :with => /\A[a|t|c|g|A|T|C|G]+\z/ }

  # The simplest formula is as follows (1):
  # Tm = 4°C  x  (number of G’s and C’s in the primer) + 2°C  x  (number of A’s and T’s in the primer)
  # This formula is valid for oligos <14 bases and assumes that the reaction is carried out
  # in the presence of 50mM monovalent cations. For longer oligos, the formula below is used:
  # Tm =  64.9°C + 41°C x (number of G’s and C’s in the primer – 16.4)/N
  # Where N is the length of the primer.

  def melting_temp
    primer = primer_sequence(self.primer_seq)
    counts = primer[:counts]
    sequence = primer[:sequence]

    if sequence.length <= 14
      (4 * (counts['c'] + counts['g'] )) + (2 * (counts['a'] + counts['t'])).round
    else sequence.length > 14
      (64.9 + 41 * ((counts['c'] + counts['g'] ) - 16.4)/ sequence.length).round
    end
  end

  # Molecular weightd = (329.2 * number of G's) + (313.2 * number of A's) + (304.2 * number of T's) + (289.2 * number of C's)
  # This molecular weight is adjusted by -78 for an assumed missing 5' phosphate group (PO3)
  # which is replaced by a single hydrogen and +17 for a 3′ hydroxyl . This must be adjusted by +78 if a 5′ phosphate is present.
  def molecular_weight
    primer = primer_sequence(self.primer_seq)
    counts = primer[:counts]
    weight = (329.2 * counts['g']) + (313.2 * counts['a']) + (304.2 * counts['t']) + (289.2 * counts['c'])

    return weight.round
  end

  def primer_sequence(sequence)
    primer_seq = Bio::Sequence::NA.new(sequence)

    counts = {
      'a' =>  primer_seq.count('a'),
      'c' =>  primer_seq.count('c'),
      'g' =>  primer_seq.count('g'),
      't' =>  primer_seq.count('t')
    }

    return { :sequence => primer_seq, :counts => counts }
  end

end


