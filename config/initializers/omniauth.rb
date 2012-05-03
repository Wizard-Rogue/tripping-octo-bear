Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '376969209011426', '827c4c375cf8005bff034b83e350f4a5'
end

require 'open-uri'
require 'net/https'

module Net
  class HTTP
    alias_method :original_use_ssl=, :use_ssl=
    
    def use_ssl=(flag)
      self.ca_file = '/usr/lib/ssl/certs/ca-certificates.crt'
      self.verify_mode = OpenSSL::SSL::VERIFY_PEER
      self.original_use_ssl = flag
    end
  end
end
