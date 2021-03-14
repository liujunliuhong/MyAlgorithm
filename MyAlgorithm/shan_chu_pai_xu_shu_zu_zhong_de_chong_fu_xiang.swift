//
//  shan_chu_pai_xu_shu_zu_zhong_de_chong_fu_xiang.swift
//  MyAlgorithm
//
//  Created by galaxy on 2021/3/14.
//  Copyright © 2021 yinhe. All rights reserved.
//

import Foundation

/*
 给定一个排序数组，你需要在 原地 删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

  

 示例 1:
 给定数组 nums = [1,1,2],
 函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。
 你不需要考虑数组中超出新长度后面的元素。
 
 
 
 示例 2:
 给定 nums = [0,0,1,1,1,2,2,3,3,4],
 函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。
 你不需要考虑数组中超出新长度后面的元素。
 
 */

extension Solution {
    public func shan_chu_pai_xu_shu_zu_zhong_de_chong_fu_xiang_test() {
        var nums: [Int] = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
        let count = self.removeDuplicates(&nums)
        print("\(count)")
    }
    
    // 双指针
    private func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 || nums.count == 1 {
            return nums.count
        }
        var i: Int = 0
        var j: Int = 1
        for _ in j..<nums.count {
            if nums[j] != nums[i] {
                i += 1
                nums[i] = nums[j]
            }
            j += 1
        }
        return i + 1 // i是从0开始计数的，所以最后的数量是i+1
    }
}
