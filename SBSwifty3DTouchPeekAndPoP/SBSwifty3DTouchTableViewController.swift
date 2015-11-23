

import UIKit

class SBSwifty3DTouchTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate {

    var tblView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "SBSwifty3DTouch TableView"
        setUpUserInterface()

        if (traitCollection.forceTouchCapability == .Available) {
            self.registerForPreviewingWithDelegate(self, sourceView: self.view)
        }
    }
    
    func setUpUserInterface () {
        
     
        tblView = UITableView (frame: CGRectMake(5, 5, self.view.frame.size.width - 10, self.view.frame.size.height - 10), style: .Plain)
        tblView.delegate = self
        tblView.dataSource = self
        tblView.showsVerticalScrollIndicator = false
        tblView.backgroundColor = UIColor.clearColor()
        tblView.separatorColor = UIColor.blackColor()
        tblView.tableHeaderView?.userInteractionEnabled = true
        tblView.tableFooterView = UIView(frame: CGRectZero)
        if tblView.respondsToSelector("setSeparatorInset:") {
            tblView.separatorInset = UIEdgeInsetsZero
            
        }

        self.view.addSubview(tblView)
        
        
    }

    // MARK: TableView Delegate And DataSource Functions
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        // Remove seperator inset
        if cell.respondsToSelector("setSeparatorInset:") {
            cell.separatorInset = UIEdgeInsetsZero
        }
        // Prevent the cell from inheriting the Table View's margin settings
        if cell.respondsToSelector("setPreservesSuperviewLayoutMargins:") {
            cell.preservesSuperviewLayoutMargins = false
        }
        
        // Explictly set your cell's layout margins
        if cell.respondsToSelector("setLayoutMargins:") {
            cell.layoutMargins = UIEdgeInsetsZero
        }
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cellIdentifier = "CELL-IDENTIFIER"
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        
        if cell == nil {
            
            cell = UITableViewCell (style: UITableViewCellStyle.Value1, reuseIdentifier: cellIdentifier)
            cell?.backgroundColor = UIColor.clearColor()
            cell?.selectionStyle = UITableViewCellSelectionStyle.Blue
            
        }
       
        cell?.textLabel?.text = "IndexPath \(indexPath.row)"
        
        
        return cell!

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        self.navigationController?.pushViewController(SBSwifty3DTouchDetailViewController(), animated: true)

    }
    
    // MARK: Previewing Delegate Functions
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let indexPath : NSIndexPath = tblView.indexPathForRowAtPoint(location)!      
        previewingContext.sourceRect = tblView .rectForRowAtIndexPath(indexPath)
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
