//
//  SZDoorViewController.h
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/3.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "BaseViewController.h"

@interface SZDoorViewController : BaseViewController{
     UIImageView*        shakeView;

     UIActivityIndicatorView* aiLoad;
}
@property(nonatomic,strong)   NSString*            message;
@property(nonatomic,strong)   NSString*           titleString;
@property(nonatomic,strong)   UIImageView*        imgUp;
@property(nonatomic,strong)   UIImageView*        imgDown;

@end
