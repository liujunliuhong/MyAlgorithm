//
//  merge_intervals.swift
//  MyAlgorithm
//
//  Created by galaxy on 2021/3/14.
//  Copyright © 2021 yinhe. All rights reserved.
//

import Foundation

/*
 以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间。
 
  
 示例 1：
 输入：intervals = [[1,3],[2,6],[8,10],[15,18]]
 输出：[[1,6],[8,10],[15,18]]
 解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
 
 
 
 示例 2：
 输入：intervals = [[1,4],[4,5]]
 输出：[[1,5]]
 解释：区间 [1,4] 和 [4,5] 可被视为重叠区间。
 
 
 提示：
 1 <= intervals.length <= 10000
 intervals[i].length == 2
 0 <= starti <= endi <= 10000

 */
extension Solution {
    public func merge_intervals_test() {
        let intervals = [[1,3],[2,6],[8,10],[15,18]]
        let result = self.merge(intervals)
        print(result)
    }
    
    private func merge(_ intervals: [[Int]]) -> [[Int]] {
        var intervals = intervals
        if intervals.count <= 1 {
            return intervals
        }
        
        // 先根据区间的起始位置排序
        intervals.sort { (s1, s2) -> Bool in
            return s1[0] <= s2[0]
        }
        
        
        var result: [[Int]] = []
        
        
        for index in 0..<intervals.count {
            let left = intervals[index][0]
            let right = intervals[index][1]
            if result.count == 0 || result.last![1] < left {
                // 如果当前区间的左端点在数组 result 中最后一个区间的右端点之后，那么它们不会重合，我们可以直接将这个区间加入数组 result 的末尾
                result.append(intervals[index])
            } else {
                // 否则，它们重合，我们需要用当前区间的右端点更新数组 result 中最后一个区间的右端点，将其置为二者的较大值。
                var last = result.last!
                last[1] = max(last[1], right)
                result[result.count - 1] = last
            }
        }
        
        return result
    }
}
