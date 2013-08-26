//
//  KNAditionLogicTest.m
//  KNAditionLogicTest
//
//  Created by Niko on 13-8-26.
//  Copyright (c) 2013年 Niko. All rights reserved.
//

#import "KNAditionLogicTest.h"
#import "NSStringAdditions.h"
#import "NSDataAdditions.h"

@implementation KNAditionLogicTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testBase
{

    NSString *string = @"I love you ,where are you now.";
//    NSLog(@"11");
//    NSString *baseEncode = [string base64Encode];
//    NSLog(@"22");
//    NSLog(@"baseEncode  %@",baseEncode);
//    NSString *baseDecode = [baseEncode base64Decode];
//    NSLog(@"33");
//    NSLog(@"baseDecode :%@",baseDecode);
    [string md5Hash];
}

@end
