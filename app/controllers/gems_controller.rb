class GemsController < ApplicationController
  def index
    @gems = System_Gem.all
  end
end
