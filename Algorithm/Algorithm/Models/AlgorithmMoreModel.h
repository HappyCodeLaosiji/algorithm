//
//  AlgorithmMoreModel.h
//  Algorithm
//
//  Created by Neroscofee on 2019/11/26.
//  Copyright © 2019 Pata. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 请在AlgorithmMore.plist添加对应的算法名与编写人
 */

NS_ASSUME_NONNULL_BEGIN

@interface AlgorithmMoreModel : NSObject

/** 算法名 */
@property (nonatomic, copy) NSString *algorithmName;
/** 编写人 */
@property (nonatomic, copy) NSString *author;

@end

@interface AlgorithmMoreManager : NSObject

@property (nonatomic, strong) NSMutableArray *moreItemModels;

@end

NS_ASSUME_NONNULL_END
