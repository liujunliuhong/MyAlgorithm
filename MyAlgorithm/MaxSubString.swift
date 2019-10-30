//
//  MaxSubString.swift
//  MyAlgorithm
//
//  Created by apple on 2019/9/25.
//  Copyright © 2019 yinhe. All rights reserved.
//

import Foundation

struct MaxSubString {
    // 滑动窗口
    // https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/solution/hua-dong-chuang-kou-by-powcai/
    static func maxSubString(string: String) -> String {
        if string.count == 0 {
            return ""
        }
        
        var map: Dictionary<String, Int> = [:]
        
        var maxLength: Int = 0
        var left: Int = 0
        
        for (index, char) in string.enumerated() {
            if map.keys.contains(char.description) {
                
//                let startIndex = string.index(string.startIndex, offsetBy: left)
//                let endIndex = string.index(string.startIndex, offsetBy: left+maxLength)
//
//                let ss = String(string[startIndex..<endIndex])
//                print(ss)
                
                left = max(left, map[char.description]!+1)
                
            }
            map.updateValue(index, forKey: char.description)
            maxLength = max(maxLength, index - left + 1)
        }
        
        return ""
    }
}
