//
//  Protocols.h
//  Lesson17
//
//  Created by Azat Almeev on 20.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

@protocol DataAdapterProtocol <NSObject>
@property (nonatomic, readonly) NSArray *myusersArray;
@property (nonatomic, readonly) NSArray *usersArray;
- (NSArray *)booksArrayUsingQuery:(NSString *)query;
@end

@protocol UserProtocol <NSObject>
@property (nonatomic, strong) NSNumber *uid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *rating;
@end

@protocol MyUserProtocol <NSObject>
@property (nonatomic, strong) NSNumber *uid;
@property (nonatomic, strong) NSString *name;
@end

@protocol BookProtocol <NSObject>
@property (nonatomic, strong) NSNumber *uid;
@property (nonatomic, strong) NSString *work;
@property (nonatomic, strong) NSString *author;
@end