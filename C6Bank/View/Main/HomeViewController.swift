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
    private var isTap = true
    private var exibirMenosImages = [UIImage(named: "c1"), UIImage(named: "c2"), UIImage(named: "c3"), UIImage(named: "c4"), UIImage(named: "c5")]
    private var exibirMaisImages = [UIImage(named: "d1"), UIImage(named: "d2"), UIImage(named: "d3"), UIImage(named: "d4"), UIImage(named: "d5")]
    
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
    @IBOutlet weak private var exibirButtonImage: UIImageView!
    @IBOutlet weak private var exibirBannerButton: UIButton!
    @IBOutlet private var bannerImages: [UIImageView]!
    @IBOutlet weak private var bannersWidthConstraints: NSLayoutConstraint!
    @IBOutlet weak private var bannersHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var bannersScrollView: UIScrollView!
    @IBOutlet weak private var bannersContentView: UIView!
    @IBOutlet private var softShadow: [UIView]!
    @IBOutlet weak private var saldoButton: UIButton!
    @IBOutlet private var horizontalStackImages: [UIView]!
    @IBOutlet private var shadowViews: [UIView]!
    @IBOutlet var circleViews: [UIView]!
    @IBOutlet weak private var saldoTextField: UITextField!
    @IBOutlet weak var faturaTextField: UITextField!
    @IBOutlet private var securityTextFields: [UITextField]!
    
    //MARK: - IBActions
    @IBAction private func eyeButton(_ sender: Any) {
        if showBalance {
            setSecurityTextEntry(true)
        } else {
            setSecurityTextEntry(false)
        }
        showBalance.toggle()
    }
    
    @IBAction private func exibirBannerButton(_ sender: UIButton) {
        if isTap {
            animateBannerView(height: 70)
            setBannerImages(imageList: exibirMaisImages)
            setExibirButton(title: "Exibir mais", image: "chevron.down")
        } else {
            animateBannerView(height: 230)
            setBannerImages(imageList: exibirMenosImages)
            setExibirButton(title: "Exibir menos", image: "chevron.up")
        }
        isTap.toggle()
    }
    
    //MARK: - Functions
    
    private func setExibirButton(title: String, image: String) {
        exibirBannerButton.setTitle(title, for: .normal)
        exibirButtonImage.image = UIImage(systemName: image)
        setViewTransition(exibirBannerButton)
        setViewTransition(exibirButtonImage)
    }
    
    private func setViewTransition(_ view: UIView) {
        let transition = CATransition()
          transition.type = CATransitionType.fade
        transition.duration = 1.0
          transition.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.default)
          view.layer.add(transition, forKey: nil)
    }
    
    private func animateBannerView(height: CGFloat) {
        UIView.animate(withDuration: 0.3, animations: {
            self.bannersHeightConstraint.constant = 10
            self.bannersWidthConstraints.constant = 10
            self.view.layoutIfNeeded()
        }) { (_ ) in
            UIView.animate(withDuration: 0.3, animations: {
                self.bannersHeightConstraint.constant = height
                self.bannersWidthConstraints.constant = 1500
                self.view.layoutIfNeeded()
            })
        }
    }
    
    private func setBannerImages(imageList: [UIImage?]) {
        for index in 0..<bannerImages.count {
            bannerImages[index].image = imageList[index]
        }
    }
    
    private func setLoginRules() {
        if showBalance {
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
            contentImage.roundUpViews()
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
            view.turnViewIntoCircle()
        }
    }
    
}




