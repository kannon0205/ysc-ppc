class ApplicationController < ActionController::Base

  before_action :set_members_index
  before_action :set_games_index

  def set_members_index
    @members_index = Member.all.order(updated_at: :desc)
  end

  def set_games_index
    @games_index = Game.all.order(updated_at: :desc)
  end
end
