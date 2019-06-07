require 'sinatra/base'
require 'data_mapper'
require 'active_support/core_ext/integer/inflections'
require_relative 'lib/peep'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.reverse
    erb :index
  end

  get '/post' do
    erb :post
  end

  post '/post' do
    Peep.create(text: params[:text], created_at: Time.now)
    redirect('/')
  end

  run! if app_file == $0
end