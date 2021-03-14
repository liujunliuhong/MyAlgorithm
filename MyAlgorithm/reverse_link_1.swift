//
//  reverse_link_1.swift
//  MyAlgorithm
//
//  Created by galaxy on 2021/3/12.
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
    public func reverse_link_test() {
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
        
        guard let resultNode = self.reverseBetween(node0, 2, 4) else { return }
    
        print("haha")
    }
    //
    
    
    
    // 单向链表反转
    /*
     head: 1 -> 2 -> 3 -> 4 -> 5 -> nil
     
     pre = nil
     cur = head (1 -> 2 -> 3 -> 4 -> 5 -> nil)
     
     第一轮循环
     next = cur.next (next: 2 -> 3 -> 4 -> 5 -> nil)
     cur.next = pre (cur: 1 -> nil)
     pre = cur (pre: 1 -> nil)
     cur = next (cur: 2 -> 3 -> 4 -> 5 -> nil)
     
     
     第二轮循环
     next = cur.next (next: 3 -> 4 -> 5 -> nil)
     cur.next = pre (cur: 2 -> 1 -> nil)
     pre = cur (pre: 2 -> 1 -> nil)
     cur = next (cur: 3 -> 4 -> 5 -> nil)
     
     
     第三轮循环
     next = cur.next (next: 4 -> 5 -> nil)
     cur.next = pre (cur: 3 -> 2 -> 1 -> nil)
     pre = cur (pre: 3 -> 2 -> 1 -> nil)
     cur = next (cur: 4 -> 5 -> nil)
     
     第四轮循环
     next = cur.next (next:  5 -> nil)
     cur.next = pre (cur: 4 -> 3 -> 2 -> 1 -> nil)
     pre = cur (pre:4 -> 3 -> 2 -> 1 -> nil)
     cur = next (cur: 5 -> nil)
     
     第四轮循环
     next = cur.next (next:  nil)
     cur.next = pre (cur: 5 -> 4 -> 3 -> 2 -> 1 -> nil)
     pre = cur (pre: 5 -> 4 -> 3 -> 2 -> 1 -> nil)
     cur = next (cur: nil)
     */
    private func reverseLinkedList(head: ListNode?, bind: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        
        var pre: ListNode? = bind
        var cur: ListNode? = head
        
        while cur != nil {
            let next = cur!.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    
    
    
    
    
    private func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == right {
            return head
        }
        
        // 初始化一个虚拟节点，该节点的next指向head
        let extra = ListNode(-1)
        extra.next = head
        
        
        
        var pre = extra
        // left节点的前一个节点
        for _ in 0..<(left-1) {
            if let node = pre.next {
                pre = node
            }
        }
        
        
        
        var rightNode = pre
        // right节点
        for _ in left...right {
            if let node = rightNode.next {
                rightNode = node
            }
        }
        
        
        // 截取子链表
        let splitNode = pre.next
        let curr = rightNode.next
        
        pre.next = nil
        rightNode.next = nil
        
        guard let reverseNode = self.reverseLinkedList(head: splitNode, bind: curr) else { return head }
        
        pre.next = reverseNode
        
        return extra.next
    }
}
