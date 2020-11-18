//
//  PAsswordResetViewController.swift
//  LoginApp
//
//  Created by Lakshmi on 18/11/20.
//

import UIKit

class PAsswordResetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didRequestPasswordReset(_ sender: AnyObject) {
        showTextInputPrompt(withMessage: "Email:") { [weak self] userPressedOK, email in
          guard let strongSelf = self, let email = email else {
            return
          }
          strongSelf.showSpinner {

            Auth.auth().sendPasswordReset(withEmail: email) { error in
              strongSelf.hideSpinner {
                if let error = error {
                  strongSelf.showMessagePrompt(error.localizedDescription)
                  return
                }
                strongSelf.showMessagePrompt("Sent")
              }
            }
          }
        }
      }
}
