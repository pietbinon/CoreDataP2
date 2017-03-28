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
    
    NSString * studentID = studentInfo[@"studentID"];
    NSFetchRequest *request  = [NSFetchRequest fetchRequestWithEntityName: @"Students"];
    request.predicate = [NSPredicate predicateWithFormat: @"studentID = %@", studentID];//studentID here is from line 32
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest: request error: &error];
    
    if (!matches || error || matches.count > 1) {
        
        //Handle errors
        
    } else if (matches.count) {
        
        //Returns the existing object
        studentEntity = [matches firstObject];
        //Or...
        //studentEntity = matches[0];
        //Or...
        //studentEntity = [matches objectAtIndex: 0];
    } else {
        
        //Create a new object
        studentEntity = [NSEntityDescription insertNewObjectForEntityForName: @"Students" inManagedObjectContext: context];
        
        studentEntity.studentID = [studentInfo valueForKey: @"studentID"];
        studentEntity.name = [studentInfo valueForKey: @"name"];
        studentEntity.lastName = [studentInfo valueForKey: @"lastName"];
        
        NSError *error;
        if (![context save: &error]) {
            
            NSLog (@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
    }
    
    return studentEntity;
}


+ (NSArray *) searchStudentsByName: (NSString *) name lastName: (NSString *) lastName {
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    Students *studentEntity = nil;
    
    NSError *error;
    
    NSFetchRequest *request  = [NSFetchRequest fetchRequestWithEntityName: @"Students"];
    request.predicate = [NSPredicate predicateWithFormat: @"name == %@ AND lastName == %@", name, lastName];
    
    NSArray *fetchedObject = [context executeFetchRequest: request error: &error];
    NSMutableArray *results = [[NSMutableArray alloc] init];
    
    //for (Students *studentEntity in fetchedObject) {
    //Use instead the following line otherwise line 70 will complain...
    for (studentEntity in fetchedObject) {
        
        [results addObject: [self createObjectFromEntity: studentEntity]];
    }
    
    return results;
}


+ (NSDictionary *) createObjectFromEntity: (Students *) studentInfo { //Passing what's on line 80
    
    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
    tempDict[@"name"] = studentInfo.name;
    tempDict[@"lastName"] = studentInfo.lastName;
    tempDict[@"studentID"] = studentInfo.studentID;
    return tempDict;
}

@end
