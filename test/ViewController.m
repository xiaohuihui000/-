//
//  ViewController.m
//  test
//
//  Created by chenguanghui on 2017/8/16.
//  Copyright © 2017年 chenguanghui. All rights reserved.
//

#import "ViewController.h"
#import "SelfFirstImageFilter.h"
#import "GPUImage.h"
#import "LFGPUImageBeautyFilter.h"
#import "SelfImageAmatorkaFilter.h"
#import "GPUImageBeautifyFilter.h"
@interface ViewController ()


@end

@implementation ViewController
{
    GPUImageVideoCamera *camera;
    
    GPUImageOutput<GPUImageInput> *filter;
    
    
    GPUImageView *imgView;
    
    LFGPUImageBeautyFilter *beautyFilter;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    filter = [[GPUImageColorMatrixFilter alloc] init];
    ((GPUImageColorMatrixFilter*)filter).colorMatrix = (GPUMatrix4x4){
        {0.7880, -0.2617, 0.4736, 0.0},
        {0.1000, 1.0318, -0.1318, 0.0},
        {-0.365, 0.4533, 0.9117 ,0.0},
        {0,0,0,1.0},
    };
    
//    UIImage *img = [UIImage imageNamed:@"IMG_5137.jpg"];
//    GPUImagePicture *picture = [[GPUImagePicture alloc] initWithImage:img];
    
    imgView = [[GPUImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:imgView];
    
    
    camera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset1280x720 cameraPosition:AVCaptureDevicePositionFront];
    camera.outputImageOrientation = UIInterfaceOrientationPortrait;
    camera.horizontallyMirrorFrontFacingCamera = YES;
    camera.horizontallyMirrorRearFacingCamera = NO;
    
    
    filter = [[GPUImageCropFilter alloc] init];
    ((GPUImageCropFilter *)filter).cropRegion = CGRectMake(0, 0, 1, 375/667.0);
    
    
    filter = [[GPUImageBeautifyFilter alloc] init];
   
    
    
    filter = [[SelfImageAmatorkaFilter alloc] init];
    ((SelfImageAmatorkaFilter *)filter).selectIndex = 0;


    beautyFilter = [[LFGPUImageBeautyFilter alloc] init];

    
    
    imgView = [[GPUImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:imgView];
    
    [camera addTarget:filter];
    [filter addTarget:beautyFilter];
    [beautyFilter addTarget:imgView];
    

    
    [camera startCameraCapture];




//    GPUImagePicture *picture = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:@"lookup"]];
//    [picture addTarget:beautyFilter];
//    [beautyFilter addTarget:imgView];
//    
//    [beautyFilter useNextFrameForImageCapture];
//    [picture processImage];
//
//    UIImage *image = beautyFilter.imageFromCurrentFramebuffer;
//    [UIImagePNGRepresentation(image) writeToFile:@"/Users/cgh/Desktop/1111.png" atomically:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    

    static int index = 1;
    
    [camera removeAllTargets];
    
    filter = [[SelfImageAmatorkaFilter alloc] init];
    ((SelfImageAmatorkaFilter *)filter).selectIndex = index;
    
    [camera addTarget:filter];
    [filter addTarget:beautyFilter];
    [beautyFilter addTarget:imgView];
    NSLog(@"%d",index);
    index++;
    if (index == 15) {
        index = 0;
    }
    return;

    
    
    
    if (index == 0) {
        ((GPUImageColorMatrixFilter*)filter).colorMatrix = (GPUMatrix4x4){
            {0.7880, -0.2617, 0.4736, 0.0},
            {0.1000, 1.0318, -0.1318, 0.0},
            {-0.365, 0.4533, 0.9117 ,0.0},
            {0,0,0,1.0},
        };
    }
    else if (index == 1){/// 褐色（怀旧）
        ((GPUImageColorMatrixFilter*)filter).colorMatrix = (GPUMatrix4x4){
            {0.3588, 0.7044, 0.1368, 0.0},
            {0.2990, 0.5870, 0.1140, 0.0},
            {0.2392, 0.4696, 0.0912 ,0.0},
            {0,0,0,1.0},
        };
    }
    else if (index == 2){
        ((GPUImageColorMatrixFilter*)filter).colorMatrix = (GPUMatrix4x4){
            {1.1, 0, 0, 0.0},
            {0, 1.1, 0, 0.0},
            {0, 0, 1.2, 0.0},
            {0,0,0,1.0},
        };
    }
    else if (index == 3){
        ((GPUImageColorMatrixFilter*)filter).colorMatrix = (GPUMatrix4x4){
            {1.0250, 0.1350, -0.1600, 0.0},
            {0.0215, 0.9714, 0.0502, 0.0},
            {0.1399, -0.1132, 0.9733 ,0.0},
            {0,0,0,1.0},
        };
    }
    else if (index == 4){
        ((GPUImageColorMatrixFilter*)filter).colorMatrix = (GPUMatrix4x4){
            {0.9510, -0.1133, 0.1622, 0.0},
            {0.0280, 1.0200, -0.0480, 0.0},
            {-0.1334, 0.1350, 0.9984 ,0.0},
            {0,0,0,1.0},
        };
    }
    index ++ ;
    if (index == 5) {
        index = 0;
    }
    NSLog(@"%d",index);
  

}



@end
