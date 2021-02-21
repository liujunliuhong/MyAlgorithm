//
//  MutiSum.swift
//  MyAlgorithm
//
//  Created by galaxy on 2021/2/21.
//  Copyright © 2021 yinhe. All rights reserved.
//

import Foundation
/*
 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 candidates 中的数字可以无限制重复被选取。
 
 说明：
 所有数字（包括 target）都是正整数。
 解集不能包含重复的组合。
 
 
 示例 1：
 输入：candidates = [2,3,6,7], target = 7,
 所求解集为：
 [
 [7],
 [2,2,3]
 ]
 
 
 
 示例 2：
 输入：candidates = [2,3,5], target = 8,
 所求解集为：
 [
   [2,2,2,2],
   [2,3,3],
   [3,5]
 ]
  
 
 提示：
 1 <= candidates.length <= 30
 1 <= candidates[i] <= 200
 candidate 中的每个元素都是独一无二的。
 1 <= target <= 500
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/combination-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */



// 回溯法
class MutiSum {
    var results: [[Int]] = []
    var temps: [Int] = []
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.count <= 0 || target < 0 {
            return self.results
        }
        self.process(start: 0, candidates: candidates, target: target)
        return self.results
    }
    
    func process(start: Int, candidates: [Int], target: Int) {
        if target < 0 {
            return
        }
        if target == 0 {
            self.results.append(self.temps)
        } else {
            for (index, num) in candidates.enumerated() {
                if index < start { continue }
                self.temps.append(num)
                self.process(start: index, candidates: candidates, target: target - candidates[index])
                self.temps.removeLast()
            }
        }
    }
}
