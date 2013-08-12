require 'spec_helper'

describe Life do
  describe '::evolve' do
    context 'given an empty world' do
      let(:world) {
        [ [0,0,0],
          [0,0,0],
          [0,0,0]]
      }
      it 'is idempotent' do
        expect(Life::evolve(world)).to eq(world)
      end
    end

    context 'given a blinker world' do
      let(:blinker_world1) {
        [ [0,0,0,0,0],
          [0,0,0,0,0],
          [0,1,1,1,0],
          [0,0,0,0,0],
          [0,0,0,0,0]]
      }
      let(:blinker_world2) {
        [ [0,0,0,0,0],
          [0,0,1,0,0],
          [0,0,1,0,0],
          [0,0,1,0,0],
          [0,0,0,0,0]]
      }
      it 'should blink' do
        expect(Life::evolve(blinker_world1)).to eq_board(blinker_world2)
      end
    end
  end
  describe '::neighbors' do
    context 'given an empty world' do
      let(:world) {
        [ [0,0,0],
          [0,0,0],
          [0,0,0]]
      }
      specify 'the center cell should have no neighbors' do
        expect(Life::neighbors(world,1,1)).to eq(0)
      end
    end
    context 'given a world with 1 cell' do
      let(:world) {
        [ [0,0,0,0,0],
          [0,0,0,0,0],
          [0,0,1,0,0],
          [0,0,0,0,0],
          [0,0,0,0,0]]
      }
      specify 'the center cell should have no neighbors' do
        expect(Life::neighbors(world,2,2)).to eq(0)
      end
      specify 'a neighbor to the center cell should have one neighbors' do
        expect(Life::neighbors(world,3,2)).to eq(1)
      end
    end
    context 'given a world with 1 cell on the edge' do
      let(:world) {
        [ [0,0,0,0,0],
          [0,0,0,0,0],
          [1,0,0,0,0],
          [0,0,0,0,0],
          [0,0,0,0,0]]
      }
      specify 'the cell on the other side should have a neighbor' do
        expect(Life::neighbors(world,4,2)).to eq(1)
      end
    end
  end      
end
