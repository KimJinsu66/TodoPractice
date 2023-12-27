//
//  RegisterRricePageController.swift
//  TodoPractice
//
//  Created by j_kim on 2023/09/17.
//

import UIKit

class RegisterRricePageController: UIViewController {

    @IBOutlet weak var priceTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveMoneyInfo(_ sender: UIButton) {
        print(priceTextField.text)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
