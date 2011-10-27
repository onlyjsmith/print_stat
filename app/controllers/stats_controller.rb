class StatsController < ApplicationController

  
  def index
    @stats = Stat.last(2)
  end
end
