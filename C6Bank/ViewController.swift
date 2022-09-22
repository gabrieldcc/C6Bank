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
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        turnViewIntoCircle()
        setShadowViews()
        saldoTextField.isUserInteractionEnabled = false
        roundUpViews()
        setLoginRules()
        
    }
    
    //MARK: - IBOutlets
    @IBOutlet var softShadow: [UIView]!
    @IBOutlet weak private var saldoButton: UIButton!
    @IBOutlet var horizontalStackImages: [UIView]!
    @IBOutlet var shadowViews: [UIView]!
    @IBOutlet var circleViews: [UIView]!
    @IBOutlet weak private var saldoTextField: UITextField!
    @IBOutlet weak var faturaTextField: UITextField!
    @IBOutlet var securityTextFields: [UITextField]!
    
    
    //MARK: - IBActions
    @IBAction func saldoButton(_ sender: Any) {
        
    }
    
    @IBAction func eyeButton(_ sender: Any) {
        if(showBalance == true) {
            setSecurityTextEntry(true)
            
        } else {
            setSecurityTextEntry(false)
        }
        showBalance = !showBalance
    }
    
    
    //MARK: - Functions
    private func setLoginRules() {
        if(showBalance == true) {
            saldoTextField.isSecureTextEntry = true
            faturaTextField.isSecureTextEntry = true
            setupEyeShowDataButtonImage()
            showBalance.toggle()
        }
    }
    
    private func setupEyeShowDataButtonImage() {
        let imageName = showBalance ? "eye.slash.fill" : "eye.fill"
        let image = UIImage.init(systemName: imageName)?.withRenderingMode(.alwaysTemplate)
        saldoButton.setImage(image, for: .normal)
    }
    
    private func roundUpViews() {
        for contentImage in horizontalStackImages {
            contentImage.layer.cornerRadius = 10
            contentImage.layer.masksToBounds = true
        }
    }
    
    private func setShadowViews() {
        for shadow in shadowViews {
            shadow.addShadow(opacity: 0.3)
        }
        
        for shadow in softShadow {
            shadow.addShadow(opacity: 0.2)
        }
    }
    
    private func setSecurityTextEntry(_ isSecurity: Bool) {
        for textfield in securityTextFields {
            textfield.isSecureTextEntry = isSecurity
            setupEyeShowDataButtonImage()
        }
    }
    
    private func turnViewIntoCircle() {
        for view in circleViews {
            view.layer.cornerRadius = view.frame.height / 2
            view.layer.masksToBounds = true
        }
    }
    
}

