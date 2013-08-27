KNAdition
====================
KNAdition is a project to collect the addition implememt of ios framework,e.g:NSArray,UIColor, and the other category.

#### NSData
`md5Hash`

@ return the md5 hash of this data in lowercase ,32 bytes

`base64Encode`

@ return the base64 encoded string of this data

`base64Decode`

@ return the base64 decoded data of this data,reciever should be the data encoded.

#### NSDictionary
    - (BOOL)getBoolValueForKey:(NSString *)key defaultValue:(BOOL)defaultValue;

    - (int)getIntValueForKey:(NSString *)key defaultValue:(int)defaultValue;

    - (time_t)getTimeValueForKey:(NSString *)key defaultValue:(time_t)defaultValue;

    - (long long)getLongLongValueValueForKey:(NSString *)key defaultValue:(long long)defaultValue;

    - (NSString *)getStringValueForKey:(NSString *)key defaultValue:(NSString *)defaultValue;

@ return the Bool ,Int,Time,longlong int and string values of the dictionary if exist

#### NSString 
`generateGuid`

@ return generate a guid

`isWhitespaceAndNewlines`

@ return true if the Receive contains only whitespace and newlines,otherwise false

`isEmptyOrWhitespace`

@ return true if the string is empty or contains only whitespace ,otherwise false

    - (NSDictionary*)queryDictionaryUsingEncoding:(NSStringEncoding)encoding;

Parses a URL query string into a dictionary,seperate each dictionary by character &; and seperate eache key and value by character =

@ return a dictionary 

    - (NSString*)stringByAddingQueryDictionary:(NSDictionary*)query;

Parses a URL, adds query parameters to its query, and re-encodes it as a new URL.

@ parameter _query_ a dictionary contain the parameters to be added to the string

@ return a new url string re-encoded

    - (NSComparisonResult)versionStringCompare:(NSString *)other;
    
Compares two strings expressing software versions.

`md5Hash`

@ return  md5 hash of this string

`base64Encode`

@ return the base64 encoded string of this string

`base64Decode`

@ return the base64 decoded string of this string,reciever should be the string encoded.




