//
//  Students+CoreDataProperties.h
//  CoreDataP1
//
//  Created by Pierre Binon on 2017-03-27.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Students+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Students (CoreDataProperties)

+ (NSFetchRequest<Students *> *)fetchRequest;
+ (Students *) addStudentInfoFromDictionary: (NSDictionary *) studentInfo;

@property (nullable, nonatomic, copy) NSString *studentID;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *lastName;

+ (NSArray *) searchStudentsByName: (NSString *) name lastName: (NSString *) lastName;

@end

NS_ASSUME_NONNULL_END
