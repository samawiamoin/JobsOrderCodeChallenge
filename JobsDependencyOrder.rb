require_relative 'Topological'

def main

puts "Please enter the dependency string in format a,b:c,d:a"
str = gets
outputStr = ""

splitStr = str.split(',')
leftCharArray =  []
rightCharArray = []
dependentNodes = []

splitStr.each do |item|
  if item.include? ":" then
    splitInArray = item.split(':')
    leftCharArray << splitInArray[0]
    dependentNodes << splitInArray[0]
    if splitInArray[1].include? "\n" then
      splitInArray[1].delete!("\n")
    end
    if splitInArray[0] == splitInArray[1]
      raise "Jobs can’t depend on themselves"
      exit(true)
    end
    rightCharArray << splitInArray[1]
    if dependentNodes.include? splitInArray[1]
      if rightCharArray.include?(splitInArray[0])
        ind  = leftCharArray.index(splitInArray[0])
        if rightCharArray[ind] != ""
          raise "Jobs can’t have circular dependencies"
          exit(true)
        end
      end
    end

    splitInArray.clear
  else
    if item.include? "\n" then
      item.delete!("\n")
    end
    leftCharArray << item
    rightCharArray << ""
  end
end
l = leftCharArray.length
topoMatrix = Array.new(l){Array.new(l)}

rightCharArray.each_with_index do |item, i|
  if item != "" then
    rindex = leftCharArray.index(item)
    cindex = i
    topoMatrix[rindex][cindex] = "1"
  end
end

leftCharArray.each_with_index do |item, i|
  colNum = Topological.GetEmptyColNum(topoMatrix, l)
  outputStr = outputStr + leftCharArray[colNum]
  topoMatrix = Topological.RemoveRowFromMatrix(topoMatrix, colNum)
end

puts "Last String: #{outputStr}"

end

main