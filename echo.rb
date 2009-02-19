
def example(str)
  puts
  puts str
  puts "=" * str.length
  STDIN.gets
  res = eval(str)
  res.inspect # trigger dm's lazy loading
  STDIN.gets
  res
end

require 'lib/dm-core'

example %{DataMapper.setup(:default, :adapter => 'echo')}

example %{DataMapper.setup(:uri, 'echo://user:pass@localhost:5678/path?foo=bar')}

class Article
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :text,  Text
end

@a = example(%{@a = Article.create(:title => "Lorem", :text => "Lorem Ipsum")})


example %{Article.all}

example %{Article.all(:title => "Lorem")}

example %{Article.first}

example %{@a.title = "Ipsum"; @a.save}

example %{@a.destroy}


