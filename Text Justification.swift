// Explanation
// Scan the words and check if it can be form as a single line under maxWidth. 
// Keep adding words to the line until the length exceeds maxWidth. Once excess is found, form the line following the rules.
// 
// Algorithm
// fullJustify:
// If tempLine exceeds the limit:
    // formLine and append to the output
// else:
    // append words to tempLine
// 
// formLine:
// for each word in words:
    // spaceCount ceiling devidethe len(remaining words) to get the max space can be added
    // update spaceCount
    // form string


func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var output = [String]()
        var tempLine = [String]()
        var tempLineCount = 0
        for idx in 0..<words.count {
            if tempLine.isEmpty {
                tempLine.append(words[idx])
                tempLineCount += words[idx].count
                continue
            }
            if tempLineCount + 1 + words[idx].count > maxWidth {
                output.append(formLine(tempLine, maxWidth - tempLineCount, false))
                tempLine = [words[idx]]
                tempLineCount = words[idx].count
            } else {
                tempLine.append(words[idx])
                tempLineCount += words[idx].count + 1
            }
        }
        if !tempLine.isEmpty {
            output.append(formLine(tempLine, maxWidth - tempLineCount, true))
        }
        return output
    }
    
    func formLine(_ words: [String], _ spaceCount: Int, _ eof: Bool) -> String {
        if !eof {
            var spaceCount = spaceCount
            var str = words[0]
            for i in 1..<words.count {
                let c = (spaceCount + words.count-i - 1) / (words.count-i)
                spaceCount -= c
                str += String(repeating: " ", count: c+1) + words[i]
            }
            if spaceCount != 0 {
                str += String(repeating: " ", count: spaceCount)
            }
            return str
        }
        return words[1...].reduce(words[0]){$0+" \($1)"} + String(repeating: " ", count: spaceCount)
    }