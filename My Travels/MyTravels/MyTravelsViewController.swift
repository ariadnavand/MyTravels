import UIKit

struct MyTravelsViewModel {
    let cellsViewModels: [CellViewModelProtocol]
}

class MyTravelsViewController: UIViewController {
    
    var output: MyTravelsPresenter?
    var viewModels: [CellViewModelProtocol] = []
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var travelCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        travelCollection.delegate = self
        travelCollection.dataSource = self
        
        let model = MyTravelsModel()
        output = MyTravelsPresenter(view: self, model: model)
        model.output = output
        output?.viewDidLoad()
    }
    
    func set(viewModel: MyTravelsViewModel) {
        viewModels = viewModel.cellsViewModels
        travelCollection.reloadData()
    }
    
    func openTravel() {
        performSegue(withIdentifier: "ShowTravel", sender: self)
    }
}

extension MyTravelsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModels[indexPath.row].cellIdentifier, for: indexPath)
        if let cell = cell as? CellProtocol {
            cell.set(viewModel: viewModels[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 32) / 3
        return CGSize(width: width, height: width + 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output?.cellDidTap(viewModel: viewModels[indexPath.row])
        print ("клик по ячейке")
    }
    
}
