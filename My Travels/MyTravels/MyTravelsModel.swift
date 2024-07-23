import Foundation
import UIKit

class MyTravelsModel {
    
    weak var output: MyTravelsPresenter?
    
    func getTravels() {
        var travels = [
            Travel(image: UIImage(named: "abcd")!, name: "очень длинный текст", days: []),
            Travel(image: UIImage(named: "abcd")!, name: "12345", days: []),
            Travel(image: UIImage(named: "abcd")!, name: "654321", days: []),
            Travel(image: UIImage(named: "abcd")!, name: "jjjjjj", days: [])
        ]
        output?.travelsReceived(travels: travels)
    }
}
