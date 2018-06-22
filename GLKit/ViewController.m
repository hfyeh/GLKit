#import "ViewController.h"
#import "GLViewController.h"

@interface ViewController ()
@property (nonatomic , strong) EAGLContext* mContext;
@property (nonatomic , strong) GLKBaseEffect* mEffect;
@end

@implementation ViewController
{
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UIButton*) makeButtonWithFrame:(CGRect)frame
                          andText:(NSString*)text {
    UIFont *font;
    font = [UIFont fontWithName:@"Georgia" size:50];
    
    UILabel *label;
    label = [[ UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    label.backgroundColor = [UIColor colorWithWhite:1 alpha:0.95];
    label.textColor = [UIColor colorWithWhite:0 alpha:1];
    label.text = [text uppercaseString];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = font;
    label.userInteractionEnabled = NO;
    label.exclusiveTouch = NO;
    
    UIButton* button = [[UIButton alloc] initWithFrame:frame];
    [button setBackgroundColor:[UIColor clearColor]];
    [button addSubview:label];
    
    return button;
}

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    UIImageView* backgroundView;
    backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"theia_logo.png"]];
    [self.view addSubview: backgroundView];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    CGRect scrollViewFrame = CGRectMake(0.f,
                                        0.f,
                                        screenRect.size.width,
                                        screenRect.size.height);
    
    UIScrollView* containerView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
    containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    containerView.showsHorizontalScrollIndicator = NO;
    containerView.showsVerticalScrollIndicator = YES;
    containerView.alwaysBounceVertical = YES;
    [self.view addSubview:containerView];
    
    NSArray *buttonTitles;
    
    buttonTitles = [NSArray arrayWithObjects: @"GLKit", nil];
    
    NSInteger buttonY = 300;
    NSInteger buttonHeight = 200;
    CGRect buttonRect = CGRectMake(0, 0, screenRect.size.width, buttonHeight);
    
    UIButton *button;
    button = [self makeButtonWithFrame:CGRectMake(0, buttonY, buttonRect.size.width, buttonRect.size.height) andText:[buttonTitles objectAtIndex:0]];
    
    [containerView addSubview:button];
    
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    containerView.contentSize = CGSizeMake(buttonRect.size.width, buttonRect.size.height * 3);
}

- (void)buttonPressed:(id)sender {
    GLKViewController *vc = nil;
    vc = [[GLViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
//    self.navigationController.navigationBar.topItem.title = @"GLKView";
}

- (IBAction)selectPhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

@end
