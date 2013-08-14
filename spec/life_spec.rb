require 'spec_helper'

describe Life do
  describe 'neighbors' do
    context 'when one cell is in the world' do
      let(:world) do 
        [ [0,0,0],
          [0,1,0],
          [0,0,0]]
      end
      it 'should have no neighbors' do
        expect(Life::neighbors(world,1,1)).to eq(0)
      end
      it 'its neighbors should have one neighbor' do
        expect(Life::neighbors(world,0,0)).to eq(1)
        expect(Life::neighbors(world,1,0)).to eq(1)
        expect(Life::neighbors(world,2,0)).to eq(1)
        expect(Life::neighbors(world,0,1)).to eq(1)
        expect(Life::neighbors(world,2,1)).to eq(1)
        expect(Life::neighbors(world,0,2)).to eq(1)
        expect(Life::neighbors(world,1,2)).to eq(1)
        expect(Life::neighbors(world,2,2)).to eq(1)
      end
    end
    context 'when two cells are in the world' do
      let(:world) do 
        [ [0,0,0],
          [0,1,1],
          [0,0,0]]
      end
      it 'should have no neighbors' do
        expect(Life::neighbors(world,1,1)).to eq(1)
      end
      it 'return the neighbors' do
        expect(Life::neighbors(world,0,0)).to eq(2)
        expect(Life::neighbors(world,1,0)).to eq(2)
        expect(Life::neighbors(world,2,0)).to eq(2)
        expect(Life::neighbors(world,0,1)).to eq(2)
        expect(Life::neighbors(world,2,1)).to eq(1)
        expect(Life::neighbors(world,0,2)).to eq(2)
        expect(Life::neighbors(world,1,2)).to eq(2)
        expect(Life::neighbors(world,2,2)).to eq(2)
      end
    end
  end
  describe 'evolve' do
    context 'when the world is barren' do
      let(:world) do 
        [ [0,0,0],
          [0,0,0],
          [0,0,0]]
      end
      it 'should  be idempotent' do
        expect(Life::evolve(world)).to eq_board(world)
      end
    end
    context 'when the world is a blinker' do
      let(:blinker1) do 
        [ [0,0,0,0,0],
          [0,0,1,0,0],
          [0,0,1,0,0],
          [0,0,1,0,0],
          [0,0,0,0,0]]
      end
      let(:blinker2) do 
        [ [0,0,0,0,0],
          [0,0,0,0,0],
          [0,1,1,1,0],
          [0,0,0,0,0],
          [0,0,0,0,0]]
      end
      it 'should blink' do
        expect(Life::evolve(blinker1)).to eq_board(blinker2)
        expect(Life::evolve(blinker2)).to eq_board(blinker1)
      end
    end
  end
end
