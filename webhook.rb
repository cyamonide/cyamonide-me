require 'sinatra'

post '/payload' do
  `git status`
end
