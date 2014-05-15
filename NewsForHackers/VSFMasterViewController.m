//
//  VSFMasterViewController.m
//  NewsForHackers
//
//  Created by vincentsfong on 5/14/14.
//  Copyright (c) 2014 Vincent Fong. All rights reserved.
//

#import "VSFMasterViewController.h"
#import "TFHpple.h"
#import "VSFHackerNewsObject.h"

#import "VSFDetailViewController.h"

@interface VSFMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation VSFMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void) loadHackerNewsObjects {
    NSURL *hnObjectsUrl = [NSURL URLWithString:@"https://news.ycombinator.com/news"];
    NSData *hnObjectsHtmlData = [NSData dataWithContentsOfURL:hnObjectsUrl];
    
    TFHpple *hnObjectsParser= [TFHpple hppleWithHTMLData:hnObjectsHtmlData];
    
    NSString *hnObjectsXpathQueryString = @"//td[@class='title']/a";
    NSArray *hnObjectsNodes = [hnObjectsParser searchWithXPathQuery:hnObjectsXpathQueryString];
    NSMutableArray *newHNObjects = [[NSMutableArray alloc] initWithCapacity:0];
    for (TFHppleElement *element in hnObjectsNodes) {
        VSFHackerNewsObject *hnObject = [[VSFHackerNewsObject alloc] init];
        [newHNObjects addObject:hnObject];
        
        hnObject.title = [[element firstChild] content];
        hnObject.url = [element objectForKey:@"href"];
    }
    
    _objects = newHNObjects;
    //NSLog(@"%@", newHNObjects);
    for (VSFHackerNewsObject *hnobject in newHNObjects) {
        NSLog(@"%@, %@", hnobject.title, hnobject.url);
    }
                                        
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadHackerNewsObjects];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIndentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIndentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    /*NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];*/
    
    VSFHackerNewsObject *thisHNObject = [_objects objectAtIndex:indexPath.row];
    cell.textLabel.text = thisHNObject.title;
    cell.detailTextLabel.text = thisHNObject.url;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        VSFHackerNewsObject *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
