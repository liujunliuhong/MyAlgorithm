//
//  link_add_two_number.swift
//  MyAlgorithm
//
//  Created by galaxy on 2021/3/13.
//  Copyright © 2021 yinhe. All rights reserved.
//

import Foundation

/*
 给你两个 非空 链表来代表两个非负整数。数字最高位位于链表开始位置。它们的每个节点只存储一位数字。将这两数相加会返回一个新的链表。
 你可以假设除了数字 0 之外，这两个数字都不会以零开头。
 
 进阶：
 如果输入链表不能修改该如何处理？换句话说，你不能对列表中的节点进行翻转。
 
 示例：
 输入：(7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 8 -> 0 -> 7
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
    public func link_add_two_numbers_test() {
        let node0 = ListNode(7)
        let node1 = ListNode(2)
        let node2 = ListNode(4)
        let node3 = ListNode(3)
        node0.next = node1
        node1.next = node2
        node2.next = node3
        node3.next = nil
        
        let node00 = ListNode(5)
        let node11 = ListNode(6)
        let node22 = ListNode(4)
        
        node00.next = node11
        node11.next = node22
        node22.next = nil
        
        
        guard let resultNode = self.addTwoNumbers(node0, node00) else { return }
        
        print("haha")
    }
    
    private func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
     
        
        var stack1: [Int] = []
        var stack2: [Int] = []
        
        
        
        var tmp1 = l1
        while tmp1 != nil {
            if let val = tmp1?.val {
                stack1.append(val)
            }
            tmp1 = tmp1?.next
        }
        
        
        var tmp2 = l2
        while tmp2 != nil {
            if let val = tmp2?.val {
                stack2.append(val)
            }
            tmp2 = tmp2?.next
        }
        
        var carry: Int = 0
        var resultNode: ListNode? = nil
        
        // 7 2 4 3
        //   5 6 4
        while carry > 0 || stack1.count > 0 || stack2.count > 0 {
            let a = stack1.count > 0 ? stack1.removeLast() : 0
            let b = stack2.count > 0 ? stack2.removeLast() : 0
            //
            var cur = a + b + carry // 加起来的值
            carry = cur / 10 // 除数(向前进一位)
            cur = cur % 10   // 余数
            //
            let curNode = ListNode(cur)
            curNode.next = resultNode
            //
            resultNode = curNode
        }
        return resultNode
    }
}
