require 'tic_tac_toe'

describe TicTacToe do
    let(:game) { (TicTacToe.new) }

describe 'player_1' do
  it 'checks that player one is the first player' do
    expect(game.player_1).to eq 'Player 1'
  end
end

describe 'player_2' do
  it 'checks that player two is the second player' do
    expect(game.player_2).to eq 'Player 2'
  end
end

describe 'board' do
  it 'should store the elements of the game inside an Array' do
    expect(game.board).to be_an_instance_of Array
  end

  it 'should contain empty strings by default' do
    expect(game.board).to include("")
  end
end

describe 'current_player' do
  it 'returns the current player' do
    expect(game.current_player).to eq 'Player 1'
  end
end

describe 'switch' do
  it 'is expected to switch the current player' do
    game.switch
    expect(game.current_player).to eq 'Player 2'
  end
end

describe 'display board' do
  it 'should display the interface of the game' do
    game.move(5)
    expect(game.display_board).to include("o")
  end

  it 'should display a message informing the player whose turn it is' do
    expect(game.display_board).to include("It's your turn, Player 1.")
  end
end

describe 'move' do
  it 'should raise an error message if somebody tries to add a number outside the range of the grid' do
    expect{ game.move(10) }.to raise_error "Please select a space within range."
  end

  it 'should raise an error message if somebody tries to add a number outside the range of the grid' do
    expect{ game.move(0) }.to raise_error "Please select a space within range."
  end

  it 'should raise an error if somebody tries to mark a square which is already in use' do
    game.move(4)
    expect{ game.move(4) }.to raise_error "That space is already taken!"
  end

  it 'allows player 1 to make a move (select a square)' do
    game.move(1)
    expect(game.board).to include("o")
  end

  it 'allows player 2 to make a move (select a square)' do
    game.move(1)
    game.move(4)
    expect(game.board).to include("x")
  end
end

  describe 'check_for_outcome' do
    it 'should calculate the outcome of the game [ Player 1 W - Row ]' do
      game.move(1)
      game.move(9)
      game.move(2)
      game.move(8)
      game.move(3)
      expect(game.check_for_outcome).to eq "Player 1 wins!"
    end

    it 'should calculate the outcome of the game [ Player 2 W - Row ]' do
      game.move(1)
      game.move(9)
      game.move(2)
      game.move(8)
      game.move(5)
      game.move(7)
      expect(game.check_for_outcome).to eq "Player 2 wins!"
    end

    it 'should calculate the outcome of the game [ Player 1 W - Collumn ]' do
      game.move(1)
      game.move(9)
      game.move(4)
      game.move(8)
      game.move(7)
      expect(game.check_for_outcome).to eq "Player 1 wins!"
    end

    it 'should calculate the outcome of the game [ Player 2 W - Collumn ]' do
      game.move(1)
      game.move(9)
      game.move(4)
      game.move(6)
      game.move(2)
      game.move(3)
      expect(game.check_for_outcome).to eq "Player 2 wins!"
    end

    it 'should calculate the outcome of the game [ Player 1 W - Diagonal ]' do
      game.move(1)
      game.move(3)
      game.move(5)
      game.move(2)
      game.move(9)
      expect(game.check_for_outcome).to eq "Player 1 wins!"
    end

    it 'should calculate the outcome of the game [ Player 2 W - Diagonal ]' do
      game.move(2)
      game.move(9)
      game.move(3)
      game.move(5)
      game.move(4)
      game.move(1)
      expect(game.check_for_outcome).to eq "Player 2 wins!"
    end

    it 'should know when a game is in progress [ Game in Progress ]' do
      game.move(1)
      game.move(4)
      game.move(3)
      game.move(9)
      game.move(7)
      game.move(6)
      expect(game.check_for_outcome).to include("Game in progress!")
    end

    it 'should know when a game has resulted in a draw [ Tie ]' do
      game.move(1)
      game.move(2)
      game.move(3)
      game.move(5)
      game.move(4)
      game.move(7)
      game.move(6)
      game.move(9)
      game.move(8)
      expect(game.check_for_outcome).to eq "This match is a tie!"
    end
  end
end
