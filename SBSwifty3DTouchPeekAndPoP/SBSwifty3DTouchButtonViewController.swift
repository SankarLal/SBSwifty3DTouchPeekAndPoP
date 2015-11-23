
import UIKit

class SBSwifty3DTouchButtonViewController: UIViewController,UIViewControllerPreviewingDelegate {
    
    var peekButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "SBSwifty3DTouch Button"
        
        
        peekButton = UIButton (frame: CGRectMake(30, self.view.bounds.size.height/2 - 50, self.view.bounds.size.width - 60, 100))
        peekButton.setTitle("Peek Button", forState: .Normal)
        peekButton.backgroundColor = UIColor.blueColor()
        peekButton.addTarget(self, action: "performPeekButton", forControlEvents: .TouchUpInside)
        self.view.addSubview(peekButton)
        
        if (traitCollection.forceTouchCapability == .Available) {
            self.registerForPreviewingWithDelegate(self, sourceView: self.view)
        }
    }

    func performPeekButton () {
        self.navigationController?.pushViewController(SBSwifty3DTouchDetailViewController(), animated: true)


    }
    
    // MARK: Previewing Delegate Functions
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        previewingContext.sourceRect = peekButton.frame
        let viewController = SBSwifty3DTouchDetailViewController ()
        viewController.setUpBackBarButton()
        let NaviController : UINavigationController  =  UINavigationController(rootViewController: viewController)
        return NaviController
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        self.showViewController(viewControllerToCommit, sender: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
