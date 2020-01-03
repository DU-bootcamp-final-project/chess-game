class Queen < Piece
	
	def valid_move?(x_destination, y_destination)
		cell_x == x_destination || cell_y == y_destination ||
		(cell_x - x_destination).abs == (cell_y - y_destination).abs
  	end

end