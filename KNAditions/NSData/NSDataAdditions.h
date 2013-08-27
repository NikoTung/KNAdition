//
//  NSDataAdditions.h
//  Weibo
//
//  Created by junmin liu on 10-9-29.
//  Copyright 2010 Openlab. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSData (Addtions)

/**
 * Calculate the md5 hash of this data using CC_MD5.
 *
 * @return md5 hash of this data lowercase
 */
@property (nonatomic, readonly) NSString* md5Hash;


/**
 * encode this data using base64 endcode
 *
 * @return the base64 encoded string of this data
 */
- (NSString *)base64Encode;

/**
 * decode this data using base64 endcode
 *
 * @return the base64 encoded  data
 */
- (NSData *)base64Decode;


@end