class PagesController < ApplicationController

  skip_before_action :authorize, only: [ :home ]

  def home
  end

  def release
  end

end
