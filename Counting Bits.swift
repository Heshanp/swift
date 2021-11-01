 func countBits(_ n: Int) -> [Int] {
        var bits = [Int]()
        for x in 0...n {
            bits.append(countOnes(x))
        }        
        return bits
    }
    
    func countOnes(_ n:Int) -> Int {
        var n = n
        var rem = 0 
        while n != 0 {
            rem += n%2
            n = n/2
        }
        
        return rem
    }