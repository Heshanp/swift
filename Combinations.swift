import Foundation

func combinations(_ arr: [String]) -> [[String]] {
  if arr.count == 0  {
   return [arr]
  }
  
  let firstEl = arr[0]
  let rest = Array(arr[1...])
  
  let combsWithoutFirst = combinations(rest) //[[String]]
  var combsWithFirst = [[String]]()
  
  for comb in combsWithoutFirst {
    var combWithFirst = comb
    combWithFirst.append(firstEl)
    combsWithFirst.append(combWithFirst)
  }
  let result = combsWithFirst + combsWithoutFirst
  return result
}

print(combinations(["a","b","c"]))