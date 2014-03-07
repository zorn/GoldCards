#import "ReviewFeedbackPromptViewController.h"
#import "PBWebViewController.h"
#import "PBSafariActivity.h"
#import <MessageUI/MessageUI.h>

@interface ReviewFeedbackPromptViewController () <MFMailComposeViewControllerDelegate>
@end

@implementation ReviewFeedbackPromptViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id784797900"]];
		[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
	} else {
		
		if (indexPath.row == 0) {
            
            // Initialize the web view controller and set it's URL
            PBWebViewController *webViewController = [[PBWebViewController alloc] init];
            webViewController.URL = [NSURL URLWithString:@"http://clickablebliss.com/contact.html"];
            
            // These are custom UIActivity subclasses that will show up in the UIActivityViewController
            // when the action button is clicked
            PBSafariActivity *activity = [[PBSafariActivity alloc] init];
            webViewController.applicationActivities = @[activity];
            
            // This property also corresponds to the same one on UIActivityViewController
            // Both properties do not need to be set unless you want custom actions
            webViewController.excludedActivityTypes = @[UIActivityTypeMail, UIActivityTypeMessage, UIActivityTypePostToWeibo];
            
            // Push it
            [self.navigationController pushViewController:webViewController animated:YES];
		} else {
            
            if ([MFMailComposeViewController canSendMail]) {
                MFMailComposeViewController *composeViewController = [[MFMailComposeViewController alloc] initWithNibName:nil bundle:nil];
                [composeViewController setMailComposeDelegate:self];
                [composeViewController setToRecipients:@[@"support@clickablebliss.com"]];
                [composeViewController setSubject:@"GoldCards Feedback"];
                [self presentViewController:composeViewController animated:YES completion:nil];
            } else {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:support@clickablebliss.com?subject=GoldCards%20Feedback"]];
            }
			[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
            
		}
		
	}
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    //FIXME: Add an alert in case of MFMailComposeResultFailed
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end