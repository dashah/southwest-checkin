require_relative './errors'

module Southwest
  class Request
    protected

    def make_request(path, params, content_type)
      Typhoeus::Request.get("#{base_uri}#{path}", {
        params: params, headers: headers(content_type)
      })
    end

    def headers(content_type)
      {
        'User-Agent' => user_agent,
        'Content-Type' => content_type,
        'X-Api-Key' => api_key,
        'Accept-Language' => 'en-US;q=1'
      }
    end

    def base_uri
      'https://api-extensions.southwest.com/v1/mobile'
    end

    def user_agent
      "Southwest/4.7.1 CFNetwork/811.5.4 Darwin/16.7.0"
    end

    def api_key
      "l7xxc981db8c38c84a3ea0a0c677ec2fc021"
    end
  end
end
