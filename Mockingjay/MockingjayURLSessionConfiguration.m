//
//  MockingjayURLSessionConfiguration.m
//  Mockingjay
//
//  Created by Kyle Fuller on 10/05/2016.
//  Copyright © 2016 Cocode. All rights reserved.
//

#import "MockingjayURLSessionConfiguration.h"

@implementation MockingjayURLConfiguration

+ (void)load {
    [NSURLSessionConfiguration mockingjaySwizzleDefaultSessionConfiguration];
}

@end
