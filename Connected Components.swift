func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var graph: [[Int]] = Array(repeating: [], count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        
        var seen: Set<Int> = []
        var count = 0
        func dfs(_ node: Int) -> Bool {
            if seen.contains(node) {                
                return false
            }
            seen.insert(node)
            //Explore all the neigbhors of the node
            for neighbor in graph[node] {
                //This goes deeper until it hits the end of a component
                dfs(neighbor)
            }
            // End of exploring all neighbors of the node. Go to the next
            return true
        }
        
        for g in 0..<graph.count {
            if dfs(g) {
                count+=1
            }
        }

        return count
    }