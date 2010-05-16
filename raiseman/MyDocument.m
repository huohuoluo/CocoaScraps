//
//  MyDocument.m
//  raiseman
//
//  Created by Akshay on 5/16/10.
//  Copyright __MyCompanyName__ 2010 . All rights reserved.
//

#import "MyDocument.h"

@implementation MyDocument

- (id)init
{
    self = [super init];
	employees = [[NSMutableArray alloc] init];
    return self;
}

-(void)dealloc
{
	[employees release];
	[self setEmployees:nil];
	[super dealloc];
}

-(void)startObservingPerson:(Person *)person
{
	[person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld context:NULL];
	[person addObserver:self forKeyPath:@"expectedRaise" options:NSKeyValueObservingOptionOld context:NULL];	
}

-(void)stopObservingPerson:(Person *)person
{
	[person removeObserver:self	forKeyPath:@"name"];
	[person removeObserver:self forKeyPath:@"expectedRaise"];
}

-(void)insertObject:(Person *)p inEmployeesAtIndex:(int)index 
{
	NSUndoManager *undo = [self undoManager];
	[[undo prepareWithInvocationTarget:self] removeObjectFromEmployeesAtIndex:index];
	[self startObservingPerson:p];
	[employees insertObject:p atIndex:index];
}

-(void)removeObjectFromEmployeesAtIndex:(int)index
{	
	Person *p = [employees objectAtIndex:index];
	NSUndoManager *undo = [self undoManager];
	[[undo prepareWithInvocationTarget:self] insertObject:p inEmployeesAtIndex:index];
	[self stopObservingPerson:p];
	[employees removeObjectAtIndex:index];
}

-(void)changeKeyPath:(NSString *)keyPath ofObject:(id)object toValue:(id)newValue
{
	[object setValue:newValue forKeyPath:keyPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
	NSUndoManager *undo = [self undoManager];
	id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
	if(oldValue == [NSNull null])
		oldValue = nil;
	[[undo prepareWithInvocationTarget:self] changeKeyPath:keyPath ofObject:object toValue:oldValue];
}

-(void)setEmployees:(NSMutableArray*)new_employees 
{
	if(new_employees==employees)
		return;
	
	for(Person *employee in employees){
		[self stopObservingPerson:employee];
	}
	
	[new_employees retain];
	[employees release];
	employees = new_employees;
	for (Person *employee in employees) {
		[self startObservingPerson:employee];
	}
}

- (NSString *)windowNibName
{
    return @"MyDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *) aController
{
    [super windowControllerDidLoadNib:aController];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data of the specified type. If the given outError != NULL, ensure that you set *outError when returning nil.

    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.

    // For applications targeted for Panther or earlier systems, you should use the deprecated API -dataRepresentationOfType:. In this case you can also choose to override -fileWrapperRepresentationOfType: or -writeToFile:ofType: instead.

    if ( outError != NULL ) {
		*outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
	}
	return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to read your document from the given data of the specified type.  If the given outError != NULL, ensure that you set *outError when returning NO.

    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead. 
    
    // For applications targeted for Panther or earlier systems, you should use the deprecated API -loadDataRepresentation:ofType. In this case you can also choose to override -readFromFile:ofType: or -loadFileWrapperRepresentation:ofType: instead.
    
    if ( outError != NULL ) {
		*outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
	}
    return YES;
}

@end
