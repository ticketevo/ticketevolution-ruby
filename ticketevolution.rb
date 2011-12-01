require 'httparty'
require 'pp'
require 'base64'
require 'openssl'

class TicketEvolution
  include HTTParty

  #base_uri 'http://localhost:5000'
  base_uri 'https://api.ticketevolution.com'

  def initialize(token,secret)
    @token = token
    @secret = secret
    @base_host = "api.ticketevolution.com"
  end

  def call(endpoint)
    self.class.get(endpoint,self.signed_opts(endpoint))
  end
  def brokerages
    # Build the URL
    endpoint = '/brokerages?per_page=1'

    # Make the request
    self.class.get(endpoint,self.signed_opts(endpoint))
  end

  def signed_opts(endpoint)
    # Build the URL
    request = ["GET ",@base_host,endpoint].join()

    # Make a signature
    digest = OpenSSL::Digest::Digest.new('sha256')
    signature = Base64.encode64(OpenSSL::HMAC.digest(digest, @secret, request)).chomp

    # Set the headers
    return {
      :headers => {
        "X-Signature" => signature,
        "X-Token" => @token,
        "Accept" => "application/vnd.ticketevolution.api+json; version=8"
      }
    }
  end
end
