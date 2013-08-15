require 'spec_helper'

describe Life do
  describe '::neighbors' do
    context 'a world with one cell' do
      let (:world) {
        [ [0,0,0],
          [0,1,0],
          [0,0,0] ]
      }
      specify 'the cell has no neighbors' do
        expect(Life::neighbors(world,1,1)).to eq(0)
      end
      specify 'the neighbors of the alive cell have one neighbor' do
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
  end
  describe '::evolve' do
    context 'empty world' do
      let (:world) {
        [ [0,0,0],
          [0,0,0],
          [0,0,0] ]
      }
      it 'should not change' do
        expect(Life::evolve(world)).to eq_world(world)
      end
    end
    context 'blinker' do
      let (:world1) {
        [ [0,0,0,0,0],
          [0,0,1,0,0],
          [0,0,1,0,0],
          [0,0,1,0,0],
          [0,0,0,0,0] ]
      }
      let (:world2) {
        [ [0,0,0,0,0],
          [0,0,0,0,0],
          [0,1,1,1,0],
          [0,0,0,0,0],
          [0,0,0,0,0] ]
      }
      it 'should not change' do
        expect(Life::evolve(world1)).to eq_world(world2)
      end
    end
  end
end
