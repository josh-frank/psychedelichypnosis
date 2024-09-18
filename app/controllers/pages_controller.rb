class PagesController < ApplicationController

  skip_before_action :authorize, only: [ :home, :privacy ]

  def home
  end

  def privacy
  end

  def release
  end

end
