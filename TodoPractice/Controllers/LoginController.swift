//
//  LoginController.swift
//  TodoPractice
//
//  Created by j_kim on 2023/09/30.
//

import UIKit
import FirebaseAuth

class LoginController: UIViewController {
    @IBOutlet weak var textUserPassword: UITextField!
    @IBOutlet weak var textUserEmail: UITextField!
    @IBOutlet weak var loginValidationText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: UIButton) {
        guard let userEmail = textUserEmail.text else { return }
        guard let userPassword = textUserPassword.text else  { return }
        
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { [weak self] authResult, error in
            guard self != nil else { return }

            if authResult != nil {
                print("로그인 되었습니다")
                guard let homeVC = self?.storyboard?.instantiateViewController(withIdentifier: "HomeTabBarController") else { return }
                self?.navigationController?.pushViewController(homeVC, animated: true)
                self?.loginValidationText.text = ""
            
            } else {
                print("로그인되지 않았습니다.", error?.localizedDescription ?? "")
                self?.loginValidationText.text = "Email or Password가 다릅니다. 다시한번 확인해주세요."
            }
        }
    }
}
