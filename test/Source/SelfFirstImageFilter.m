//
//  SelfFirstImageFilter.m
//  test
//
//  Created by chenguanghui on 2017/8/21.
//  Copyright © 2017年 chenguanghui. All rights reserved.
//

#import "SelfFirstImageFilter.h"


NSString *const kSelfImageColorMatrixFragmentShaderString = SHADER_STRING
(
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 

 
 void main()
 {
     lowp vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);
     
     
     gl_FragColor = vec4(textureColor.r*1.1,textureColor.g*1.1,textureColor.b*1.2,1.0);
 }
 );



@implementation SelfFirstImageFilter




- (instancetype)init{
    if (self = [super initWithFragmentShaderFromString:kSelfImageColorMatrixFragmentShaderString]) {
        
    }
    return self;
}


@end
