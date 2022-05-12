
import UIKit

class EmpCell: UITableViewCell {

    
    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var salaryLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    class func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> EmpCell {
        tableView.register(UINib(nibName: "EmpCell", bundle: Bundle.main), forCellReuseIdentifier: "EmpCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmpCell", for: indexPath) as! EmpCell
        return cell
    }
    
}
