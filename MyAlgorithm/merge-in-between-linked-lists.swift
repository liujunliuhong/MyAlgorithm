//
//  merge-in-between-linked-lists.swift
//  MyAlgorithm
//
//  Created by galaxy on 2021/3/13.
//  Copyright © 2021 yinhe. All rights reserved.
//

import Foundation

fileprivate class ListNode {
    var val: Int
    var next: ListNode?
    
    init() {
        self.val = 0
        self.next = nil
    }
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}


extension Solution {
    public func merge_in_between_linked_lists() {
        let node0 = ListNode(0)
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        node0.next = node1
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node6.next = nil
        
        
        let node00 = ListNode(1000000)
        let node11 = ListNode(1000001)
        let node22 = ListNode(1000002)
        let node33 = ListNode(1000003)
        let node44 = ListNode(1000004)
        node00.next = node11
        node11.next = node22
        node22.next = node33
        node33.next = node44
        node44.next = nil
        
        guard let resultNode = self.mergeInBetween(node0, 2, 5, node00) else { return }
        
        print("aa")
    }
    
    private func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        
        let extra = ListNode(-1)
        extra.next = list1
        
        var pre = extra
        for _ in 0..<a {
            if let node = pre.next {
                pre = node
            }
        }
        
        
        var rightNode = pre
        // right节点
        for _ in (a-1)...(b-1) {
            if let node = rightNode.next {
                rightNode = node
            }
        }
        
        let after = rightNode.next
        
        
        
        
        
        let extra1 = ListNode(-1)
        extra1.next = list2
        
        var pre1 = extra1
        while pre1.next != nil {
            if let next = pre1.next {
                pre1 = next
            }
        }
        pre1.next = after
        
        
        
        
        pre.next = extra1.next
        
        
        return extra.next
        
    }
}

