class MagicNumberGame 
  attr_accessor :matrix, :col
  def sum(row_index)
      @matrix[row_index].reduce(:+)
  end
  def add_column(col_index)
    @matrix.flatten.reduce(:+)
  end
  def add_diag(direction)
    get_diag(direction).reduce(:+)
  end
  def get_diag(direction)
    i = 0
    diag = 0 .. 2
    puts "THIS IS DIAG #{diag}"
    diag.reverse! if direction == :right
    diagonal = Array.new
    @matrix.each do |c|
      diagonal.push(c[i])
      i += 1
    end
    return diagonal 
  end
end 
