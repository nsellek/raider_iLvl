class PlayerController < ApplicationController
  before_filter :find_player, except: []
  def view_player
    session[:return_to] ||= request.referer
    # @stat_list = {3 => "Agility", 4=> "Strength", 5=> "Intellect", 6=> "Spirit", 7=> "Stamina", 32=> "Critical Strike", 36=> "Haste", 40=> "Versatility", 49=> "Mastery",61=> "Speed", 62=> "Leech", 63=> "Avoidance", 71=> "Agility or Strength or Intellect",72=> "Strength or Agility", 73=> "Agility or Intellect", 74=> "Strength or Intellect"}
    @items = @player.items.drop(2)
  end

  private

  def find_player
    @player = GuildMember.find(params[:id])
  end
end
