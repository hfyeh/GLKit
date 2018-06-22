#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)selectPhoto:(UIButton *)sender;


@end
