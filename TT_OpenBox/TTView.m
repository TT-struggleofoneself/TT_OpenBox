//
// 
// 
//
// 
//
//

#import "TTView.h"


typedef NS_ENUM(NSUInteger, TTRotatedirection){
    TTRotatedirectionX = 0,//今天
    TTRotatedirectionY,//昨天
    TTRotatedirectionZ,//明天
};



@implementation TTView




-(void)awakeFromNib
{
    //设置旋转的anchorPoint
    
    self.yellowView.layer.anchorPoint = CGPointMake(0.5, 1);
     self.greenView.layer.anchorPoint = CGPointMake(0.5, 1);
    self.purpleView.layer.anchorPoint=CGPointMake(0, 0.5);
     self.blueView.layer.anchorPoint=CGPointMake(0.5, 0);
     self.lightblueView.layer.anchorPoint=CGPointMake(1,0.5);
    self.yellowView.layer.anchorPoint=CGPointMake(0.5, 1+1+1);

    

    //布局完成  开始动画
    [UIView animateWithDuration:3 animations:^{
        [self RotateView:self.greenView angle:-M_PI_2*94/100 type:TTRotatedirectionX];
        
        [self RotateView:self.purpleView angle:-M_PI_2*94/100 type:TTRotatedirectionY];
        
        [self RotateView:self.blueView angle:M_PI_2*94/100 type:TTRotatedirectionX];

        [self RotateView:self.lightblueView angle:M_PI_2*94/100 type:TTRotatedirectionY];
        
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:3 animations:^{
            self.greenView.layer.transform =CATransform3DIdentity;
            self.blueView.layer.transform =CATransform3DIdentity;
            self.lightblueView.layer.transform =CATransform3DIdentity;
            self.purpleView.layer.transform =CATransform3DIdentity;
        }completion:^(BOOL finished) {
        }];
        
    }];
}

/**
 *  旋转
 *
 *  @param view  view
 *  @param angle 角度
 *  @param type  旋转轴
 */
-(void)RotateView:(UIView*)view  angle:(CGFloat)angle  type:(TTRotatedirection)type
{
    
    // 旋转角度,往下逆时针旋转
    CATransform3D transfrom = CATransform3DIdentity;
    // 增加旋转的立体感，近大远小,d：距离图层的距离
    transfrom.m34 = -1 / 500.0;
    if(type==TTRotatedirectionX){
        transfrom = CATransform3DRotate(transfrom, angle, 1, 0, 0);
    }else if (type==TTRotatedirectionY){
        transfrom = CATransform3DRotate(transfrom, angle, 0, 1, 0);
    }else if (type==TTRotatedirectionZ){
        transfrom = CATransform3DRotate(transfrom, angle, 0, 0, 1);
    }
    view.layer.transform = transfrom;
    // 设置阴影效果
    //_gradientL.opacity = self.Y* 1 / 200.0;
}









@end
