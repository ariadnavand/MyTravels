import Foundation

protocol CellViewModelProtocol {
    
    var cellIdentifier: String { get }
}

protocol CellProtocol {
    func set(viewModel: CellViewModelProtocol)
}
