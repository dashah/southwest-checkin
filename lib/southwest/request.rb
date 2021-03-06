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
      'https://mobile.southwest.com/api/extensions/v1/mobile' #https://github.com/xur17/southwest-alerts/blob/master/southwestalerts/southwest.py
    end

    def user_agent
      "Southwest/3.3.7 (iPhone; iOS 9.3; Scale/2.00)"
    end

    def api_key
      "l7xx0a43088fe6254712b10787646d1b298e"  #retrive from https://mobile.southwest.com/js/config.js
    end
  end
end
