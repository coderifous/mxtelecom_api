$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'uri'
require 'net/http'

# HTTP get style api, ala:
# http://sms.mxtelecom.com/SMSSend?user=myusername&pass=mypassword&smsfrom=shortcode&smsto=19495551212&...otherparameters

module MxtelecomApi

  def self.included(includer)
    includer.extend(ClassMethods)
  end

  module ClassMethods
    
    def mxtelecom_api(user, pass, shortcode)
      @@mxtelecom_api_user      = user
      @@mxtelecom_api_pass      = pass
      @@mxtelecom_api_shortcode = shortcode
    end

    def setup_sms_params(phone_number, message, options={})
      phone_number.gsub!(/\D/,'')
      param_hash = sms_params.merge( :smsmsg => URI.escape(message), :smsto => phone_number ).merge(options)
      compile_params(param_hash)
    end
    
    def deliver_sms(phone_number, message, options={})
      response = Net::HTTP.get_response(sms_host, setup_sms_params(phone_number, message, options))
      if(respond_to?(:logger))
        logger.info("Sent SMS to #{user.mobile_phone_number}, with message '#{message}', got back \"#{response.body}\"")
      end
      response
    end

    def sms_host
      "sms.mxtelecom.com"
    end

    def sms_params
      { :user => @@mxtelecom_api_user, :pass => @@mxtelecom_api_pass, :smsfrom => @@mxtelecom_api_shortcode }
    end

    def compile_params(params)
      tokens = []
      params.keys.collect{|x|x.to_s}.sort.each do |k|
        tokens << "#{k}=#{params[k.to_sym]}"
      end
      '/SMSSend?' + tokens.join('&')
    end
    
  end    
end
