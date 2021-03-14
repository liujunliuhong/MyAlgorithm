//
//  kth-node-from-end-of-list-lcci.swift
//  MyAlgorithm
//
//  Created by galaxy on 2021/3/13.
//  Copyright © 2021 yinhe. All rights reserved.
//

import Foundation

/*
 实现一种算法，找出单向链表中倒数第 k 个节点。返回该节点的值。

 注意：本题相对原题稍作改动

 示例：
 输入： 1->2->3->4->5 和 k = 2
 输出： 4
 */

fileprivate class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


extension Solution {
    public func kth_node_from_end_of_list_lcci_test() {
        let node0 = ListNode(1)
        let node1 = ListNode(2)
        let node2 = ListNode(3)
        let node3 = ListNode(4)
        let node4 = ListNode(5)
        node0.next = node1
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = nil
        
        let result = self.kthToLast(node0, 2)
        
        print("haha")
    }
    
//    private func kthToLast(_ head: ListNode?, _ k: Int) -> Int {
//        var stack: [Int] = []
//        var tmp = head
//        while tmp != nil {
//            if let val = tmp?.val { stack.append(val) }
//            tmp = tmp?.next
//        }
//        let index = stack.count - k
//        if index >= stack.count || index < 0 { return 0 }
//        return stack[index]
//    }
    
    private func kthToLast(_ head: ListNode?, _ k: Int) -> Int {
        var tmp1 = head
        var tmp2 = head
        var k = k
        
        while k > 0 {
            tmp1 = tmp1?.next
            k = k - 1
        }
        
        while tmp1 != nil {
            tmp1 = tmp1?.next
            tmp2 = tmp2?.next
        }
        return tmp2?.val ?? 0
    }
}
