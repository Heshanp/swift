func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        // subRoot is null, it is a sub tree
        guard let subRoot = subRoot else {            
            return true
        }
        // root is null, nothing to check against
        guard let root = root else {
            return false
        }
        // both trees are same
        if sameTree(root,subRoot) {
            return true
        } else {
            // if not same tree, go to left and right to see if the subRoot exists
            return isSubtree(root.left,subRoot) || isSubtree(root.right,subRoot)
        }
        
        return false
    }
    
    func sameTree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
         // If both empty then it's a subtree
         if root == nil && subRoot == nil {
            return true
         }
         // Checking if either one is empty
         if let root = root, let subRoot = subRoot, root.val == subRoot.val {
            return sameTree(root.left,subRoot.left) && sameTree(root.right,subRoot.right)
         }
        return false
    }