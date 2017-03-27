//
//  Students+CoreDataProperties.m
//  CoreDataP1
//
//  Created by Pierre Binon on 2017-03-27.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Students+CoreDataProperties.h"
#import "AppDelegate.h"

@implementation Students (CoreDataProperties)

+ (NSFetchRequest<Students *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Students"];
}

//Dynamic means no need to synthesize
@dynamic studentID;
@dynamic name;
@dynamic lastName;

+ (Students *) addStudentInfoFromDictionary: (NSDictionary *) studentInfo {
    
    //We need a context that we get with the following 2 lines of code and also to get the help of the appDelegate
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    Students *studentEntity = nil;
    
    //Create a new object
    studentEntity = [NSEntityDescription insertNewObjectForEntityForName: @"Students" inManagedObjectContext: context];
    
    studentEntity.studentID = [studentInfo valueForKey: @"studentID"];
    studentEntity.name = [studentInfo valueForKey: @"name"];
    studentEntity.lastName = [studentInfo valueForKey: @"lastName"];
    
    return studentEntity;
    
}

@end
