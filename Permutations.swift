import Foundation

func permutations(_ arr: [String]) -> [[String]] {
  if arr.isEmpty  {
   return [[""]]
  }
  
  let firstEl = arr[0] //a / b / c
  let rest = Array(arr[1...])
  let permsWithoutFirst = permutations(rest) //[b,c] / [c] / [] -> [[]] / [[c]] / [[b,c]]
  var allPerms = [[String]]()
  
  for pwf in permsWithoutFirst {
    if !pwf.isEmpty {
      for x in 0..<pwf.count {
      var firstHalf = Array(pwf[..<x])
      let secondHalf = Array(pwf[x...])
      firstHalf.append(firstEl)
      let perm = firstHalf + secondHalf
      allPerms.append(perm)
    }
    }
  }
  
  return allPerms
}
print(permutations(["a","b","c"]))