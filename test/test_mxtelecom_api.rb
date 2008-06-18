require File.dirname(__FILE__) + '/test_helper.rb'
require 'rubygems'
require 'net/http'
require 'mocha'

class TestMxtelecomApi < Test::Unit::TestCase
  include MxtelecomApi
  
  mxtelecom_api 'bobbymcgee', 'password1', '12345'

  def test_url_construction
    url = TestMxtelecomApi.setup_sms_params('123-123-1234', 'Call me!')
    assert_match /^\/SMSSend?/, url
    assert_match /smsto=1231231234/, url
    assert_match /pass=password1/, url
    assert_match /user=bobbymcgee/, url
    assert_match /smsfrom=12345/, url
    assert_match /smsmsg=Call%20me!/, url
    
    url = TestMxtelecomApi.setup_sms_params('123-123-1234', 'Call me!', :user => "foobar", :pass => "barbaz")
    assert_match /pass=barbaz/, url
    assert_match /user=foobar/, url
  end
  
  def test_delivery
    url = TestMxtelecomApi.setup_sms_params('123-123-1234', 'Call me!')
    Net::HTTP.expects(:get_response).with('sms.mxtelecom.com', url).returns("foo")
    resp = TestMxtelecomApi.deliver_sms('123-123-1234', 'Call me!')
    assert_equal "foo", resp
  end
  
end
