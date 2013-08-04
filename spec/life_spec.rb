require 'spec_helper'

describe Life do
  describe 'evlove' do
    context 'dead board should' do
      let(:board) { 
        [ [0,0,0],
          [0,0,0],
          [0,0,0]]
      }
      it 'should not change' do
        expect(Life::evolve(board)).to eq_board(board)
      end
    end
    context 'a blinker' do
      let(:board_1) { 
        [ [0,0,0,0,0],
          [0,0,0,0,0],
          [0,1,1,1,0],
          [0,0,0,0,0],
          [0,0,0,0,0]]
      }
      let(:board_2) { 
        [ [0,0,0,0,0],
          [0,0,1,0,0],
          [0,0,1,0,0],
          [0,0,1,0,0],
          [0,0,0,0,0]]
      }
      it 'should go from board 1 to 2' do
        expect(Life::evolve(board_1)).to eq_board(board_2)
      end
      it 'should go from board 2 to 1' do
        expect(Life::evolve(board_2)).to eq_board(board_1)
      end
    end
    context 'a toad' do
      let(:board_1) { 
        [ [0,0,0,0,0,0],
          [0,0,0,0,0,0],
          [0,0,1,1,1,0],
          [0,1,1,1,0,0],
          [0,0,0,0,0,0],
          [0,0,0,0,0,0]]
      }
      let(:board_2) { 
        [ [0,0,0,0,0,0],
          [0,0,0,1,0,0],
          [0,1,0,0,1,0],
          [0,1,0,0,1,0],
          [0,0,1,0,0,0],
          [0,0,0,0,0,0]]
      }
      it 'should go from board 1 to 2' do
        expect(Life::evolve(board_1)).to eq_board(board_2)
      end
      it 'should go from board 2 to 1' do
        expect(Life::evolve(board_2)).to eq_board(board_1)
      end
    end
  end
  describe 'neighbors' do
    context 'a board with one cell' do
      let(:board) { 
        [ [0,0,0],
          [0,1,0],
          [0,0,0]]
      }
      it 'should return 0 for that cell' do
        expect(Life::neighbors(board,1,1)).to eq(0)
      end
      it 'should return 1 for one of its neighbors' do
        expect(Life::neighbors(board,0,0)).to eq(1)
      end
    end
    context 'a board with three cells' do
      let(:board) { 
        [ [0,0,0],
          [1,1,1],
          [0,0,0]]
      }
      it 'should return 2 for the center cell' do
        expect(Life::neighbors(board,1,1)).to eq(2)
      end
      it 'should return 2 for the center right cell' do
        expect(Life::neighbors(board,2,1)).to eq(2)
      end
      it 'should return 2 for the center left cell' do
        expect(Life::neighbors(board,0,1)).to eq(2)
      end
      it 'should return 3 for the top middle cell' do
        expect(Life::neighbors(board,1,0)).to eq(3)
      end
    end
  end
end
