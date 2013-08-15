module Life
  def Life.evolve(world)
    world.collect.with_index do |row, y|
      row.collect.with_index do |cell, x|
        case neighbors(world,x,y)
        when 0,1,4..8
          0
        when 2
          cell
        when 3
          1
        end
      end
    end
  end

  def Life.neighbors(world, x, y)
    [
      [-1,-1], [ 0, -1], [ 1, -1],
      [-1, 0],           [ 1,  0],
      [-1, 1], [ 0,  1], [ 1,  1],
    ].inject(0) do |sum, offset|
      new_y = y + offset[1] 
      new_x = x + offset[0] 

      new_y = 0 if new_y >= world.size
      row = world[new_y]
      new_x = 0 if new_x >= row.size

      sum + world[new_y][new_x]
    end
  end
end
