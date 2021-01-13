//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Ryutaro Okita on 2021/01/04.
//  Copyright © 2021 ryutarou.okita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var onNexts: UIButton!
    @IBOutlet weak var onPrevs: UIButton!
    
    

        // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    var nowIndex:Int = 0
    
    

        // スライドショーさせる画像の配列を宣言
        var imageArray:[UIImage] = [
            UIImage(named: "photo-1518664196161-4bef8d483164.jpeg")!,
            UIImage(named: "photo-1557487188-6b25fdf42260.jpeg")!,
            UIImage(named: "photo-1517524118623-cc0051fec2cc.jpeg")!,
        ]
    
   


       
        // 再生ボタンを押した時の処理
        @IBAction func slideShowButton(_ sender: Any) {
            // 再生中か停止しているかを判定
            if (timer == nil) {
                // 再生時の処理を実装

                // タイマーをセットする
                timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

                // ボタンの名前を停止に変える
                startButton.setTitle("停止", for: .normal)
                onNexts.isEnabled = false
                onPrevs.isEnabled = false

            } else {
                // 停止時の処理を実装
                // タイマーを停止する
                timer.invalidate()

                // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
                timer = nil

                // ボタンの名前を再生に直しておく
                startButton.setTitle("再生", for: .normal)
                
                onNexts.isEnabled = true
                onPrevs.isEnabled = true
            }
            
            
            
        }

        @objc func changeImage() {
            // indexを増やして表示する画像を切り替える
            nowIndex += 1

            // indexが表示予定の画像の数と同じ場合
            if (nowIndex == imageArray.count) {
                // indexを一番最初の数字に戻す
                nowIndex = 0
            }
            // indexの画像をstoryboardの画像にセットする
            imageView.image = imageArray[nowIndex]
        }
    
    
//
    
    
    
    
    
    @IBAction func onNext(_ sender: Any) {

           nowIndex += 1
           displayImage()
       }


       @IBAction func onPrev(_ sender: Any) {
           nowIndex -= 1
           displayImage()
       }

    
    
       func displayImage(){
        

           let imageNameArray = [
               "photo-1518664196161-4bef8d483164.jpeg",
               "photo-1557487188-6b25fdf42260.jpeg",
               "photo-1517524118623-cc0051fec2cc.jpeg",

           ]



           if nowIndex < 0{

               nowIndex = 2

           }


           if nowIndex > 2 {

               nowIndex = 0
           }


           let name = imageNameArray[nowIndex]

           let image = UIImage(named:name)

           imageView.image = image
       }




       override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
           let image = UIImage(named:"photo-1518664196161-4bef8d483164.jpeg")
           imageView.image = image

       }
    
   
    
       
       
//    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let secondViewController:SecondViewController = segue.destination as! SecondViewController
            
        
        if (timer == nil) {
                       
            secondViewController.image=imageArray[nowIndex]

                   } else {
            timer.invalidate()
            secondViewController.image=imageArray[nowIndex]
                       
                   }
        
        
        
        
    }
        
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
        onNexts.isEnabled = true
        onPrevs.isEnabled = true
    }
    
    
    
    

}


    
    
    
   




