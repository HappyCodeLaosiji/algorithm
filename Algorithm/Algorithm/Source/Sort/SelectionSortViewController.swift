//
//  SelectionSortViewController.swift
//  Algorithm
//
//  Created by YNZMK on 2019/11/26.
//  Copyright © 2019 Pata. All rights reserved.
//

import UIKit

class SelectionSortViewController: UIViewController {

    /*
     　　实现思路：
     　　 1. 设数组内存放了n个待排数字，数组下标从1开始，到n结束。
     　　 2. i=1
     　　 3. 从数组的第i个元素开始到第n个元素，寻找最小的元素。（具体过程为:先设arr[i]为最小，逐一比较，若遇到比之小的则交换）
     　　 4. 将上一步找到的最小元素和第i位元素交换。
     　　 5. 如果i=n－1算法结束，否则回到第3步
      
       　复杂度：
     　　平均时间复杂度：O(n^2)
     　　平均空间复杂度：O(1)
     */
    var sortArray = [1,2,3,4,5,10,44,19,19]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sortByDes()
    }
    
    //降序
    func sortByDes(){
        var i = 0
         while i < sortArray.count {
             var j = i + 1
             while j<sortArray.count {
                 if sortArray[i] < sortArray[j]{
                     let tmp = sortArray[i]
                     sortArray[i] = sortArray[j]
                     sortArray[j] = tmp
                 }
                 j = j + 1
             }
             i = i + 1
         }
         print("排序结果：\(sortArray)")
    }
    
    //升序
    func sortByAsc(){
        var i = 0
        while i < sortArray.count {
            var j = i + 1
            while j<sortArray.count {
                if sortArray[i] > sortArray[j]{
                    let tmp = sortArray[i]
                    sortArray[i] = sortArray[j]
                    sortArray[j] = tmp
                }
                j = j + 1
            }
            i = i + 1
        }
        print("排序结果：\(sortArray)")
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
