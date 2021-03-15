//
//  k_ge_yi_zu_fan_zhuan_lian_biao_by_leetcode_solutio.swift
//  MyAlgorithm
//
//  Created by galaxy on 2021/3/15.
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
    public func k_ge_yi_zu_fan_zhuan_lian_biao_by_leetcode_solutio() {
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
        
        guard let resultNode = self.reverseKGroup(node0, 2) else { return }
    
        print("haha")
    }
    
    private func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let extra = ListNode()
        extra.next = head
        
        var pre: ListNode? = extra
        var end: ListNode? = extra
        
        
        
        while end?.next != nil {
            
            for _ in 0..<k {
                end = end?.next
                if end == nil {
                    return extra.next
                }
            }
            
            let start = pre?.next
            let next = end?.next
            end?.next = nil // 置空
            pre?.next = _reverse(head: start) // 反转子链表
            
            start?.next = next // start跑到最末尾去了，要连接起来
            pre = start
            
            end = pre
        }
        return extra.next
    }
    
    
    // 反转一个链表
    private func _reverse(head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        
        var pre: ListNode? = nil
        var cur: ListNode? = head
        
        while cur != nil {
            let next = cur!.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
}
