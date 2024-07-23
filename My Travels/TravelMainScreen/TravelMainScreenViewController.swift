import Foundation
import UIKit

struct MyTravelDayViewModel {
    let cellsDayViewModels: [CellViewModelProtocol]
}

class TravelMainScreenViewController: UIViewController {
    
    var output: TravelMainScreenPresenter?
    var viewModels: [CellViewModelProtocol] = []
    
    @IBOutlet weak var nameTravellabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let model = TravelMainScreenModel()
        output = TravelMainScreenPresenter(view: self, model: model)
        model.output = output
        output?.viewDidLoad()
    }
    func set(viewModel: MyTravelDayViewModel) {
        viewModels = viewModel.cellsDayViewModels
        tableView.reloadData()
    }

}

extension TravelMainScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModels[indexPath.row].cellIdentifier, for: indexPath)
        if let cell = cell as? CellProtocol {
            cell.set(viewModel: viewModels[indexPath.row])
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output?.cellDidTap(viewModel: viewModels[indexPath.row])
        print ("клик по ячейке")
    }
    //создать экземпляры презентер и модель
    //создать кнопку добавления нового дня (ячейка)
    //создать тестовые данные
     
    
}
