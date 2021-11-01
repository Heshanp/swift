func numIslands(_ grid: [[Character]]) -> Int {
        var visited = Set<String>()
        var count = 0 
        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                if dfs(r,c, grid, &visited) {
                    count += 1
                }
            }
        }
        
        return count
    }
    
func dfs(_ r: Int,_ c:Int,_ grid: [[Character]],_ visited: inout Set<String>) -> Bool {
    let rows = grid.count
    let cols = grid[0].count
    let rowInbound = 0 <= r && r < rows
    let colInbound = 0 <= c && c < cols
    
    if !rowInbound || !colInbound {
        return false
    }
    
    if String(grid[r][c]) == "0" {
        return false
    }
    
    var key = "\(r),\(c)"
    if visited.contains(key) {
        return false
    }
    visited.insert(key)
    dfs(r+1,c, grid, &visited)
    dfs(r,c+1, grid, &visited)
    dfs(r-1,c, grid, &visited)
    dfs(r,c-1, grid, &visited)
    
    return true
}    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    