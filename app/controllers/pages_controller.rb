class PagesController < ApplicationController
  def home
    @page = params[:number].presence || 1
  end
end
