

import UIKit

class SBSwifty3DTouchDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        self.title = "SBSwifty3DTouch Detail"

    }

    func setUpBackBarButton () {

        let backBarButton : UIBarButtonItem = UIBarButtonItem (title: "Back", style: .plain, target: self, action: #selector(self.peformBackBarButton))
        self.navigationItem.leftBarButtonItem = backBarButton
    }
    
    @objc func peformBackBarButton () {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
