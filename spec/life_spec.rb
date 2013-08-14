require 'spec_helper'

describe Life do
  describe "::neighbors" do
    context "there is one cell in the world" do
      let(:world) do
        [ [0,0,0],
          [0,1,0],
          [0,0,0]]
      end
      it "should return the neighbor count" do
        expect(Life::neighbors(world,1,1)).to eq(0)
        expect(Life::neighbors(world,0,0)).to eq(1)
        expect(Life::neighbors(world,1,0)).to eq(1)
        expect(Life::neighbors(world,2,0)).to eq(1)
        expect(Life::neighbors(world,1,2)).to eq(1)
        expect(Life::neighbors(world,2,2)).to eq(1)
        expect(Life::neighbors(world,1,2)).to eq(1)
        expect(Life::neighbors(world,0,2)).to eq(1)
        expect(Life::neighbors(world,0,1)).to eq(1)
      end
    end
    context "there are two cells in the world" do
      let(:world) do
        [ [0,0,0],
          [0,1,1],
          [0,0,0]]
      end
      it "should return the neighbor count" do
        expect(Life::neighbors(world,1,1)).to eq(1)
        expect(Life::neighbors(world,1,0)).to eq(2)
        expect(Life::neighbors(world,0,1)).to eq(2)
      end
    end
  end
  describe '::evolve' do
    context 'blinker' do
      let(:world1) {
        [ [0,0,0,0,0],
          [0,0,1,0,0],
          [0,0,1,0,0],
          [0,0,1,0,0],
          [0,0,0,0,0] ]
      }
      let(:world2) {
        [ [0,0,0,0,0],
          [0,0,0,0,0],
          [0,1,1,1,0],
          [0,0,0,0,0],
          [0,0,0,0,0] ]
      }
      it 'should blink' do
        expect(Life::evolve(world1)).to eq_board(world2)
        expect(Life::evolve(world2)).to eq_board(world1)
      end
    end
  end
end
