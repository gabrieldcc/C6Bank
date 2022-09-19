//
//  ViewController.swift
//  C6Bank
//
//  Created by Gabriel de Castro Chaves on 19/09/22.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - Var
    private var showBalance = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedUpViews()
        turnViewIntoCircle()
        saldoTextField.isUserInteractionEnabled = false
        
        if(showBalance == true) {
            saldoTextField.isSecureTextEntry = true
            setupEyeShowDataButtonImage()
            showBalance.toggle()
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var saldoButton: UIButton!
    @IBOutlet weak var saldoTextField: UITextField!
    @IBOutlet weak var saldoContentView: UIView!
    @IBOutlet weak var verExtratoImage: UIImageView!
    @IBOutlet weak var pagarImage: UIImageView!
    @IBOutlet weak var depositarImage: UIImageView!
    @IBOutlet weak var transferirImage: UIImageView!
    @IBOutlet weak var brazilImageContentView: UIView!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var todosContentView: UIView!
    
    //MARK: - IBActions
    @IBAction func saldoButton(_ sender: Any) {
        
    }
    
    @IBAction func eyeShowData(_ sender: Any) {
        if(showBalance == true) {
            saldoTextField.isSecureTextEntry = true
            setupEyeShowDataButtonImage()
        } else {
            saldoTextField.isSecureTextEntry = false
            setupEyeShowDataButtonImage()
        }
        showBalance = !showBalance
    }
    
    
    //MARK: - Functions
    private func setupEyeShowDataButtonImage() {
        let imageName = showBalance ? "eye.slash.fill" : "eye.fill"
        let image = UIImage.init(systemName: imageName)?.withRenderingMode(.alwaysTemplate)
        saldoButton.setImage(image, for: .normal)
    }
    
    private func roundedUpViews() {
        roundUpView(view: saldoContentView)
        roundUpView(view: verExtratoImage)
        roundUpView(view: pagarImage)
        roundUpView(view: depositarImage)
        roundUpView(view: transferirImage)
        roundUpView(view: todosContentView)
    }
    
    private func roundUpView(view: UIView) {
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
    }
    
    private func turnViewIntoCircle() {
        brazilImageContentView.layer.cornerRadius = brazilImageContentView.frame.height / 2
        brazilImageContentView.layer.masksToBounds = true
        
        userButton.layer.cornerRadius = userButton.frame.height / 2
        userButton.layer.masksToBounds = true
    }

}

