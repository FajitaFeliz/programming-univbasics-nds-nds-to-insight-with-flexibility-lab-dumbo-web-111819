# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end

# Your code after this point
#when calling, use movie_with_director_name for movies_collection

def movies_with_director_key(name, movies_collection)
  i = 0
  
  while i < movies_collection.length do
    movies_collection[i][:director_name] = name
    i += 1
  end
  
  movies_collection
end

def gross_per_studio(collection)

  def make_studio_hash(nds)
    result = {}
    i = 0
    while i < nds.length do
      if !result.has_key?(nds[i][:studio])
        result["#{nds[i][:studio]}"] = 0
      end
      i += 1
    end
    result
  end

  def populate_studio_hash(nds,studio_hash)
    i = 0
    while i < nds.length do
      studio_hash["#{nds[i][:studio]}"] += nds[i][:worldwide_gross]
      i += 1
    end
    studio_hash
  end

studio_hash = make_studio_hash(collection)
populate_studio_hash(collection, studio_hash)
end

# def movies_with_directors_set(source)
#   output = []
#   i = 0
  
#   while i < source.length do
#     output << []
#     output[i] << {:director_name => "#{source[i][:name]}"}
#     k = 0
#     while k < source[i][:movies].length
#       output[i][0][:title] = source[i][:movies][k][:title]
#       output[i][0][:studio] = source[i][:movies][k][:studio]
#       output[i][0][:worldwide_gross] = source[i][:movies][k][:worldwide_gross]
#       k += 1
#     end
#     i += 1
#   end
  
#   output
# end

def movies_with_directors_set(source)
  output = []
  i = 0
  
  while i < source.length do
    # output << []
    # output[i] << {:director_name => "#{source[i][:name]}"}
    # k = 0
    # while k < source[i][:movies].length
    #   output[i][0][:title] = source[i][:movies][k][:title]
    #   output[i][0][:studio] = source[i][:movies][k][:studio]
    #   output[i][0][:worldwide_gross] = source[i][:movies][k][:worldwide_gross]
    #   k += 1
    # end
    # i += 1
    output << []
    output[i] << {:director_name => source[i][:name]}
    output[i] << source[i][:movies]
    i += 1
  end
  ##########REWORK SO THAT 
  # { :name => "A", :movies => [{ :title => "Test" }] }
  # becomes... [[{:title => "Test", :director_name => "A"}], ...[], ... []]
  output
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end