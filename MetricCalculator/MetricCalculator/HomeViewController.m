

#import "HomeViewController.h"
#import "Metric.h"
#import "Metrics.h"
#import "Unit.h"

@interface HomeViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property(weak,nonatomic,)IBOutlet UILabel *lblDisplay;
@property(weak,nonatomic,)IBOutlet UILabel *lblCalculation;

@property (weak, nonatomic) IBOutlet  UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet  UIButton *btnMetric;
@property (weak, nonatomic) IBOutlet  UISegmentedControl *segmentUnitControl;

@property(strong,nonatomic,)NSMutableString *strDisplay;
@property(strong,nonatomic,) Metrics *mertics;
@property(strong,nonatomic,) Metric *selectedMetric;
@property(strong,nonatomic,) Unit *selectedUnit;

-(IBAction)clickedOnNumber:(id)sender;
-(IBAction)clickedOnOperator:(id)sender;
-(IBAction)calculate:(id)sender;
-(IBAction)clear:(id)sender;
-(IBAction)clickedOnSelectMetric:(id)sender;
-(IBAction)segmentValueChanged:(id)sender;

@end

@implementation HomeViewController
@synthesize lblDisplay = _lblDisplay;
@synthesize strDisplay = _strDisplay;
@synthesize pickerView = _pickerView;
@synthesize btnMetric = _btnMetric;
@synthesize mertics = _mertics;
@synthesize segmentUnitControl = _segmentUnitControl;
@synthesize selectedMetric = _selectedMetric;
@synthesize lblCalculation = _lblCalculation;
@synthesize selectedUnit = _selectedUnit;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
   _strDisplay = [[NSMutableString alloc] init];
    _mertics= [[Metrics alloc] init];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickedOnNumber:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    NSString *string = [NSString stringWithFormat:@"%d",[button tag]];
    
    [_strDisplay appendString:string];
    
    [_lblDisplay setText:_strDisplay];
}

-(IBAction)clickedOnOperator:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSString *srt = [_strDisplay substringWithRange:NSMakeRange([_strDisplay length]-1,1)];
    
    if ([srt isEqualToString:@"+"] || [srt isEqualToString:@"-"]|| [srt isEqualToString:@"*"] || [srt isEqualToString:@"÷"] )
        {
            [_strDisplay deleteCharactersInRange:NSMakeRange([_strDisplay length]-1,1)];
            
        }
    NSString *string = [NSString stringWithFormat:@"%@",button.titleLabel.text];
    
    [_strDisplay appendString:string];
    
    [_lblDisplay setText:_strDisplay];
}

-(IBAction)calculate:(id)sender
{
    
}
-(IBAction)segmentValueChanged:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    _selectedUnit = [_selectedMetric.metricUnits objectAtIndex:control.selectedSegmentIndex];
}
-(IBAction)clear:(id)sender
{
    if ([_strDisplay length]>0) {
        [_strDisplay deleteCharactersInRange:NSMakeRange([_strDisplay length]-1,1)];
        [_lblDisplay setText:_strDisplay];
    }
}
-(IBAction)clickedOnSelectMetric:(id)sender
{
    if (_pickerView.isHidden == TRUE) {
        [_pickerView setHidden:NO];
    }
    else{
        [_pickerView setHidden:YES];

    }
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return [_mertics.arrayMetrics count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    Metric *metric = [_mertics.arrayMetrics objectAtIndex:row];

    return metric.strTittle;
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    
    [_pickerView setHidden:YES];
    
    _selectedMetric = [_mertics.arrayMetrics objectAtIndex:row];
    
    [_strDisplay deleteCharactersInRange:NSMakeRange(0, [_strDisplay length])];
    [_lblDisplay setText:_strDisplay];

    [self setMetricValue];

}

-(void)setMetricValue
{
    [_btnMetric setTitle:_selectedMetric.strTittle forState:UIControlStateNormal];
    _selectedUnit = [_selectedMetric.metricUnits objectAtIndex:0];

    Unit *unit = [_selectedMetric.metricUnits objectAtIndex:0];
    [_segmentUnitControl setTitle:unit.strTittle forSegmentAtIndex:0];
    
    
    Unit *unit1 = [_selectedMetric.metricUnits objectAtIndex:1];
    [_segmentUnitControl setTitle:unit1.strTittle forSegmentAtIndex:1];

}
@end
