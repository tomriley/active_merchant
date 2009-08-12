require 'test_helper'

class ResponseTest < Test::Unit::TestCase
  def test_response_success
    assert Response.new(true, 'message', :param => 'value').success?
    assert !Response.new(false, 'message', :param => 'value').success?
  end

  def test_three_d_secure_required
    assert Response.new(false, 'message', {}, :three_d_secure => true).three_d_secure?
    assert !Response.new(false, 'message', {}, :three_d_secure => false).three_d_secure?
  end
  
  def test_three_d_secure_params
    pa_req ='eJxVUttygjAQfe9XMH4AuUCoOGscW9'
    md = '2012354765399251503'
    acs_url = 'https://ukvpstest.protx.com/mpitools/accesscontroler?action=pareq'
    response = Response.new(false, 'message', {}, :three_d_secure => true, :pa_req => pa_req, :md => md, :acs_url => acs_url)
    
    assert_equal pa_req, response.pa_req
    assert_equal md, response.md
    assert_equal acs_url, response.acs_url
  end
  
  def test_get_params
    response = Response.new(true, 'message', :param => 'value')
    
    assert_equal ['param'], response.params.keys
  end
  
  def test_avs_result
    response = Response.new(true, 'message', {}, :avs_result => { :code => 'A', :street_match => 'Y', :zip_match => 'N' })
    avs_result = response.avs_result
    assert_equal 'A', avs_result['code']
    assert_equal AVSResult.messages['A'], avs_result['message']
  end
  
  def test_cvv_result
    response = Response.new(true, 'message', {}, :cvv_result => 'M')
    cvv_result = response.cvv_result
    assert_equal 'M', cvv_result['code']
    assert_equal CVVResult.messages['M'], cvv_result['message']
  end
end
