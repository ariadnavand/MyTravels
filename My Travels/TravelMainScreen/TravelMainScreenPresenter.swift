import Foundation

class TravelMainScreenPresenter {
    
    weak var view: TravelMainScreenViewController?
    var model: TravelMainScreenModel?
    
    init(view: TravelMainScreenViewController? = nil, model: TravelMainScreenModel? = nil) {
        self.view = view
        self.model = model
    }
    
    func viewDidLoad() {
        
        var viewModel = MyTravelDayViewModel(cellsDayViewModels: [
            TravelDayCellViewModel(title: "очень длинный текст"),
            TravelDayCellViewModel(title: "очень длинный текст"),
            TravelDayCellViewModel(title: "очень длинный текст"),
            TravelDayCellViewModel(title: "очень длинный текст"),
            AddDayCellViewModel()
        ])

        view?.set(viewModel: viewModel)
    }
    
    
    func cellDidTap(viewModel: CellViewModelProtocol) {
        if let viewModel = viewModel as? AddDayCellViewModel  {
        }
    }
}
