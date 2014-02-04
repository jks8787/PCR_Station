module PrimersHelper
	# The simplest formula is as follows (1):

	# Tm = 4°C  x  (number of G’s and C’s in the primer) + 2°C  x  (number of A’s and T’s in the primer)

	# This formula is valid for oligos <14 bases and assumes that the reaction is carried out
	#in the presence of 50mM monovalent cations. For longer oligos, the formula below is used:

	# Tm =  64.9°C + 41°C x (number of G’s and C’s in the primer – 16.4)/N

	# Where N is the length of the primer.

	def melting_temp(primer_seq)
	primer_seq = Bio::Sequence::NA.new(primer_seq)
	counts = {'a'=>primer_seq.count('a'),'c'=>primer_seq.count('c'),'g'=>primer_seq.count('g'),'t'=>primer_seq.count('t')}
		if primer_seq.length <= 14
			(4 * (counts['c'] + counts['g'] )) + (2 * (counts['a'] + counts['t']))
		else primer_seq.length > 14
			64.9 + 41 * ((counts['c'] + counts['g'] ) - 16.4)/ primer_seq.length
		end
	end

end
