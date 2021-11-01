class Trie {
    var isEnd = false
    var dict = [Character : Trie]()
}

class WordDictionary {
    let root = Trie()
    
    func addWord(_ word: String) {
        var node = root
        for char in word {
            if node.dict[char] == nil { node.dict[char] = Trie() }
            node = node.dict[char]!
        }
        node.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        return dfs(0, Array(word), root)
    }
    
    func dfs(_ index: Int, _ word: [Character], _ node: Trie) -> Bool {
        if index == word.count { return node.isEnd }
        let char = word[index]
        if char != "." {
            return node.dict[char] != nil && dfs(index + 1, word, node.dict[char]!)
        } else {
            for ch in node.dict.keys {
                if node.dict[ch] != nil && dfs(index + 1, word, node.dict[ch]!) {
                    return true
                }
            }
        }
        
        return false
    }
}