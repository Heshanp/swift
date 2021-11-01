//https://www.youtube.com/watch?v=TDtVagwa3QQ

import Foundation

class Node {
  var data: String
  var next: Node?
  
  init(_ data:String) {
    self.data = data
    self.next = nil
  }
}


class LinkedList {
  var head: Node?
  
  init() {
  self.head = nil
  }
  //Append a value to the list
  func append(_ newNode:Node) {
    guard let head = self.head else {
      self.head = newNode
      return
    }
    
    var curr = head
    while curr.next != nil {
        if let next = curr.next {
          curr = next
        }
    } 
    curr.next = newNode
    
  }
  // Print Nodes
  func printNodes() {
    var str = ""
    var curr = self.head ?? nil
    
    while curr != nil {
      str.append((curr?.data ?? "") + "->") 
      if let next = curr?.next {
          curr = next
        } else {
        curr = nil
      }
    }
    print(str)
  }
  //Check if a value is in the list
  func contains(_ value:String) -> Bool {
    guard let head = self.head else {
      return false
    }
    
    var curr:Node? = head
    while curr != nil {
      if curr?.data == value {
        return true
      }
      curr = curr?.next ?? nil
    }
    return false
  }
  
  func reverse() {
    guard let head = self.head else {
      return
    }
    
    var curr:Node? = head //a
    var previous:Node? = nil
    while curr != nil { //a, b
     let temp = curr?.next //b ,c
     curr?.next = previous //a.next -> nil, b.next -> a
     previous = curr // a, b
     curr = temp // b, c
      //Reach the tail
      if curr == nil {
        self.head = previous
      }
    }
  }
  
  func insert(_ position:String, _ val:String) {
    guard let head = self.head else {
      return
    }
    
    var curr:Node? = head
    while curr != nil {
      if curr?.data == position {
        // Found the position to be inserted
        let newNode = Node(val)
        newNode.next = curr?.next
        curr?.next = newNode
        return
      } 
      
      curr = curr?.next ?? nil
    }
  }
  
  func delete(_ val:String) {
    guard let head = self.head else {
      return
    }
    
    var curr:Node? = head
    var prev:Node? = nil
    while curr != nil {
      if curr?.data == val {
        // No previous node. We are in the head
        // Just repoint the head
        if prev == nil {
          self.head = curr?.next
          return
        }
        prev?.next = curr?.next ?? nil
        return
      } 
      // Keeping track of the previous node to be repointed
      prev = curr
      curr = curr?.next ?? nil
    }
  }
// Delete at index
  func deleteAt(_ position:Int) {
    guard let head = self.head else {
      return
    }
    
    var curr:Node? = head
    var prev:Node? = nil
    var index = 0
    while curr != nil {
      if index == position {
        // No previous node. We are in the head
        // Just repoint the head
        if prev == nil {
          self.head = curr?.next
          return
        }
        prev?.next = curr?.next ?? nil
        return
      } 
      // Keeping track of the previous node to be repointed
      prev = curr
      curr = curr?.next ?? nil
      index += 1
    }
  }
}
//head - a
// curr - a
// previous -a
// a.next - nil
// curr - b
// curr.next = a
// 

var list = LinkedList()
list.append(Node("a"))
list.append(Node("b"))
list.append(Node("c"))
list.append(Node("d"))
//list.printNodes()
//list.insert("b","x")
//list.reverse()
list.delete("d")
list.printNodes()
//print(list.contains("x"))