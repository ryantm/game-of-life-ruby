module Life
  def Life.evolve(world)
    world.collect.with_index do |row, y|
      world.collect.with_index do |cell, x|
        case neighbors(world,x,y)
        when 0,1,4..8
          0
        when 2
          world[y][x]
        when 3
          1
        end
      end
    end
  end

  def Life.neighbors(world, x, y)
    [ 
      [-1, -1], [ 0, -1], [1, -1],
      [-1,  0],           [1,  0],
      [-1,  1], [ 0,  1], [1,  1]
    ].inject(0) do |sum, offset|
      x_offset = x + offset[0]
      y_offset = y + offset[1]
      y_offset = 0 if y_offset >= world.size
      row = world[y_offset]
      x_offset = 0 if x_offset >= row.size
      sum + row[x_offset]
    end
  end
end
