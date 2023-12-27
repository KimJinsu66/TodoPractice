//
//  MemoListController.swift
//  TodoPractice
//
//  Created by j_kim on 2023/09/17.
//

import UIKit
import Firebase

class MemoListController: UITableViewController {

    @IBOutlet weak var MemoTableView: UITableView!
    var memoList = [String]()
    
    var memos: [Memo] = []
    let userDefaults = UserDefaults.standard // 핸드폰에 개인적으로 저장하기 위해 추가
    let firebaseDb: DatabaseReference? = Database.database().reference() // firebase
    
    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()
        
        firebaseDb!.child("users/jinsu6688/memos").observe(.value) { snapshot in
            self.memos = []
            
            print("値が変更されました: \(snapshot.value as AnyObject)")
            // var dataArray: [[String: Any]] = [] // データを保持する配列

            // データを反復処理
            if let value = snapshot.value as? [String: Any] {
                for (key, data) in value {
                    if let dataDict = data as? [String: Any] {
                        let memo = Memo.init(id: key, title: dataDict["title"] as! String, detail: dataDict["text"] as! String)
                        self.memos.append(memo)
                    }
                }
            }
            

            self.MemoTableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoListCell", for: indexPath)

        let titleLabel = cell.viewWithTag(2) as! UILabel
        titleLabel.text = self.memos[indexPath.row].title

        return cell
    }


    @IBAction func addMemoAction(_ sender: Any) {
        let alertController = UIAlertController(title: "메모추가", message: "메모의 타이틀을 입력해주세요", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField(configurationHandler: nil)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (acrion: UIAlertAction) in
            if let textField = alertController.textFields?.first {
                self.firebaseDb!.child("users")
                       .child("jinsu6688")
                       .child("memos")
                       .childByAutoId()
                       .setValue(["title": textField.text!, "text": ""])

            }
        }
        alertController.addAction(okAction)
        
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare test0: \(segue)")
        print("prepare test1: \(segue.identifier)")
        print("prepare test2: \(segue.destination)")
        if let destination = segue.destination as?
            DetailViewController {
            if let selectdeIndex =
                self.tableView.indexPathForSelectedRow?.row {
                destination.memo = memos[selectdeIndex]
            }
        }
    }
    
    // 利用してない
    func getAllData() {
        firebaseDb?.child("users/jinsu6688/memos").getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }

            print("jlog: get request success");
            var dataArray: [[String: Any]] = [] // データを保持する配列

            // データを反復処理
            if let value = snapshot?.value as? [String: Any] {
                for (key, data) in value {
                    if let dataDict = data as? [String: Any] {
                        print("data: \(data)")
                        print("data: \(String(describing: dataDict["text"]))")
                        let memo = Memo.init(id: key, title: dataDict["title"] as! String , detail: dataDict["text"] as! String)
                        print(memo)
                        self.memos.append(memo)
                    }
                }
            }
            self.MemoTableView.reloadData()
        });

    }
    
}
