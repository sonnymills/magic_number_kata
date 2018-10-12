class MagicNumberGame 

  def set_matrix(matrix)
    @matrix = matrix    
  end

  def get_matrix
    return @matrix
  end
  def add_row(index)
      return add_set(@matrix[index])
  end 
  def get_column(index)
      column = Array.new
      @matrix.each do  |r| 
        column.push(r[index])
      end
      return column
  end
  def add_column(index)
      return add_set(get_column(index))
  end
  def get_diagonal(diagonal_name)
      diagonal = Array.new
      max_element_index = (@matrix.length) -1
      elements = (0 .. max_element_index ).to_a
      if diagonal_name == :right
        elements.reverse! 
      end
     @matrix.each_index do |i|
        diagonal.push(@matrix[i][elements[i]])
      end 
      return diagonal 
  end
  def add_diagonal(diagonal_name)
      return add_set(get_diagonal(diagonal_name))
  end
  def add_set(set)
      return set.reduce(:+)
  end 
  def matrix_full?
    @matrix.map{|r| r.length}.reduce(:+) == 9 ? true : false
  end 
  def find_the_number
      magic_number = nil
      (0..2).each do |i|
        magic_number = add_column(i)  
        raise "doesn't match" unless add_row(i) == magic_number
      end
      return magic_number 
  end 

end 
