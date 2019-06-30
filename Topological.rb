class Topological
  def self.GetEmptyColNum(topoMatrix, arrLength)
    colNum = 0;
    topoMatrix.each_with_index do |sub,col|
      nilCount = 0
      sub.each_with_index { |item,row |
        if topoMatrix[row][col] == "0" && topoMatrix[col][row] == "0" then
          next
        end
        if topoMatrix[row][col] == nil || topoMatrix[row][col] == "0" then
          nilCount = nilCount + 1
          if nilCount == arrLength
            colNum = col
            break
          end
        end
      }
      if nilCount == arrLength
        break
      end
    end
    colNum
  end

  def self.RemoveRowFromMatrix(topoMatrix, rowNum)
    topoMatrix.each_with_index do |item,col|
      topoMatrix[rowNum][col] = "0"
    end
    topoMatrix
  end
end