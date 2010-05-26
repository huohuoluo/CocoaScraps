#import "MainMenuController.h"

@implementation MainMenuController
@synthesize managedObjectContext;

+(id)initialize
{
	return [[MainMenuController alloc] init];
}

- (NSString *)windowNibName
{
	return @"RecipeManagement";
}

-(void)windowDidLoad {}

-(IBAction)addImage:(id)sender 
{
	Recipe *selectedRecipe = [[recipeController selectedObjects] lastObject];
	if (selectedRecipe == nil) return;
	
	NSOpenPanel *openPanel = [NSOpenPanel openPanel];
	[openPanel setCanChooseDirectories:NO];
	[openPanel setCanCreateDirectories:NO];
	[openPanel setAllowsMultipleSelection:NO];
	
	SEL openSelectedHandler = @selector(addImageSheetDidEnd:returnCode:contextInfo:);
	[openPanel beginSheetForDirectory:nil file:nil modalForWindow:window modalDelegate:self didEndSelector:openSelectedHandler contextInfo:selectedRecipe];
}

- (void)addImageSheetDidEnd:(NSOpenPanel*)openPanel returnCode:(NSInteger)returnCode contextInfo:(NSManagedObject*)recipe
{
	if(returnCode == NSCancelButton) return;
	NSString *fromPath = [openPanel filename];
	NSString *destinationPath = [DirectorySupport applicationSupportFolder];
	NSString *guid = [[NSProcessInfo processInfo] globallyUniqueString];
	[destinationPath stringByAppendingString:guid];
	NSError * error = nil;
	[[NSFileManager defaultManager] copyItemAtPath:fromPath toPath:destinationPath error:&error];
	if(error) [NSApp presentError:error];
	
	[recipe setValue:destinationPath forKey:@"imagePath"];
}

- (NSManagedObjectContext*)managedObjectContext
{
	if (managedObjectContext) return managedObjectContext;
	managedObjectContext = [[[ManagedObjectContextFactory alloc] init] createXMLFileBased:@"GrokkingRecipes.xml"];
	return managedObjectContext;
}

@end
