    func missingNumber(_ nums: [Int]) -> Int {
        var expectedSum = nums.count*(nums.count + 1)/2
        var actualSum = nums.reduce(0, +)       
        return expectedSum - actualSum
    }