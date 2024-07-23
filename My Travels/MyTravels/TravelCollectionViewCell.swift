import UIKit

struct TravelCellViewModel: CellViewModelProtocol {
    var cellIdentifier = "TravelCollectionViewCell"

    let name: String
    let photo: UIImage
    
    init(travel: Travel) {
        name = travel.name
        photo = travel.image ?? UIImage(named: "abcd")!
    }
}

class TravelCollectionViewCell: UICollectionViewCell, CellProtocol {
    
    @IBOutlet weak var travelPreviewLabel: UILabel!
    @IBOutlet weak var travelPreviewImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(viewModel: CellViewModelProtocol) {
        guard let viewModel = viewModel as? TravelCellViewModel else {
            return
        }
        travelPreviewLabel.text = viewModel.name
        travelPreviewImage.image = viewModel.photo
    }

}


