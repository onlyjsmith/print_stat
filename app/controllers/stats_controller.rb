class StatsController < ApplicationController

  
  def index
    # grouped_stats = Stat.all.group_by{|s|s.last_check.to_date}
    # @stats = []
    # grouped_stats.each do |stat|
      
      # @stats << stat.key
    # end
    @stats = Stat.all
  end
end
