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
    @IBOutlet weak var blueView: UIView!
    @IBOutlet var softShadow: [UIView]!
    @IBOutlet weak private var saldoButton: UIButton!
    @IBOutlet weak private var saldoTextField: UITextField!
    @IBOutlet weak private var brazilImageContentView: UIView!
    @IBOutlet weak private var userButton: UIButton!
    @IBOutlet var horizontalStackImages: [UIView]!
    
    @IBOutlet var shadowViews: [UIView]!
    @IBOutlet weak var buttonsContentView: UIView!
    //MARK: - IBActions
    @IBAction func saldoButton(_ sender: Any) {
        
    }
    
    @IBAction func eyeButton(_ sender: Any) {
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
    private func setLoginRules() {
        if(showBalance == true) {
            saldoTextField.isSecureTextEntry = true
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
    
    private func turnViewIntoCircle() {
        brazilImageContentView.layer.cornerRadius = brazilImageContentView.frame.height / 2
        brazilImageContentView.layer.masksToBounds = true
        
        userButton.layer.cornerRadius = userButton.frame.height / 2
        userButton.layer.masksToBounds = true
    }

}

