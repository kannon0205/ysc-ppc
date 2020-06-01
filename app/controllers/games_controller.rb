class GamesController < ApplicationController

  def create
    @game = Game.new(surve_a: 0, surve_b: 0, player_a: "プレイヤー1", player_b: "プレイヤー2", score_a: 0, score_b: 0)
    @game.save
    redirect_to("/games/#{@game.id}/edit")
  end

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def destroy
    @game = Game.find_by(id: params[:id])
    @game.destroy
    redirect_to("/#tab-1")
  end

  def create_surve_a
    @game = Game.find_by(id: params[:id])
    @game.surve_a = 4
    @game.surve_b = 2
    @game.save
    redirect_to("/games/#{@game.id}/edit")
  end

  def create_surve_b
    @game = Game.find_by(id: params[:id])
    @game.surve_a = 2
    @game.surve_b = 4
    @game.save
    redirect_to("/games/#{@game.id}/edit")
  end

  def surve_reset
    @game = Game.find_by(id: params[:id])
    @game.surve_a = 0
    @game.surve_b = 0
    @game.save
    redirect_to("/games/#{@game.id}/edit")
  end

  def create_player_a
    @player = Member.find_by(id: params[:member_id])
    @game = Game.find_by(id: params[:game_id])
    @game.player_a = @player.name
    @game.save
    redirect_to("/games/#{@game.id}/edit")
  end

  def create_player_b
    @player = Member.find_by(id: params[:member_id])
    @game = Game.find_by(id: params[:game_id])
    @game.player_b = @player.name
    @game.save
    redirect_to("/games/#{@game.id}/edit")
  end

  def player_reset_a
    @game = Game.find_by(id: params[:game_id])
    @game.player_a = "プレイヤー1"
    @game.save
    redirect_to("/games/#{@game.id}/edit")
  end

  def player_reset_b
    @game = Game.find_by(id: params[:game_id])
    @game.player_b = "プレイヤー2"
    @game.save
    redirect_to("/games/#{@game.id}/edit")
  end

  def show
    @game = Game.find_by(id: params[:id])

    if @game.score_a > 10 && @game.score_b < 10
      redirect_to("/games/#{@game.id}/1/result")

    elsif @game.score_a < 10 && @game.score_b > 10
      redirect_to("/games/#{@game.id}/2/result")

    end

    if @game.score_a >= 10 && @game.score_b >= 10

      if @game.score_a - @game.score_b == 2
        redirect_to("/games/#{@game.id}/1/result")

      elsif  @game.score_b - @game.score_a == 2
        redirect_to("/games/#{@game.id}/2/result")

      end

    end

  end

  def plus

    @game = Game.find_by(id: params[:game_id])

    if @game.score_a >= 10 && @game.score_b >= 10

      @game.surve_a = @game.surve_a + 2
      @game.surve_b = @game.surve_b + 2

    else

      @game.surve_a = @game.surve_a + 1
      @game.surve_b = @game.surve_b + 1

    end

    if params[:player] == "1"
      @game.score_a = @game.score_a + 1
    elsif params[:player] == "2"
      @game.score_b = @game.score_b + 1
    end

    @game.save

    redirect_to("/games/#{@game.id}/show")

  end


  def minus

    @game = Game.find_by(id: params[:game_id])

    if @game.score_a >= 10 && @game.score_b >= 10

      @game.surve_a = @game.surve_a - 2
      @game.surve_b = @game.surve_b - 2

    else

    @game.surve_a = @game.surve_a - 1
    @game.surve_b = @game.surve_b - 1

    end

    if params[:player] == "1"
      @game.score_a = @game.score_a - 1
    elsif params[:player] == "2"
      @game.score_b = @game.score_b - 1
    end

    @game.save

    redirect_to("/games/#{@game.id}/show")

  end

  def result
    @game = Game.find_by(id: params[:game_id])
  end

  def record
    @game = Game.find_by(id: params[:game_id])
    @player1 = Member.find_by(name: @game.player_a)
    @player2 = Member.find_by(name: @game.player_b)

      if params[:player] == "1"
        @player1.win = @player1.win + 1
        @player2.lose = @player2.lose + 1
      elsif params[:player] == "2"
        @player2.win = @player2.win + 1
        @player1.lose = @player1.lose + 1
      end

    @player1.save
    @player2.save
    @game.destroy
    redirect_to("/")

  end

  def back
    @game = Game.find_by(id: params[:game_id])

    if params[:player] == "1"
      @game.score_a = @game.score_a - 1

      if @game.score_a >= 10 && @game.score_b >= 10
        @game.surve_a = @game.surve_a - 2
        @game.surve_b = @game.surve_b - 2
      else
        @game.surve_a = @game.surve_a - 1
        @game.surve_b = @game.surve_b - 1
      end

    elsif params[:player] == "2"
      @game.score_b = @game.score_b - 1

      if @game.score_a >= 10 && @game.score_b >= 10
        @game.surve_a = @game.surve_a - 2
        @game.surve_b = @game.surve_b - 2
      else
        @game.surve_a = @game.surve_a - 1
        @game.surve_b = @game.surve_b - 1
      end
    end

    @game.save
    redirect_to("/games/#{@game.id}/show")
  end


end
