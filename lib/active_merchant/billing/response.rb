module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
  
    class Error < ActiveMerchantError #:nodoc:
    end
  
    class Response
      attr_reader :params, :message, :test, :authorization, :avs_result, :cvv_result, :pa_req, :md, :acs_url
      
      def success?
        @success
      end

      def test?
        @test
      end
      
      def fraud_review?
        @fraud_review
      end
      
      def three_d_secure?
        @three_d_secure
      end
      
      def initialize(success, message, params = {}, options = {})
        @success, @message, @params = success, message, params.stringify_keys
        @test = options[:test] || false        
        @authorization = options[:authorization]
        @fraud_review = options[:fraud_review]
        @avs_result = AVSResult.new(options[:avs_result]).to_hash
        @cvv_result = CVVResult.new(options[:cvv_result]).to_hash
        @three_d_secure = options[:three_d_secure]
        @pa_req = options[:pa_req]
        @md = options[:md]
        @acs_url = options[:acs_url]
      end
    end
  end
end
