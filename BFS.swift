import Foundation

class Node {
  var value: Any 
  var left: Node?
  var right: Node?
  
  init(_ value:Any, _ left:Node? = nil, _ right:Node? = nil) {
    self.value = value
    self.left = left
    self.right = right
  }
}

   //     a
   //    / \
   //   b   c
   //  / \ / \
   // d  e f  g

// var a = Node("a")
// var b = Node("b")
// var c = Node("c")
// var d = Node("d")
// var e = Node("e")
// var f = Node("f")
// var g = Node("g")

var a = Node(2)
var b = Node(2)
var c = Node(2)
var d = Node(2)
var e = Node(2)
var f = Node(2)
var g = Node(2)

a.left = b
a.right = c
b.left = d
b.right = e
c.left = f
c.right = g


func breadthFirstPrint(_ root:Node) {
  var queue = [root]
  
  while queue.count > 0 {
    var curentNode = queue.popLast()
    print(curentNode?.value ?? "")
    
    if let lVal = curentNode?.left {
      queue.insert(lVal, at: 0)
    }
    
    if let rVal = curentNode?.right {
      queue.insert(rVal, at: 0)
    }
    
  }
}

func breadthFirstHasValue(_ root:Node, _ target: String) -> Bool {
  var queue = [root]
  
  while queue.count > 0 {
    var curentNode = queue.popLast()
    if let hasValue = curentNode?.value as? String {
      return true
    }
    if let lVal = curentNode?.left {
      queue.insert(lVal, at: 0)
    }
    
    if let rVal = curentNode?.right {
      queue.insert(rVal, at: 0)
    }
    
  }
  
  return false
}

func breadthFirstSum(_ root:Node) -> Int {
  var queue = [root]
  var sum = 0
  
  while queue.count > 0 {
    var curentNode = queue.popLast()
    if let hasValue = curentNode?.value as? Int {
      sum += hasValue
    }
    
    if let lVal = curentNode?.left {
      queue.insert(lVal, at: 0)
    }
    
    if let rVal = curentNode?.right {
      queue.insert(rVal, at: 0)
    }
    
  }
  
  return sum
}
print(breadthFirstSum(a))
//breadthFirstPrint(a)
//print(breadthFirstHasValue(c, "g"))
//print(breadthFirstHasValue(a, "d"))