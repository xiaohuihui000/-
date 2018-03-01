//
//  SelfImageAmatorkaFilter.m
//  test
//
//  Created by chenguanghui on 2017/8/23.
//  Copyright © 2017年 chenguanghui. All rights reserved.
//

#import "SelfImageAmatorkaFilter.h"
#import "GPUImageAmatorkaFilter.h"
#import "GPUImagePicture.h"
#import "GPUImageLookupFilter.h"
@implementation SelfImageAmatorkaFilter
{
    NSMutableArray *imgArray;
}

- (id)init;
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    imgArray = [NSMutableArray array];
    [imgArray addObject:@"初夏"];
    [imgArray addObject:@"唯美"];
    [imgArray addObject:@"洛可可"];
    [imgArray addObject:@"甜美可人"];
    [imgArray addObject:@"粉黛"];
    [imgArray addObject:@"自然"];
    [imgArray addObject:@"花颜"];
    [imgArray addObject:@"萤彩"];
    [imgArray addObject:@"蓝调"];
    [imgArray addObject:@"蜜柚"];
    [imgArray addObject:@"霏颜"];
    [imgArray addObject:@"黑白"];
    [imgArray addObject:@"柳丁"];
    [imgArray addObject:@"迷幻"];
    [imgArray addObject:@"清凉"];


    
//#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
//    UIImage *image = [UIImage imageNamed:@"IMG_0222.JPG"];
//#else
//    NSImage *image = [NSImage imageNamed:@"lookup_amatorka.png"];
//#endif
//    
//    NSAssert(image, @"To use GPUImageAmatorkaFilter you need to add lookup_amatorka.png from GPUImage/framework/Resources to your application bundle.");
//    
//    lookupImageSource = [[GPUImagePicture alloc] initWithImage:image];
//    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
//    [self addFilter:lookupFilter];
//    
//    [lookupImageSource addTarget:lookupFilter atTextureLocation:1];
//    [lookupImageSource processImage];
//    
//    self.initialFilters = [NSArray arrayWithObjects:lookupFilter, nil];
//    self.terminalFilter = lookupFilter;
    
    
    
    return self;
}

- (void)setSelectIndex:(NSInteger)selectIndex{
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.JPG",imgArray[selectIndex]]];
    NSAssert(image, @"To use GPUImageAmatorkaFilter you need to add lookup_amatorka.png from GPUImage/framework/Resources to your application bundle.");

    lookupImageSource = [[GPUImagePicture alloc] initWithImage:image];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [self addFilter:lookupFilter];

    [lookupImageSource addTarget:lookupFilter atTextureLocation:1];
    [lookupImageSource processImage];

    self.initialFilters = [NSArray arrayWithObjects:lookupFilter, nil];
    self.terminalFilter = lookupFilter;
    _selectIndex = selectIndex;
}

@end
