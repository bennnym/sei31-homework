#require 'sinatra'
require 'pry'

#p dna

def count(word)
  word

  word_array = []

  #this site explaine what Hash do
  #http://jerodsanto.net/2013/10/ruby-quick-tip-easily-count-occurrences-of-array-elements/
  counts = Hash.new 0
  not_dna = Hash.new 0
  dna = 'A', 'C', 'G', 'T'

  word.each_char do |letter|
    word_array.push letter
    if dna.include? letter then
      counts[letter] += 1 
    else 
      not_dna[letter] += 1
    end
  end

  puts counts
  puts "Not DNA: #{not_dna.keys.join(', ')}"
  
  # p word_array
  #binding.pry
end

count ARGV[0]

#don't forget to call the function
# count "AGCTTTTCATTCTGATGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
