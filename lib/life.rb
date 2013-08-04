require 'matrix'
module Life
  def Life.simulate(array)
    puts "\n"+array.inspect.split("],").join("],\n")
    evolve(array)
  end

  def Life.evolve(array)
    array.collect.with_index do |row, y|
      row.collect.with_index do |_,x|
        case neighbors(array,x,y)
        when 0,1,4..8
          0
        when 2
          array[y][x]
        when 3
          1
        end
      end
    end
  end

  def Life.neighbors(array,x,y)
    [ 
      [-1,-1], [0,-1], [1,-1],
      [-1, 0],         [1, 0],
      [-1, 1], [0, 1], [1, 1]
    ].inject(0) do |sum, direction|
      neighbor_x = x + direction[0]
      neighbor_y = y + direction[1]
      neighbor_y = 0 if neighbor_y >= array.size
      row = array[neighbor_y]
      neighbor_x = 0 if neighbor_x >= row.size
      sum + row[neighbor_x]
    end
  end
end
