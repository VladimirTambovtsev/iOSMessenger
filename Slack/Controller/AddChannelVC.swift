//
//  AddChannelVC.swift
//  Slack
//
//  Created by Vladimir on 28.01.2020.
//  Copyright © 2020 Vladimir Tambovtsev. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var channelNameTxtField: UITextField!
    @IBOutlet weak var descriptionTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    @IBAction func onCloseBtnTaped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCreateBtnTaped(_ sender: Any) {
        guard let channelName = channelNameTxtField.text, channelNameTxtField.text != "" else { return }
        guard let channelDescription = descriptionTxtField.text, descriptionTxtField.text != "" else { return }
        
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDescription) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil    )
            }
        }
    }

    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
