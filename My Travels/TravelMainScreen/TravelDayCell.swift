import UIKit

struct TravelDayCellViewModel: CellViewModelProtocol {
    
    var cellIdentifier = "TravelDayCell"
    
    let title: String
}

class TravelDayCell: UITableViewCell, CellProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func set(viewModel: CellViewModelProtocol) {
        guard let viewModel = viewModel as? TravelDayCellViewModel else {
            return
        }
        titleLabel.text = viewModel.title
    }
}
