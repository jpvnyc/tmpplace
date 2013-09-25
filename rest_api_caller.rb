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
  # set URI as an instance variable, check that it's http or https
  def initialize(api_uri)
    @uri = URI(api_uri)
    unless @uri.scheme == 'http' || @uri.scheme == 'https'
      raise RestApiCallerError::InitializationError, \
      'Argument must be http or https URI'
    end
  end
  # authorize user, set key
  def authorize(user,pass)
  
  end
  def delete
  end
  def get
  end
  def baz
  end
#  rescue SocketError => err
#    puts err.message
rescue Exception => err
  puts err.inspect
end
