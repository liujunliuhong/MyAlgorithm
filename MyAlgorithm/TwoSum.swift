//
//  TwoSum.swift
//  MyAlgorithm
//
//  Created by 银河 on 2019/9/24.
//  Copyright © 2019 yinhe. All rights reserved.
//

import Foundation

struct TwoSumResult {
    let first: Int
    let second: Int
    init(first: Int, second: Int) {
        self.first = first
        self.second = second
    }
}

extension TwoSumResult: Equatable {
    static func ==(lhs: TwoSumResult, rhs: TwoSumResult) -> Bool {
        return (lhs.first == rhs.first && lhs.second == rhs.second) || (lhs.first == rhs.second && lhs.second == rhs.first)
    }
}


/**
 两数之和
 https://leetcode-cn.com/problems/two-sum/
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数
 
 示例:

 给定 nums = [2, 7, 11, 15,  6,  3],    target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 nums[4] + nums[5] = 2 + 7 = 9
 所以返回 [2, 7]  [6,  3]
 */
struct TwoSum {
    // 允许输入的nums中的值重复，比如[2, 7, 4, 5, 4, 4, 6]
    // 该方法是我自己的完善版本
    static func twoSum(nums: [Int], target: Int) {
        let time1 = CFAbsoluteTimeGetCurrent()
        var map: Dictionary<Int, Int> = [:]
        
        var results: [TwoSumResult] = [TwoSumResult]()
        
        for (index, value) in nums.enumerated() {
            let tmp = target - value
            if map.keys.contains(tmp) {
                let result = TwoSumResult(first: value, second: tmp)
                if !results.contains(result) {
                    results.append(result)
                }
            } else {
                map.updateValue(index, forKey: value)
            }
        }
        let time2 = CFAbsoluteTimeGetCurrent()
        print("耗时:\(time2 - time1)")
        if results.count <= 0 {
            print("无结果")
        } else {
            for (_, result) in results.enumerated() {
                print("[\(result.first), \(result.second)]")
            }
        }
    }
    
    // 该方法是leetcode上的阶梯步骤
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var map: Dictionary<Int, Int> = [:]
        
        for (index, value) in nums.enumerated() {
            let tmp = target - value
            if map.keys.contains(tmp) {
                return [map[tmp]!, index]
            } else {
                map.updateValue(index, forKey: value)
            }
        }
        return [-1, -1]
    }
}
