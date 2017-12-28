

import UIKit

class SBSwifty3DTouchTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate {

    var tblView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.title = "SBSwifty3DTouch TableView"
        setUpUserInterface()

        if (traitCollection.forceTouchCapability == .available) {
            self.registerForPreviewing(with: self, sourceView: self.view)
        }
    }
    
    func setUpUserInterface () {
        tblView = UITableView.init(frame: CGRect.init(x: 5, y: 5, width: self.view.frame.size.width - 10, height: self.view.frame.size.height - 10))
        tblView.delegate = self
        tblView.dataSource = self
        tblView.showsVerticalScrollIndicator = false
        tblView.backgroundColor = UIColor.clear
        tblView.separatorColor = UIColor.black
        tblView.tableHeaderView?.isUserInteractionEnabled = true
        tblView.tableFooterView = UIView()
        tblView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CELL-IDENTIFIER")
//        if tblView.respondsToSelector("setSeparatorInset:") {
//            tblView.separatorInset = UIEdgeInsetsZero
//
//        }
        self.view.addSubview(tblView)
    }

    // MARK: TableView Delegate And DataSource Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        // Remove seperator inset
//        if cell.respondsToSelector("setSeparatorInset:") {
//            cell.separatorInset = UIEdgeInsetsZero
//        }
//        // Prevent the cell from inheriting the Table View's margin settings
//        if cell.respondsToSelector("setPreservesSuperviewLayoutMargins:") {
//            cell.preservesSuperviewLayoutMargins = false
//        }
//
//        // Explictly set your cell's layout margins
//        if cell.respondsToSelector("setLayoutMargins:") {
//            cell.layoutMargins = UIEdgeInsetsZero
//        }
//
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CELL-IDENTIFIER", for: indexPath)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .blue
        cell.textLabel?.text = "IndexPath \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(SBSwifty3DTouchDetailViewController(), animated: true)
    }

    // MARK: Previewing Delegate Functions
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let indexPath : NSIndexPath = tblView.indexPathForRow(at: location)! as NSIndexPath
        previewingContext.sourceRect = tblView .rectForRow(at: indexPath as IndexPath)
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
