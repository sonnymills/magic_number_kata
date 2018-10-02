require_relative './spec_helper'
require_relative '../magic_number_game'

describe MagicNumberGame do 
  before do 
     @mng = MagicNumberGame.new 
  end
  it "can have a value in a cell" do
     @mng.matrix = 1
     expect(@mng.matrix).to eq 1
  end
  it "can add a row together" do 
     @mng.matrix = [[1,2]]
     expect(@mng.sum(0)).to eq 3
  end
  it "can have more than 1 row" do
    @mng.matrix = [[], []] 
    expect(@mng.matrix.length).to eq 2
  end
  it "can have more than 1 column" do
    @mng.col = 3 
    expect(@mng.col).to eq 3
  end
  it "can add two matrixs in a column together" do 
    @mng.matrix = [[1], [2]] 
    expect(@mng.add_column(0)).to eq 3
  end
  it "can get a diagonal" do
    @mng.matrix = [[1,3],[3,2]]
    diag = @mng.get_diag(:left)
    expect(diag).to match_array([1,2])
  end

  it "can add two cells in the left diag together" do 
    @mng.matrix = [[1,2],[1,2]]
    expect(@mng.add_diag(:left)).to eq 3
  end 
  it "can add two cells in the right diag together" do 
    @mng.matrix = [[1,3],[1,2]]
    expect(@mng.add_diag(:right)).to eq 4
  end
end 
