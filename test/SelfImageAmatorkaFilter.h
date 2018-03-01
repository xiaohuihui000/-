//
//  SelfImageAmatorkaFilter.h
//  test
//
//  Created by chenguanghui on 2017/8/23.
//  Copyright © 2017年 chenguanghui. All rights reserved.
//

#import "GPUImageFilterGroup.h"

@class GPUImagePicture;

@interface SelfImageAmatorkaFilter : GPUImageFilterGroup
{
    GPUImagePicture *lookupImageSource;
}

@property(nonatomic , assign) NSInteger selectIndex;

@end
