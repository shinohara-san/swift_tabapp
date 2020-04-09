import UIKit

class OmikujiViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var omikuji: UIButton!
    @IBOutlet weak var reset: UIButton!
    
    let lucks = ["daikichi", "kichi", "kyo"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        omikuji.isEnabled = true
        reset.isEnabled = false
    }
    @IBAction func omikujiTap(_ sender: Any) {
        index = Int.random(in: 0..<lucks.count)
        let image = UIImage(named: lucks[index])
        imageView.image = image
        
        omikuji.isEnabled = false
        reset.isEnabled = true
    }
    @IBAction func resetTap(_ sender: Any) {
        imageView.image = UIImage(named: "omikuji")
        omikuji.isEnabled = true
        reset.isEnabled = false
    }
    
}
