//
//  MainViewController.m
//  ABODObjC
//
//  Created by Kawika Avilla on 4/24/16.
//  Copyright © 2016 kawikaavilla. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "AFNetworking.h"
#import "Apartment.h"

//base url that contains the json data
#define baseUrl @"https://www.abodo.com/search/get_property_results.json?lat=43.0752983&lng=-89.39389799999998&min_rent=&max_rent=&passed_search_area_text=Madison,%20WI%20Apartments"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) UIImageView *loadingImageView;
@property (nonatomic, readonly) NSMutableArray *apartmentArray;

@end

@implementation MainViewController

//initialize the views and apartment array
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.loadingImageView = [[UIImageView alloc]init];
    _apartmentArray = [[NSMutableArray alloc]init];
    
    [self setupMainView];
    self.mainTableView.hidden = YES; //
    [self handleData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//create the main view
- (void)setupMainView
{
    CGFloat viewWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat viewHeight = [UIScreen mainScreen].bounds.size.height;
    float tableYPosition = 64;
    CGFloat tableWidth = viewWidth;
    CGFloat tableHeight = viewHeight - tableYPosition;
    
    self.mainTableView.frame = CGRectMake(0, tableYPosition, tableWidth, tableHeight);
    self.mainTableView.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.mainTableView.center.y);
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self.mainTableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"mainCell"];
    [self.view addSubview:self.mainTableView];
    
    self.loadingImageView.frame = CGRectMake(0, 0, viewWidth, viewHeight);
    self.loadingImageView.image = [UIImage imageNamed:@"loadingScreenImage"];
    [self.view addSubview:self.loadingImageView];
    
}


//retrieve the data and add it to apt array
- (void)handleData
{
    __block NSString *propertyName = @"";
    __block NSString *priceRange = @"";
    __block NSString *bedRange = @"";
    __block NSString *tileUrl = @"";
    
    //AFNetworking
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:baseUrl parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        for(NSDictionary *jsonObject in responseObject){
            propertyName = (NSString*)[jsonObject objectForKey:@"prop_display_name"];
            priceRange = (NSString*)[jsonObject objectForKey:@"rent_range"];
            bedRange = (NSString*)[jsonObject objectForKey:@"beds_range"];
            tileUrl = (NSString*)[jsonObject objectForKey:@"tile_url"];
            Apartment *newApartment = [[Apartment alloc] initWithName:propertyName priceRange:priceRange bedRange:bedRange tileUrl:tileUrl];
            [self.apartmentArray addObject:newApartment];
            [self.mainTableView reloadData];
        }
        self.mainTableView.hidden = NO;
        [UIView animateWithDuration:1 animations:^{
            self.loadingImageView.alpha =  0;
        }];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _apartmentArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"mainCell";
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil){
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Apartment *apartmentObject = self.apartmentArray[indexPath.row];
    if(apartmentObject.tileUrl != nil){
        cell.propertyNameLabel.text = apartmentObject.propertyName;
        cell.priceRangeLabel.text = apartmentObject.priceRange;
        cell.bedRangeLabel.text = apartmentObject.bedRange;
        NSURL *tileUrl = [NSURL URLWithString:apartmentObject.tileUrl];
        [cell.tileView setImageWithURL:tileUrl];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 260;
}


#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Apartment *apartmentObject = self.apartmentArray[indexPath.row];
    NSLog(@"selected %@ ", apartmentObject.propertyName);
}

@end
