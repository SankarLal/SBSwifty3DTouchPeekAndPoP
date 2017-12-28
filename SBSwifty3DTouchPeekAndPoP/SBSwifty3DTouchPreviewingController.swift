

import UIKit

class SBSwifty3DTouchPreviewingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        self.title = "SBSwifty3DTouch Previewing"
        setUpUserInterface()

    }
    
    func setUpUserInterface () {
        
        let previewingButton = UIButton.init(frame: CGRect.init(x: 30, y: self.view.bounds.size.height/2 - 200, width: self.view.bounds.size.width - 60, height: 100))
        previewingButton.setTitle("Previewing In Button", for: .normal)
        previewingButton.backgroundColor = UIColor.purple
        previewingButton.addTarget(self, action: #selector(self.performPreviewingButton), for: .touchUpInside)
        self.view.addSubview(previewingButton)
        
        let previewingTblViewButton = UIButton.init(frame: CGRect.init(x: 30, y: self.view.bounds.size.height - 200, width: self.view.bounds.size.width - 60, height: 100))

        previewingTblViewButton.setTitle("Previewing In TableView", for: .normal)
        previewingTblViewButton.backgroundColor = UIColor.purple
        previewingTblViewButton.addTarget(self, action: #selector(self.performPreviewingTableViewButton), for: .touchUpInside)
        self.view.addSubview(previewingTblViewButton)
        
    }
    
    @objc func performPreviewingButton () {
        self.navigationController?.pushViewController(SBSwifty3DTouchButtonViewController(), animated: true)
    }

    @objc func performPreviewingTableViewButton () {
        self.navigationController?.pushViewController(SBSwifty3DTouchTableViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
