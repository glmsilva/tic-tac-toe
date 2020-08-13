# frozen_string_literal: true
@board = Array.new(3) { Array.new(3) }
@row = ''
@col = ''
@turn = 'X'
@playing = true

3.times do |a|
  3.times do |c|
    @board[a][c] = '_'
  end
end

def print_board
  3.times do |a|
    3.times do |b|
      print '|' if b.zero?
      print @board[a][b] + '|'
    end
    puts "\n"
  end
end

def play
  (1..9).each do |i|
    puts "Insert a number for row: "
    @row = gets.to_i - 1
    puts "Insert a number for col: "
    @col = gets.to_i - 1
    @board[@row][@col] = @turn

    print_board
    @turn = if @turn == 'X'
              'O'
            else
              'X'
            end

    if game_over(@row, @col)
      @playing = false
      if @turn == 'X'
        winner('O')
      else
        winner('X')

      end
      break
    end

    next unless i > 8

    puts "It's a tie!"
    @playing = false
    break
  end
end

def game_over(r_move, c_move)
  return true if @board[0][c_move] == @board[1][c_move] && @board[0][c_move] == @board[2][c_move]

  return true if @board[r_move][0] == @board[r_move][1] && @board[r_move][0] == @board[r_move][2]

  return true if @board[0][0] == @board[1][1] && @board[0][0] == @board[2][2] && @board[1][1] != '_'

  false
end

def winner(pos)
  puts "Game over! Player \'#{pos}\' wins."
end

play