class TicTacToe

  WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], #Horizontal
                          [0, 3, 6], [1, 4, 7], [2, 5, 8], #Vertical
                          [0, 4, 8], [2, 4, 6]] #Diagonal

  def initialize
    @board = ["", "", "", "", "", "", "", "", ""]
    @players = ['Player 1', 'Player 2']
    @current_player = 'Player 1'
    @play_counter = 0
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def board
    @board
  end

  def current_player
    @current_player
  end

  def switch
    @current_player = opponent_of(@current_player)
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    check_for_outcome
  end

  def move(position)
    fail "Please select a space within range." if position < 1 || position > 9
    fail "That space is already taken!" unless @board[position-1].empty?
    @play_counter = @play_counter + 1
    if @current_player == player_1
      @board[position-1] = 'o'
    else
      @board[position-1] = 'x'
    end
    switch
    display_board
    end

  def check_for_outcome
    WINNING_COMBINATIONS.each do |combination|
    case @board.values_at(*combination)
      when %w(o o o)
        return "Player 1 wins!"
      when %w(x x x)
        return "Player 2 wins!"
      end
    end
    if @play_counter == 9
      "This match is a tie!"
    else
      "Game in progress! It's your turn, #{@current_player}."
    end
  end

  private

  def opponent_of(player)
    @players.select { |p| p != player }.first
  end
end
