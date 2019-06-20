//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Takuya Hatakeyama on 2019/06/12.
//  Copyright © 2019 Takuya Hatakeyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func onNext(_ sender: Any) {
        // 表示しているスライドが最後のスライドの場合
        if dispImageNo == 2{
            dispImageNo = 0
            //通常時の処理
        } else {
           dispImageNo += 1
        }
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func onBack(_ sender: Any) {
        // 表示しているスライドが最初のスライドの場合
        if dispImageNo == 0{
            dispImageNo = 2
        //通常時の処理
        }else{
            dispImageNo -= 1
        }
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBOutlet weak var startStop: UIButton!
    
    
    @IBAction func onStartStop(_ sender:  UIButton) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
           self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            
           sender.setTitle("停止", for: .normal)
            
            backButton.isEnabled = false // ボタン無効
            nextButton.isEnabled = false // ボタン無効
        }else{
            self.timer.invalidate()   // 自動送りを停止する
            self.timer = nil
            sender.setTitle("再生", for: .normal)
            
            backButton.isEnabled = true // ボタン有効
            nextButton.isEnabled = true // ボタン有効
        }
    }
    
    
    @objc func onTimer(_ timer: Timer) {
        // 表示しているスライドが最後のスライドの場合
        if dispImageNo == 2{
            dispImageNo = 0
            
            //通常時の処理
        } else {
            dispImageNo += 1
        }
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
       //segueから遷移先のExViewControllerを取得する
        let  exViewController:ExViewController = segue.destination as! ExViewController
        exViewController.image1 = imageView.image
        
        if self.timer != nil{
            self.timer.invalidate()   // 自動送りを停止する
            self.timer = nil
            startStop.setTitle("再生", for: .normal)
        }
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    // タイマー
    var timer: Timer!
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 表示している画像の番号を元に画像を表示する関数
    func displayImage() {
        
    let imageNameArray = [
        "home-office-336373_1920",
        "images",
        "509615012-612x612"
    ]
      
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画像ファイルを読み込み
        let image = UIImage(named: "homeoffice-336373_1920")
        
        //imageViewに画像を設定
        imageView.image = image
    }

}

