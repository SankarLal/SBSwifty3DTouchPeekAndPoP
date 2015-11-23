

import UIKit

class SBSwifty3DTouchPreviewingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "SBSwifty3DTouch Previewing"
        setUpUserInterface()

    }
    
    func setUpUserInterface () {
        
        let previewingButton = UIButton (frame: CGRectMake(30, self.view.bounds.size.height/2 - 200, self.view.bounds.size.width - 60, 100))
        previewingButton.setTitle("Previewing In Button", forState: .Normal)
        previewingButton.backgroundColor = UIColor.purpleColor()
        previewingButton.addTarget(self, action: "performPreviewingButton", forControlEvents: .TouchUpInside)
        self.view.addSubview(previewingButton)
        
        let previewingTblViewButton = UIButton (frame: CGRectMake(30, self.view.bounds.size.height - 200, self.view.bounds.size.width - 60, 100))
        previewingTblViewButton.setTitle("Previewing In TableView", forState: .Normal)
        previewingTblViewButton.backgroundColor = UIColor.purpleColor()
        previewingTblViewButton.addTarget(self, action: "performPreviewingTableViewButton", forControlEvents: .TouchUpInside)
        self.view.addSubview(previewingTblViewButton)
        
    }
    
    func performPreviewingButton () {
        
        self.navigationController?.pushViewController(SBSwifty3DTouchButtonViewController(), animated: true)
        
    }

    func performPreviewingTableViewButton () {
        
        self.navigationController?.pushViewController(SBSwifty3DTouchTableViewController(), animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
