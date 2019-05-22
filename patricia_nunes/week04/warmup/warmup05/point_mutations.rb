
def point(word1, word2)
  p a = (0...word1.size)
  p b = a.select {|i| word1[i] != word2[i]}
  p b.size

  # p(0...word1.size).select {|i| word1[i] != word2[i]}.size
end

point 'GAGCCTACTAACGGGAT','CATCGTAATGACGGCCT'

