//
//  SignUpViewController.swift
//  LoginApp
//
//  Created by Lakshmi on 18/11/20.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func didCreateAccount(_ sender: AnyObject) {
        showTextInputPrompt(withMessage: "Email:") {  [weak self] userPressedOK, email in
          guard let strongSelf = self else { return }
          guard let email = email else {
            strongSelf.showMessagePrompt("email can't be empty")
            return
          }
          strongSelf.showTextInputPrompt(withMessage: "Password:") { userPressedOK, password in
            guard let password = password else {
              strongSelf.showMessagePrompt("password can't be empty")
              return
            }
            strongSelf.showSpinner {
              Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                strongSelf.hideSpinner {
                  guard let user = authResult?.user, error == nil else {
                    strongSelf.showMessagePrompt(error!.localizedDescription)
                    return
                  }
                  print("\(user.email!) created")
                  strongSelf.navigationController?.popViewController(animated: true)
                }
              }
            }
          }
        }
      }

}
