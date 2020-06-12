//
//  main.swift
//  MyAlgorithm
//
//  Created by 银河 on 2019/9/11.
//  Copyright © 2019 yinhe. All rights reserved.
//

import Foundation

print("Hello, World!")


/*
let nums: [Int] = [12312, 123, 32432 , 123, 342, 243, 5645, 122, 654, 345, 201]
let target = 324
TwoSum.twoSum(nums: nums, target: target)
*/

/*
let m = MaxSubString.maxSubString(string: "abccdefggrf")
print(m)
*/


/*
let convertString = string_z_convert(string: "abcdefghijklmnopqrst", numRows: 4)
print("\(convertString)")
*/


let newValue = int_reverse(12345)
print("\(newValue)")









var s = "123456789"

let startIndex = s.startIndex
let endIndex = s.endIndex

let index1 = s.index(startIndex, offsetBy: 2)
let index2 = s.index(startIndex, offsetBy: 2+2)


let subString = s[index1..<index2]

print("\(subString)")


let subString1 = (s as NSString).substring(with: NSRange(location: 2, length: 2)) as String
print("\(subString1)")



























