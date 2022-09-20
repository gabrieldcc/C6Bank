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
        
        for contentImage in horizontalStackImages {
            contentImage.layer.cornerRadius = 10
            contentImage.layer.masksToBounds = true
        }
    }
    
    //TODO: = Arrumar o arredondamento das views no lugar das images
    //MARK: - IBOutlets
    @IBOutlet weak private var saldoButton: UIButton!
    @IBOutlet weak private var saldoTextField: UITextField!
    @IBOutlet weak private var saldoContentView: UIView!
    @IBOutlet weak private var depositarImageContentView: UIView!
    @IBOutlet weak private var transferirImageContentView: UIView!
    @IBOutlet weak private var pagarImageContentView: UIView!
    @IBOutlet weak private var verExtratoImageContentView: UIView!
    @IBOutlet weak private var brazilImageContentView: UIView!
    @IBOutlet weak private var userButton: UIButton!
    @IBOutlet weak private var todosContentView: UIView!
    
    @IBOutlet var horizontalStackImages: [UIView]!
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
    private func setupEyeShowDataButtonImage() {
        let imageName = showBalance ? "eye.slash.fill" : "eye.fill"
        let image = UIImage.init(systemName: imageName)?.withRenderingMode(.alwaysTemplate)
        saldoButton.setImage(image, for: .normal)
    }
    
    private func roundedUpViews() {
        roundUpView(view: saldoContentView)
        roundUpView(view: verExtratoImageContentView)
        roundUpView(view: pagarImageContentView)
        roundUpView(view: depositarImageContentView)
        roundUpView(view: transferirImageContentView)
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

