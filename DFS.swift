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

var a = Node("a")
var b = Node("b")
var c = Node("c")
var d = Node("d")
var e = Node("e")
var f = Node("f")
var g = Node("g")


a.left = b
a.right = c
b.left = d
b.right = e
c.left = f
c.right = g

func depthFirstPrint(_ root: Node) {
  var stack = [root] 
  
  while stack.count > 0 {
    var currentNode = stack.popLast()
    print(currentNode?.value ?? "")

    if let rVal = currentNode?.right {
      stack.append(rVal)
    }
    
    if let lVal = currentNode?.left {
      stack.append(lVal)
    } 
  }
}

//Pre order - Print root before children
func depthFirstPrintRecursivePreOrder (_ root: Node?) {
  if let root = root {
    print(root.value)
    depthFirstPrintRecursive(root.left ?? nil)
    depthFirstPrintRecursive(root.right ?? nil)
  }
}

//Post order - Print children before root
func depthFirstPrintRecursivePostOrder (_ root: Node?) {
  if let root = root {
    depthFirstPrintRecursive(root.left ?? nil)
    depthFirstPrintRecursive(root.right ?? nil)
    print(root.value)
  }
}

//In-order - Print node between children
func depthFirstPrintRecursiveInOrder (_ root: Node?) {
  if let root = root {
    depthFirstPrintRecursive(root.left ?? nil)
    print(root.value)
    depthFirstPrintRecursive(root.right ?? nil)
  }
}


depthFirstPrintRecursivePreOrder(a)