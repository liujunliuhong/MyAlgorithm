//
//  lru_cache.swift
//  MyAlgorithm
//
//  Created by galaxy on 2021/3/14.
//  Copyright © 2021 yinhe. All rights reserved.
//

import Foundation

/*
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制 。
 实现 LRUCache 类：

 LRUCache(int capacity) 以正整数作为容量 capacity 初始化 LRU 缓存
 int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
 void put(int key, int value) 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字-值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。
  

 进阶：你是否可以在 O(1) 时间复杂度内完成这两种操作？

  

 示例：
 输入
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 输出
 [null, null, null, 1, null, -1, null, -1, 3, 4]

 解释
 LRUCache lRUCache = new LRUCache(2);
 lRUCache.put(1, 1); // 缓存是 {1=1}
 lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
 lRUCache.get(1);    // 返回 1
 lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
 lRUCache.get(2);    // 返回 -1 (未找到)
 lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
 lRUCache.get(1);    // 返回 -1 (未找到)
 lRUCache.get(3);    // 返回 3
 lRUCache.get(4);    // 返回 4

 */

fileprivate class Node {
    var key: Int
    var value: Int
    var pre: Node?
    var next: Node?
    
    init() {
        self.key = 0
        self.value = 0
        self.pre = nil
        self.next = nil
    }
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
        self.pre = nil
        self.next = nil
    }
}

class LRUCache {

    fileprivate var table: [Int: Node] = [:]
    
    private var size: Int
    private let capacity: Int
    private lazy var head: Node = Node()
    private lazy var tail: Node = Node()
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.size = 0
        
        self.head.pre = nil
        self.head.next = self.tail
        
        self.tail.pre = self.head
        self.tail.next = nil
    }
    
    func get(_ key: Int) -> Int {
        if let result = self.table[key] {
            // 如果key在哈希表里面存在，则把该节点移动到头部，并且返回值
            self.moveToHead(node: result)
            return result.value
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let result = self.table[key] {
            // 如果key存在，定位哈希表，并且把该节点移动到头部
            result.value = value
            self.moveToHead(node: result)
        } else {
            // 初始化一个Node
            let node = Node(key: key, value: value)
            // 添加进表
            self.table[key] = node
            // 添加进链表头部
            self.addToHead(node: node)
            // size + 1
            self.size += 1
            // 判断size是否大于capacity
            if self.size > self.capacity {
                // 删除链表尾部
                let tailNode = self.removeTail()
                // 同时删除表里面的数据
                self.table.removeValue(forKey: tailNode.key)
                // size - 1
                self.size -= 1
            }
        }
    }
}

extension LRUCache {
    private func addToHead(node: Node) {
        let tmpNext = self.head.next
        
        node.pre = self.head // <-
        node.next = tmpNext // ->
        
        tmpNext?.pre = node // <-
        self.head.next = node // ->
    }
    
    private func removeNode(node: Node) {
        let tmpNext = node.next
        node.pre?.next = tmpNext
        tmpNext?.pre = node.pre
    }
    
    private func moveToHead(node: Node) {
        self.removeNode(node: node)
        self.addToHead(node: node)
    }
    
    private func removeTail() -> Node {
        let tmpPre = self.tail.pre!
        self.removeNode(node: tmpPre)
        return tmpPre
    }
}
