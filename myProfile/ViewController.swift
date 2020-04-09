import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    
    var imgNo = 0
    let imgArray = ["IMG_8131", "IMG_7161", "IMG_8195", "IMG_9221"]
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "IMG_9185")
        imageView.image = image
    }
    
    func slideShow(){
        let name = imgArray[imgNo]
        let image = UIImage(named: name)
        imageView.image = image
    }

    @IBAction func nextButtonTap(_ sender: Any) {
        if imgNo < imgArray.count - 1 {
            imgNo += 1
            slideShow()
        } else {
            imgNo = 0
            slideShow()
        }
    }
    @IBAction func backButtonTap(_ sender: Any) {
        if imgNo > 0 {
            imgNo -= 1
            slideShow()
        } else {
            imgNo = imgArray.count - 1
            slideShow()
        }
        
    }
    
    @IBAction func switchButtonTap(_ sender: Any) {
         if self.timer == nil {
                    // タイマーを設定
                    self.timer = Timer.scheduledTimer(timeInterval: 1.0,
                   target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
                    // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
                    nextButton.isEnabled = false
                    backButton.isEnabled = false
                    // ボタンの名前を停止とする
                    
                    switchButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
                    
                } else if self.timer != nil {
                    // タイマーを停止
                    self.timer.invalidate()
                    // nil にして再び再生(nil の時にタイマー生成)
                    self.timer = nil
                    // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
                    nextButton.isEnabled = true
                    backButton.isEnabled = true
                    // ボタンの名前を再生とする
                    switchButton.setImage(UIImage(systemName: "play.fill"), for: .normal)

                }
            }

                // #selectorで呼び出される関数
                @objc func updateTimer(_ timer: Timer) {
                    // 進むボタンの内容を行う
                    if imgNo < imgArray.count - 1 {
                        // 表示している画像の番号を1増やす
                        imgNo += 1
                        // 表示している画像の番号を元に画像を表示する
                        slideShow()
//                        print(imgNo) // 取得インデックスの確認
                    } else {
                        imgNo = 0
                        slideShow()
//                        print(imgNo) // 取得インデックスの確認
                    }
        
    }
    
}

