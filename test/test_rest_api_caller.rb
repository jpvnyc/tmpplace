#  test_rest_api_caller.rb
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
require './rest_api_caller'
require 'test/unit'

#class to interact with remote rest API
class RestApiCallerTest < Test::Unit::TestCase
  def test_initialize
    assert_raise(RestApiCallerError::InitializationError) {RestApiCaller.new('ftp://foo')}
  end
  def test_authorize
    assert_raise(RestApiCallerError::AuthorizationError) {RestApiCaller.new('foo')}
  end
end
