

import UIKit

class SBSwifty3DTouchDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "SBSwifty3DTouch Detail"

    }

    func setUpBackBarButton () {

        let backBarButton : UIBarButtonItem = UIBarButtonItem (title: "Back", style: .Plain, target: self, action: "peformBackBarButton")
        self.navigationItem.leftBarButtonItem = backBarButton
    }
    
    func peformBackBarButton () {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
