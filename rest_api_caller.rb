#  rest_api_caller.rb
#  
#  Copyright 2013 jvaughn <jpvnyc@gmail.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  
require 'net/http'
require 'json'
# Error classes
class RestApiCallerError < StandardError
  def initialize(msg='RestApiCallerError');super;end

  class InitializationError < RestApiCallerError
    def initialize(msg='Initialization error');super;end
  end

  class AuthorizationError < RestApiCallerError
    def initialize(msg='Authorization error');super;end
  end

  class ConnectionError < RestApiCallerError
    def initialize(msg='Connection error');super;end
  end

end

# Class to interact with remote rest API
class RestApiCaller

  # Instance variable methods
  attr_reader :token
  # Set URI as an instance variable, check that it's http or https and initialize @caller
  def initialize(api_uri)
    @uri = URI(api_uri)
    unless @uri.scheme == 'http' || @uri.scheme == 'https'
      raise RestApiCallerError::InitializationError, \
      'Argument must be http or https URI'
    else
      @caller = Net::HTTP.start(@uri.host,@uri.port)
    end
  end
  # authorize user, set token
  def authorize(user,pass)
    @uri.path += 'auth'
    @uri.query = "user=" + user + "&pass=" + pass
    response = @caller.request_get(@uri)
    raise RestApiCallerError::AuthorizationError unless response.code == '200'
    @token = JSON.parse(response.body)["token"]
    raise RestApiCallerError::AuthorizationError unless @token
  end
  # delete kv pair
  def delete(key)
  end
  # close connection
  def finish
    @caller.finish
  end
  # get value for key
  def get(key)
  end
  # list all known keys
  def list
  end
  # create kv pair
  def put(key,value)
  end
#  rescue SocketError => err
#    puts err.message
rescue Exception => err
  puts err.inspect
end
