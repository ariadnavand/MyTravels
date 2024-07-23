import Foundation
import UIKit


class MyTravelsPresenter {
    
    weak var view: MyTravelsViewController?
    var model: MyTravelsModel?
    
    init(view: MyTravelsViewController?, model: MyTravelsModel?) {
        self.view = view
        self.model = model
    }
    
    func viewDidLoad() {
        model?.getTravels()
    }
    
    func cellDidTap(viewModel: CellViewModelProtocol) {
        if let viewModel = viewModel as? AddTravelCellViewModel  {
            view?.openTravel()
        }
    }
    
    func travelsReceived(travels: [Travel]) {
        var viewModels: [CellViewModelProtocol] = travels.map { travel in
            return TravelCellViewModel(travel: travel)
        }
        viewModels.append(AddTravelCellViewModel())
        
        var viewModel = MyTravelsViewModel(cellsViewModels: viewModels)
        view?.set(viewModel: viewModel)
    }
    
    
}
