require 'sinatra'
require 'sequel'
DB = Sequel.connect('sqlite://test.db') #url

get '/discussion' do
  #erb :jeremyevans
  redirect 'discussion.html'
end

get '/erb' do
  erb :jeremyevans
end

get '/create_table' do

  DB.create_table(:discussion2) do
    primary_key :id
    String :user
    String :topic
    String :comment
  end

end

post '/form' do
  @user = params['user']
  @comment = params['comment']
  @topic = params['topic']

  @items = DB[:discussion2] # Create a dataset

  #@items.insert(:user => '@user', :comment => '@comment')
  @items.insert(:user => @user, :topic => @topic, :comment => @comment)

  #puts @items.all

  erb :jeremyevans

end

=begin
DB.create_table(:discussion) do
  primary_key :id
  String :user
  String :comment
end
=end

=begin
get '/create_table' do

  DB.create_table(:items) do
    primary_key :id
    String :name
    Float :price
  end

end

get '/add_item' do

  items = DB[:items] # Create a dataset

  # Populate the table
  items.insert(:name => 'abc', :price => rand * 100)
  items.insert(:name => 'def', :price => rand * 100)
  items.insert(:name => 'ghi', :price => rand * 100)

end

get '/print' do
  @items = DB[:items]
  # Print out the number of records
  puts "Item count: #{@items.count}"

  # @items.each {|i| puts i}
  # puts "*********************"
  puts @items.all

  # Print out the average price
  puts "The average price is: #{@items.avg(:price)}"
  #"done"
  erb :jeremyevans

end
=end
