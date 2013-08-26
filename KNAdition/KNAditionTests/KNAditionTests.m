//
//  KNAditionTests.m
//  KNAditionTests
//
//  Created by Niko on 13-8-21.
//  Copyright (c) 2013年 Niko. All rights reserved.
//

#import "KNAditionTests.h"
#import "NSDataAdditions.h"
#import "NSStringAdditions.h"

@implementation KNAditionTests

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
    
    NSString *string = @"Hello ,this is niko.";
    NSString *baseEncode = [string base64Encode];
    NSLog(@"baseEncode  %@",baseEncode);
    NSString *baseDecode = [baseEncode base64Decode];
    NSLog(@"baseDecode :%@",baseDecode);
    STAssertTrueNoThrow([baseDecode isEqualToString:string], @"string after decode should be the same as original string");
}

@end
