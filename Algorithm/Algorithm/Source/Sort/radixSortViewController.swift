//
//  radixSortViewController.swift
//  Algorithm
//
//  Created by YNZMK on 2019/12/6.
//  Copyright © 2019 Pata. All rights reserved.
//

import UIKit

class radixSortViewController: UIViewController {
    
//基数排序    https://baike.baidu.com/item/%E5%9F%BA%E6%95%B0%E6%8E%92%E5%BA%8F/7875498?fr=aladdin
    
    var bucketArray = Array<[Int]>(repeating: [Int](), count: 10)
    var tempArray = [120,44,33,2232,111,33,44,22,11,44]
    override func viewDidLoad() {
        super.viewDidLoad()
        getRadixAscSort(sortArray: &tempArray)
        print("基数排序：\(tempArray)")
        // Do any additional setup after loading the view.
    }
    
    func getRadixAscSort(sortArray:inout Array<Int>){
        guard sortArray.count > 0 else {
            print("数组为空")
            return
        }
        //最大值
        let maxValue = sortArray.max()!
        let maxLength = stringToArray(input: maxValue).count
        for digit in 1...maxLength{
            //入桶排序
            for (_,itemValue) in sortArray.enumerated(){
                let baseNum = fetchBaseNumber(dataValue: itemValue, digit: digit)
                bucketArray[baseNum].append(itemValue)
            }
//            print("\(bucketArray)")
            var index = 0
            //把待排序数组进行挪位排序
            for (i,buckItemArray) in bucketArray.enumerated(){
                var swithcArray = buckItemArray
                while swithcArray.count != 0 {
                    let number = swithcArray[0]
                    sortArray[index] = number
                    swithcArray.remove(at: 0)
                    index = index + 1
                }
                //复位桶的i位置为空
                if buckItemArray.count != 0 {
                    bucketArray.replaceSubrange(i ..< i + 1, with: [swithcArray])
                }
            }
//            print("\(sortArray)")
        }
    }
    //整转字节数组
    func stringToArray(input:Int) ->Array<String> {
        return  String(input).map { String($0) }
    }
    
    //取倒数第digit位的数值
    func fetchBaseNumber(dataValue:Int,digit:Int) -> Int {
        let maxLength = stringToArray(input: dataValue).count
        if digit > 0 && digit <= maxLength {
            let returnValue = stringToArray(input: dataValue)[maxLength - digit]
            return Int(returnValue) ?? 0
        }
        return 0
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
