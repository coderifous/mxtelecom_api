= mxtelecom_api

== DESCRIPTION:

Simple API wrapper for sending SMS' via the mxtelecom gateway.

== SYNOPSIS:

  class User < ActiveRecord::Base
    # you include it in a class
    include mxtelecom_api
    
    # then you configure it with your mxtelecom info:
    #             user name,    password,    and short code for smsfrom param
    mxtelecom_api 'bobbymcgee', 'password1', '12345'
    
    def send_current_location_sms
      # and then you can use the deliver_sms class method
      # it takes a phone number, and then a message.  That's it.
      User.deliver_sms(mobile_phone_number, 'You are there!  There you are!')
    end
  end

  # see, here's what it might look like if you used it in a rails project:
  user = User.find(:first)
  user.send_current_location_sms

== INSTALL:

* sudo gem install mxtelecom_api

== 

== LICENSE:

(The MIT License)

Copyright (c) 2008 Jim Garvin

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.