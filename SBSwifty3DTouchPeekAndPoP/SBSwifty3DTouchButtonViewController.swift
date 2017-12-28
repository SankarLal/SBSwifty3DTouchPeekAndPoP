
import UIKit

class SBSwifty3DTouchButtonViewController: UIViewController,UIViewControllerPreviewingDelegate {
    
    var peekButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.title = "SBSwifty3DTouch Button"
        
        peekButton = UIButton.init(frame: CGRect.init(x: 30, y: self.view.bounds.size.height/2 - 50, width: self.view.bounds.size.width - 60, height: 100))
        peekButton.setTitle("Peek Button", for: .normal)
        peekButton.backgroundColor = UIColor.blue
        peekButton.addTarget(self, action: #selector(self.performPeekButton), for: .touchUpInside)
        self.view.addSubview(peekButton)
        
        if (traitCollection.forceTouchCapability == .available) {
            self.registerForPreviewing(with: self, sourceView: self.view)
        }
    }

    @objc func performPeekButton () {
        self.navigationController?.pushViewController(SBSwifty3DTouchDetailViewController(), animated: true)
    }
    
    // MARK: Previewing Delegate Functions
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        previewingContext.sourceRect = peekButton.frame
        let viewController = SBSwifty3DTouchDetailViewController ()
        viewController.setUpBackBarButton()
        let NaviController : UINavigationController  =  UINavigationController(rootViewController: viewController)
        return NaviController
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.show(viewControllerToCommit, sender: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
