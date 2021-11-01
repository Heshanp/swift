    // Recall that a graph, G, is a tree iff the following two conditions are met:
// 
// G is fully connected. In other words, for every pair of nodes in G, there is a path between them.
// G contains no cycles. In other words, there is exactly one path between each pair of nodes in G.
// Depth-first search is a classic graph-traversal algorithm that can be used to check for both of these conditions:
// 
// G is fully connected if, and only if, we started a depth-first search from a single source and discovered all nodes in G during it.
// G contains no cycles if, and only if, the depth-first search never goes back to an already discovered node. 

    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        guard edges.count == n-1 else { return false }

        var graph = [Int:[Int]]()
        //[[0,1],[0,2],[0,3],[1,4]]
        for edge in edges {
           createAdjList(edge, &graph)
        }
        
        var visited = Set<Int>()
        dfs(graph,0, &visited)
        //print(visited)
        return visited.count == n
    }
    
    func createAdjList(_ edge:[Int],_ adjList: inout [Int:[Int]]) {
        var first = edge[0]
        var second = edge[1]
        
        if adjList[first] == nil {
            adjList[first] = []
        }
        
        if adjList[second] == nil {
            adjList[second] = []
        }
        
        var x = adjList[first] ?? [first]
        x.append(second)
        var y = adjList[second] ?? [second]
        y.append(first)
        
        adjList[first] = x
        adjList[second] = y
    }
    
    func dfs(_ graph: [Int:[Int]],_ source: Int,_ visited: inout Set<Int>) {        
        if visited.contains(source) {
           return 
        }
        visited.insert(source)
        if let curr = graph[source] {
            for n in curr {
                //We need to be careful though not to count trivial cycles of the form A → B → A that occur with most implementations of undirected edges.
                if n == source { continue }
                    dfs(graph,n,&visited)                
            }
        }
    }

// Solution Type -2 
 func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        guard edges.count == n-1 else { return false }

        var graph: [[Int]] = Array(repeating: [], count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }

        var seen: Set<Int> = []

        func hasCycle(node: Int, parent: Int) -> Bool {
            if seen.contains(node) { return true }
            seen.insert(node)
            for neighbor in graph[node] {
                if neighbor == parent { continue }
                if hasCycle(node: neighbor, parent: node) {
                    return true
                }
            }
            return false
        }
        
        return !hasCycle(node: 0, parent: -1) && seen.count == n
    }






