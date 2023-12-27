//
//  DetailViewController.swift
//  TodoPractice
//
//  Created by j_kim on 2023/09/23.
//

import UIKit
import Firebase

class DetailViewController: UIViewController {

    var memo: Memo!
    
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var memoTitleField: UITextField!
    
    let firebaseDb: DatabaseReference? = Database.database().reference() // firebase
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTextView.text = memo?.detail
        memoTitleField.text = memo?.title
    }
    
    @IBAction func inputMemo(_ sender: UIButton) {
            firebaseDb?.child("users")
                   .child("jinsu6688")
                   .child("memos")
                   .childByAutoId()
                   .setValue(["title": memoTitleField.text!, "text": memoTextView.text!])
    }
    
    @IBAction func updateMemo(_ sender: UIButton) {
        let post = ["title": memoTitleField.text!, "text": memoTextView.text!]
        
        let childUpdates = ["/users/jinsu6688/memos/\(memo!.id)": post]
        firebaseDb?.updateChildValues(childUpdates)
    }
}
