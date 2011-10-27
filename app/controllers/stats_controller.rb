class StatsController < ApplicationController

  
  def index
    @stats = Stat.last(3)
  end
end
