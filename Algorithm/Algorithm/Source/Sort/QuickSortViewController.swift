//
//  QuickSortViewController.swift
//  Algorithm
//
//  Created by YNZMK on 2019/12/2.
//  Copyright © 2019 Pata. All rights reserved.
//

import UIKit

class QuickSortViewController: UIViewController {

   /******
   实现思路：

   　　1. 从数列中挑出一个元素，称为 "基准"（pivot），

   　　2. 重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分割之后，该基准是它的最后位置。这个称为分割（partition）操作。

   　　3. 递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序。
   　递归的最底部情形，是数列的大小是零或一，也就是永远都已经被排序好了。虽然一直递回下去，但是这个算法总会结束，因为在每次的迭代（iteration）中，它至少会把一个元素摆到它最后的位置去。
   　　复杂度：

   　　平均时间复杂度：O(n^2)

   　　平均空间复杂度：O(nlogn)       O(nlogn)~O(n^2)
　　******/
    var sortArray = [5,10,44,1,19,2,3,4,19,0,44,8,2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quckSort(arry: &sortArray, leftIndex: 0, rightIndex: sortArray.count - 1)
        print("快速排序结果：\(sortArray)")
        // Do any additional setup after loading the view.
    }
    
    func getPartition(arry:inout Array<Int>,leftIndex: Int,rightIndex: Int) -> Int {
        //给变量
        var leftVar = leftIndex
        var rightVar = rightIndex
        //每次的分割Value
        let splitValue = arry[leftIndex]
        while leftVar < rightVar {
            while leftVar < rightVar && splitValue <= arry[rightVar] {
                rightVar = rightVar - 1
            }
            if leftIndex < rightVar {
                arry[leftVar] = arry[rightVar]
            }
            while leftVar < rightVar && arry[leftVar] <= splitValue {
                leftVar = leftVar + 1
            }
            if leftVar < rightVar{
                arry[rightVar] = arry[leftVar]
            }
        }
        arry[leftVar] = splitValue
        return leftVar
    }
    
    func quckSort(arry:inout Array<Int>,leftIndex:Int,rightIndex:Int){
        guard arry.count > 0 else {
            print("数组不能为空！")
            return
        }
        //递归结束条件
        if leftIndex < rightIndex {
            let selectIndex = getPartition(arry: &arry, leftIndex: leftIndex, rightIndex: rightIndex)
            quckSort(arry: &arry, leftIndex: leftIndex, rightIndex: selectIndex - 1)
            quckSort(arry: &arry, leftIndex: selectIndex + 1, rightIndex: rightIndex)
        }
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
