//
//  books.h
//  addingbook
//
//  Created by BSA Univ15 on 27/01/14.
//  Copyright (c) 2014 BSA Univ15. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface books : NSObject
@property(strong,nonatomic) NSString *booktitle;
@property(strong,nonatomic) NSString *author;
@property(strong,nonatomic) NSNumber*totalpages;
@property(strong,nonatomic) NSString *date;
@end
