class SearchController < ApplicationController
  before_filter :authenticate_admin_user!

  def search
  end

end
