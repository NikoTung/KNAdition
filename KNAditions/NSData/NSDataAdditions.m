//
//  NSDataAdditions.m
//  Weibo
//
//  Created by junmin liu on 10-9-29.
//  Copyright 2010 Openlab. All rights reserved.
//

#import "NSDataAdditions.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (Addtions)


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)md5Hash {
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5([self bytes], [self length], result);
	
	return [NSString stringWithFormat:
			@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
			result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
			];
}


static char base64EncodeTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";

/*
 * Mapping ASCII characters to base64 encode table(6 bits)
 *
 *
 */


#define xx 65

static unsigned char base64DecodeTable[256] =
{
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx,
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx,
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, 62, xx, xx, xx, 63,
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, xx, xx, xx, xx, xx, xx,
    xx,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, xx, xx, xx, xx, xx,
    xx, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, xx, xx, xx, xx, xx,
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx,
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx,
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx,
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx,
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx,
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx,
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx,
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx,
};

- (NSString *)base64Encode
{
    
    const int size = ((self.length + 2)/3)*4;  //max size of the output
 
    uint8_t output[size];
    
    const uint8_t* input = (const uint8_t*)[self bytes];
    for (int i = 0; i < self.length; i += 3)
    {
        int value = 0;
        for (int j = i; j < (i + 3); j++)
        {
            value <<= 8;
            if (j < self.length)
            value |= (0xFF & input[j]);
        }
        
        const int index = (i / 3) * 4;
        output[index + 0] =  base64EncodeTable[(value >> 18) & 0x3F];  //get first 6 bits
        output[index + 1] =  base64EncodeTable[(value >> 12) & 0x3F];  //second 6 bits
        output[index + 2] = (i + 1) < self.length ? base64EncodeTable[(value >> 6)  & 0x3F] : '=';
        output[index + 3] = (i + 2) < self.length ? base64EncodeTable[(value >> 0)  & 0x3F] : '=';
    }
    
    return  [[NSString alloc] initWithBytes:output length:size encoding:NSASCIIStringEncoding];
}
#define BINARY_UNIT_SIZE 3
#define BASE64_UNIT_SIZE 4


- (NSData *)base64Decode
{
    const int size = (self.length)*3/4;  //max size of the output in thoery
    
    uint8_t output[size];
    
    const uint8_t* input = (const uint8_t*)[self bytes];
    
    size_t i = 0;
	size_t j = 0;
	while (i < self.length)
	{
		//
		// Accumulate 4 valid characters ,skip something like "\n,\r"
		//
		unsigned char accumulated[4];
		size_t accumulateIndex = 0;
		while (i < self.length)
		{
			unsigned char decode = base64DecodeTable[input[i++]];
			if (decode != xx)
			{
				accumulated[accumulateIndex] = decode;
				accumulateIndex++;
				
				if (accumulateIndex == 4)
				{
					break;
				}
			}
		}
//		covert from 6 bits to 8 bits,4bytes to 3 bytes
		output[j] = (accumulated[0] << 2) | (accumulated[1] >> 4);
		output[j + 1] = (accumulated[1] << 4) | (accumulated[2] >> 2);
		output[j + 2] = (accumulated[2] << 6) | accumulated[3];
		j += accumulateIndex - 1;
	}
//    actually j is the final output length
    return  [NSData dataWithBytes:output length:j];
}




void *NewBase64Decode(
                      const char *inputBuffer,
                      size_t length,
                      size_t *outputLength)
{
	if (length == -1)
	{
		length = strlen(inputBuffer);
	}
	
	size_t outputBufferSize = (length / BASE64_UNIT_SIZE) * BINARY_UNIT_SIZE;
	unsigned char *outputBuffer = (unsigned char *)malloc(outputBufferSize);
	
	size_t i = 0;
	size_t j = 0;
	while (i < length)
	{
		//
		// Accumulate 4 valid characters (ignore everything else)
		//
		unsigned char accumulated[BASE64_UNIT_SIZE];
		size_t accumulateIndex = 0;
		while (i < length)
		{
			unsigned char decode = base64DecodeTable[inputBuffer[i++]];
			if (decode != xx)
			{
				accumulated[accumulateIndex] = decode;
				accumulateIndex++;
				
				if (accumulateIndex == BASE64_UNIT_SIZE)
				{
					break;
				}
			}
		}
		
		//
		// Store the 6 bits from each of the 4 characters as 3 bytes
		//
		outputBuffer[j] = (accumulated[0] << 2) | (accumulated[1] >> 4);
		outputBuffer[j + 1] = (accumulated[1] << 4) | (accumulated[2] >> 2);
		outputBuffer[j + 2] = (accumulated[2] << 6) | accumulated[3];
		j += accumulateIndex - 1;
	}
	
	if (outputLength)
	{
		*outputLength = j;
	}
	return outputBuffer;
}


+ (NSData *)dataFromBase64String:(NSString *)aString
{
	NSData *data = [aString dataUsingEncoding:NSASCIIStringEncoding];
	size_t outputLength;
	void *outputBuffer = NewBase64Decode([data bytes], [data length], &outputLength);
	NSData *result = [NSData dataWithBytes:outputBuffer length:outputLength];
	free(outputBuffer);
	return result;
}


@end
