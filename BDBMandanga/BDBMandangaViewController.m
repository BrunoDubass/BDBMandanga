//
//  BDBMandangaViewController.m
//  BDBAngryEsteban
//
//  Created by Bruno Domínguez on 04/02/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import "BDBMandangaViewController.h"
#import "BDBSound.h"

@interface BDBMandangaViewController ()

@property (nonatomic)NSUInteger n;

@end

@implementation BDBMandangaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(didTap:)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - ACTIONS

-(void)didTap:(UITapGestureRecognizer*)tap{
    
    CGPoint cp = [tap locationInView:self.mandangaView];
    if (tap.state == UIGestureRecognizerStateRecognized) {
        
        UIImageView* mano = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mano"]];
        mano.center = cp;
        [self.mandangaView addSubview:mano];
        
        if (CGRectContainsPoint(self.v1.frame, cp) || CGRectContainsPoint(self.v2.frame, cp) || CGRectContainsPoint(self.v3.frame, cp) || CGRectContainsPoint(self.v4.frame, cp) || CGRectContainsPoint(self.v5.frame, cp) || CGRectContainsPoint(self.v6.frame, cp) || CGRectContainsPoint(self.v7.frame, cp) || CGRectContainsPoint(self.v8.frame, cp) || CGRectContainsPoint(self.v9.frame, cp)) {
            
            [[BDBSound defaultSound]cacheteSound];
            self.n += 1;
            self.iMandangazos.text = [NSString stringWithFormat:@"      iCachetazos = %lu", (unsigned long)self.n];
            [[BDBSound defaultSound]girlSound];
            [[BDBSound defaultSound]maleSound];
            
            UIImageView* crack = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"rojez"]];
            crack.center = cp;
            [self.mandangaView addSubview:crack];
        }
        if (CGRectContainsPoint(self.c1.frame, cp) || CGRectContainsPoint(self.c2.frame, cp) || CGRectContainsPoint(self.c3.frame, cp)) {
            
            [[BDBSound defaultSound]glassSound];
            
            UIImageView* crackglass = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"brokenglass"]];
            crackglass.center = cp;
            [self.mandangaView addSubview:crackglass];
        }
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^{
            [mano removeFromSuperview];
        });
        
    }
    
}

@end
