require 'test_helper'

class BogusTest < Test::Unit::TestCase
  def setup
    @gateway = BogusGateway.new(
      :login => 'bogus',
      :password => 'bogus'
    )
    
    @creditcard = credit_card('1')
    
    @response = ActiveMerchant::Billing::Response.new(true, "Transaction successful", :transid => BogusGateway::AUTHORIZATION)
  end

  def test_authorize
    @gateway.capture(1000, @creditcard)    
  end

  def test_purchase
    @gateway.purchase(1000, @creditcard)    
  end

  def test_3d_secure_authorize
    response = @gateway.authorize(1000, credit_card('4'))
    assert response.three_d_secure?
    assert_equal BogusGateway::THREE_D_PA_REQ, response.pa_req
    assert_equal BogusGateway::THREE_D_MD, response.md
    assert_equal BogusGateway::THREE_D_ACS_URL, response.acs_url
  end

  def test_3d_secure_purchase
    response = @gateway.purchase(1000, credit_card('4'))
    assert response.three_d_secure?
    assert_equal BogusGateway::THREE_D_PA_REQ, response.pa_req
    assert_equal BogusGateway::THREE_D_MD, response.md    
    assert_equal BogusGateway::THREE_D_ACS_URL, response.acs_url
  end
  
  def test_3d_complete
    response = @gateway.three_d_complete(BogusGateway::THREE_D_PA_RES, BogusGateway::THREE_D_MD)
    assert_equal BogusGateway::SUCCESS_MESSAGE, response.message

    response = @gateway.three_d_complete('incorrect PaRes', BogusGateway::THREE_D_MD)
    assert_equal BogusGateway::FAILURE_MESSAGE, response.message
    
    response = @gateway.three_d_complete(BogusGateway::THREE_D_PA_RES, 'incorrect MD')
    assert_equal BogusGateway::FAILURE_MESSAGE, response.message
  end

  def test_credit
    @gateway.credit(1000, @response.params["transid"])
  end

  def test_void
    @gateway.void(@response.params["transid"])
  end
  
  def  test_store
    @gateway.store(@creditcard)
  end
  
  def test_unstore
    @gateway.unstore('1')
  end
  
  def test_supports_3d_secure
    assert @gateway.supports_3d_secure  
  end
  
  def test_supported_countries
    assert_equal ['US'], BogusGateway.supported_countries
  end
  
  def test_supported_card_types
    assert_equal [:bogus], BogusGateway.supported_cardtypes
  end
end
