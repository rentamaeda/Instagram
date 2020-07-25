//
//  ViewController.swift
//  Instagram
//
//  Created by 前田蓮太 on 2020/07/23.
//  Copyright © 2020 renta.Maeda. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
class ViewController: UIViewController {
    @IBOutlet weak var commentView: UITextView!
    
    @IBOutlet weak var gorstText: UILabel!
    @IBOutlet weak var nameView: UITextField!
    @IBAction func postView(_ sender: Any) {
        // 画像と投稿データの保存場所を定義する
             let postdataRef = Firestore.firestore().collection(Const.PostPath).document()
        // FireStoreに投稿データを保存する
        let name = self.nameView.text!
                       let textdata = [
                           "name": name,
                           "caption": self.commentView.text!,
                           ] as [String : Any]
                       postdataRef.setData(textdata)
                       // HUDで投稿完了を表示する
                       SVProgressHUD.showSuccess(withStatus: "投稿しました")
                       // 投稿処理が完了したので先頭画面に戻る
                      UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func chanselView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
}

