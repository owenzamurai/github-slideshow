//
//  ViewController.swift
//  timer
//
//  Created by Takuya Nomura on 2020/10/01.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var SlideShow: UIButton!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0

    // スライドショーさせる画像の配列を宣言
    var appimage:[UIImage] = [
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3")!,
        UIImage(named: "image4")!,
        UIImage(named: "image5")!
        ]
    
    // タイマー
       var timer: Timer!
    // タイマー用の時間のための変数
        var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ImageView.isUserInteractionEnabled = true
    }
    

    @IBAction func NextImage(_ sender: Any) {
        // indexを増やして表示する画像を切り替える
            nowIndex += 1

                // indexが表示予定の画像の数と同じ場合
            if (nowIndex == appimage.count) {
                // indexを一番最初の数字に戻す
                nowIndex = 0
            }
            // indexの画像をstoryboardの画像にセットする
            ImageView.image = appimage[nowIndex]
    }
    
    @IBAction func BackImage(_ sender: Any) {
        if(nowIndex > 0){
        // indexを増やして表示する画像を切り替える
            nowIndex -= 1
            ImageView.image = appimage[nowIndex]
        // indexが表示予定の最後の画像の数と同じ場合
        }
        else if(nowIndex == 0) {
            // indexを一番最初の数字に戻す
            nowIndex = 4
            ImageView.image = appimage[nowIndex]
        }
    }
    
    @IBAction func SlideShowButton(_ sender: Any) {
        // 再生中か停止しているかを判定
            if (timer == nil) {
                // 再生時の処理を実装

                // タイマーをセットする
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

                    // ボタンの名前を停止に変える
                SlideShow.setTitle("Stop", for: .normal)
                //NEXTとBACKのボタンを無効化
                NextButton.isEnabled = false
                BackButton.isEnabled = false
            
                } else {
                    // 停止時の処理を実装
                    // タイマーを停止する
                    timer.invalidate()

                    // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
                    timer = nil

                    // ボタンの名前を再生に直しておく
                    SlideShow.setTitle("Start", for: .normal)
                    //NEXTとBACKのボタンを有効化
                    NextButton.isEnabled = true
                    BackButton.isEnabled = true
                    
                }
            }

    @objc func changeImage(_ timer: Timer) {
            // indexを増やして表示する画像を切り替える
            nowIndex += 1
                // indexが表示予定の画像の数と同じ場合
                if (nowIndex == appimage.count) {
                    // indexを一番最初の数字に戻す
                    nowIndex = 0
                }
                // indexの画像をstoryboardの画像にセットする
                ImageView.image = appimage[nowIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // segueから遷移先のResultViewControllerを取得する
           let secondViewController:SecondViewController = segue.destination as! SecondViewController
           // 遷移先のResultViewControllerで宣言しているViewに値を代入して渡す
        secondViewController.x = appimage[nowIndex]
    }
    
    @IBAction func BackHome(_ segue: UIStoryboardSegue) {
            // 他の画面から segue を使って戻ってきた時に呼ばれる
        }
    
    
    
}
