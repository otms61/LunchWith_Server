module RequestHeaders
  def auth_header(access_token = nil)
    if access_token.nil?
      { 'Content-Type' => 'application/json' }
    else
      {
        'Content-Type' => 'application/json',
        'Authorization' => "Token token=#{access_token}"
      }
    end
  end
end
