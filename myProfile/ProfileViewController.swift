import UIKit

class ProfileViewController: UIViewController {
    var names = ["ちょこ", "こたろ"]
    var genders = ["メス", "オス"]
    var ages = ["6", "5"]
    var personalities = ["おとなしい", "わがまま"]
    var images = ["IMG_8131", "IMG_9221"]

    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var ageField: UILabel!
    @IBOutlet weak var genderField: UILabel!
    @IBOutlet weak var personalityField: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.text = "名前: \(names[0])"
        genderField.text = "性別: \(genders[0])"
        ageField.text = "年齢: \(ages[0])歳"
        personalityField.text = "性格: \(personalities[0])"
        let name = images[0]
        let image = UIImage(named: name)
        imageView.image = image
    }
    
    @IBAction func selectSegment(_ sender: Any) {
        
        let index = segmentedControl.selectedSegmentIndex
        
        nameField.text = "名前: \(names[index])"
        genderField.text = "性別: \(genders[index])"
        ageField.text = "年齢: \(ages[index])歳"
        personalityField.text = "性格: \(personalities[index])"
        
        let name = images[index]
        let image = UIImage(named: name)
        imageView.image = image
    }
    
}
