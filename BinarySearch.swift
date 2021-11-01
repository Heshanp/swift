// Array must be sorted

// O(Log(n)) | O(Log(n)) space
func binarySearch(array: [Int], target: Int) -> Int {
    return recursiveSearch(array, target, 0 , array.count-1)
  }
	
func recursiveSearch(_ array: [Int],_ target: Int,_ leftPointer: Int,_ rightPointer:Int) -> Int {
	if leftPointer > rightPointer {
		return -1
	}
    //Middle of the new range
	var middle = (leftPointer + rightPointer)/2 //5
	var midValue = array[middle] //45
	
	if target == midValue {
		return middle
	}
	else if target > midValue {
		//Value is on right
		return recursiveSearch(array, target, (middle+1) ,rightPointer) 
	} else {
		//Value is on right
		return recursiveSearch(array, target, leftPointer ,(middle-1)) 
	}
}

var array = [0, 1, 21, 33, 45, 45, 61, 71, 72, 73]
print(binarySearch(array: array, target: 33))

// Iterative
// O(Log(n)) | O(1) space
  func binarySearchIterative(array: [Int], target: Int) -> Int {
    var left = 0
		var right = array.count-1
		
		while left <= right {
			var middle = (left+right)/2
			var midVal = array[middle]
			
			if target == midVal {
				return middle
			}
			else if target > midVal {
				left = middle+1
			} else {
				right = middle-1
			}
		} 
    return -1
  }