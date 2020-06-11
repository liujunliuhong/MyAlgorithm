//
//  int_reverse.swift
//  MyAlgorithm
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation

/*
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

 示例 1:
 输入: 123
 输出: 321
 
 
 示例 2:
 输入: -123
 输出: -321
 
 
 示例 3:
 输入: 120
 输出: 21
 
 注意:
 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-integer
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func int_reverse(_ x: Int) -> Int {
    var x = x
    
    // 如果传入的数字不符合规定，直接返回0
    if x > Int32.max || x < Int32.min {
        return 0
    }
    
    
    var result: Int64 = 0 // 以Int64来存
    while x != 0 {
        let tmp = x % 10 // 每次都取末尾的数字，取模
        result = result * 10 + Int64(tmp)
        x = x / 10 // 把末尾的数字移除掉
    }
    
    if result > Int32.max || result < Int32.min {
        return 0
    }
    
    return Int(result)
}


