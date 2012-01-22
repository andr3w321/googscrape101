class SearchController < ApplicationController
  before_filter :authenticate

  def search
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "foo" && password == "bar"
    end
  end
end
