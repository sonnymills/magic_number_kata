require_relative './spec_helper'
require_relative '../magic_number_game'

describe MagicNumberGame do 
  before :each do
      @mng = MagicNumberGame.new 
     matrix = [[1,2],[3,4]]
     @mng.set_matrix(matrix)
  end
  it "can have a row of multiple cells" do 
      @mng.set_matrix([[2,1]]) 
      expect(@mng.get_matrix.first.length).to eq 2 
  end
  it "can add cells in a row" do
      @mng.set_matrix([[2,1]]) 
      expect(@mng.add_row(0)).to eq 3
  end
  it "can add cells in the Nth row" do
     expect(@mng.add_row(1)).to eq 7
  end
  it "can create a matrix with more than one row" do 
     expect(@mng.get_matrix.length).to eq 2 
  end 
  it "can get a column" do 
     expect(@mng.get_column(0)).to match_array([1,3]) 
  end  
  it "can get the Nth column" do 
     expect(@mng.get_column(1)).to match_array([2,4]) 
  end  
  it "can add the Nth column" do 
     expect(@mng.add_column(1)).to eq 6
  end  
  it "can get a diagonal" do
     expect(@mng.get_diagonal(:left)).to match_array([1,4]) 
  end
  it "can get a right diagonal" do
     expect(@mng.get_diagonal(:right)).to match_array([2,3]) 
  end
  it "can get the sum of a diagonal" do
     matrix = [[2,2],[3,4]]
     @mng.set_matrix(matrix)
     expect(@mng.add_diagonal(:left)).to eq 6
     expect(@mng.add_diagonal(:right)).to eq 5
  end
  it "can check if the matrix is 3x3" do
     matrix = [[1,2,3],[3,4,5],[4,5,6]]
     @mng.set_matrix(matrix)
     expect(@mng.matrix_full?).to be true
  end
  it "3x3 diagonal totals still work" do 
     matrix = [[1,2,3],[3,4,5],[4,5,6]]
     @mng.set_matrix(matrix)
     expect(@mng.add_diagonal(:left)).to eq 11
  end 
  it "raises an exception when a column total doesn't match the previous column total" do 
     matrix = [[1,2,3],[3,2,1],[2,3,1]]
     @mng.set_matrix(matrix)
     expect{@mng.find_the_number}.to raise_error("doesn't match")
  end 
  it "raises an exception when a row total doesn't match the previous row total" do
     matrix = [ [1,2,3],
                [2,3,2],
                [3,1,1]]
     @mng.set_matrix(matrix)
     expect{@mng.find_the_number}.to raise_error("doesn't match")
  end
  it "doesn't raise an exception when the totals match the previous total" do
     matrix = [[1,1,1],[1,1,1],[1,1,1]]
     @mng.set_matrix(matrix)
     expect(@mng.find_the_number).to eq 3
  end
end 
