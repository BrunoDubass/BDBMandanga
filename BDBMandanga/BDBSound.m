//
//  BDBSound.m
//  BDBAngryEsteban
//
//  Created by Bruno Domínguez on 04/02/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import "BDBSound.h"
@import AVFoundation;

@interface BDBSound()

@property (strong, nonatomic)AVAudioPlayer* player;
@property (strong, nonatomic)AVAudioPlayer* player2;
@property (strong, nonatomic)AVAudioPlayer* player3;
@property (strong, nonatomic)AVAudioPlayer* player4;


@end

@implementation BDBSound

+(instancetype)defaultSound{
    
    static BDBSound* defaultS;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultS = [[BDBSound alloc]init];
    });
    return defaultS;
}

-(void)girlSound{
    
    NSArray* girl = @[@"Uhhh1", @"Uhhh2", @"Uhhh3", @"Uhhh4", @"Uhhh5", @"Speak1", @"Speak2", @"Risa1", @"Risa2", @"Risa3", @"Risa4", @"Risa5", @"Pedo1", @"Pedo2"];
    
    if ([self randomNumber:8]<=1) {
        
        NSUInteger random = [self randomNumber:[girl count]];
        [self playFileName1:[girl objectAtIndex:(random)] extension:@"wav" nLoops:0];
    }
    
    
    
    
}
-(void)maleSound{
    
    NSArray* male = @[@"MamasitaMale", @"UhhhMale"];
    
    if ([self randomNumber:20]<=1) {
        
        NSUInteger random = [self randomNumber:[male count]];
        [self playFileName2:[male objectAtIndex:(random)] extension:@"wav" nLoops:0];
    }
}
-(void)cacheteSound{
    
    NSArray* cachete = @[@"Punch1", @"Punch2", @"Punch3", @"Punch4", @"Punch5", @"Punch6", @"Punch7", @"Punch8", @"Punch9"];
    
    NSUInteger random = [self randomNumber:[cachete count]];
    NSLog(@"%lu", (unsigned long)random);
    [self playFileName3:[cachete objectAtIndex:(random)] extension:@"wav" nLoops:0];

}
-(void)glassSound{
    
    NSString* glass = @"Glass";
    
    [self playFileName4:glass extension:@"wav" nLoops:0];
    
}
-(void)girlPunchSound{
    
}

-(void)playFileName1:(NSString*)name extension:(NSString*)ext nLoops:(NSUInteger)loops{
    
    NSURL* url = [[NSBundle mainBundle]URLForResource:name withExtension:ext];
    NSError* error;
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url
                                                   error:&error];
    if (error) {
        NSLog(@"Error AUDIO");
    }
    self.player.numberOfLoops = loops;
    [self.player play];
}
-(void)playFileName2:(NSString*)name extension:(NSString*)ext nLoops:(NSUInteger)loops{
    
    NSURL* url = [[NSBundle mainBundle]URLForResource:name withExtension:ext];
    NSError* error;
    self.player2 = [[AVAudioPlayer alloc]initWithContentsOfURL:url
                                                        error:&error];
    if (error) {
        NSLog(@"Error AUDIO");
    }
    self.player2.numberOfLoops = loops;
    [self.player2 play];
}

-(void)playFileName3:(NSString*)name extension:(NSString*)ext nLoops:(NSUInteger)loops{
    
    NSURL* url = [[NSBundle mainBundle]URLForResource:name withExtension:ext];
    NSError* error;
    self.player3 = [[AVAudioPlayer alloc]initWithContentsOfURL:url
                                                        error:&error];
    if (error) {
        NSLog(@"Error AUDIO");
    }
    self.player3.numberOfLoops = loops;
    [self.player3 play];
}

-(void)playFileName4:(NSString*)name extension:(NSString*)ext nLoops:(NSUInteger)loops{
    
    NSURL* url = [[NSBundle mainBundle]URLForResource:name withExtension:ext];
    NSError* error;
    self.player4 = [[AVAudioPlayer alloc]initWithContentsOfURL:url
                                                        error:&error];
    if (error) {
        NSLog(@"Error AUDIO");
    }
    self.player4.numberOfLoops = loops;
    [self.player4 play];
}


-(NSUInteger)randomNumber:(NSUInteger)limit{
    
    return arc4random_uniform(limit);
    
}

@end
