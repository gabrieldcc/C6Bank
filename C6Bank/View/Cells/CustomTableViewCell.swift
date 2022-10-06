//
//  CustomsTableViewCell.swift
//  C6Bank
//
//  Created by Gabriel de Castro Chaves on 03/10/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    public func setCell(text: String, image: String) {
        self.cellImage.image = UIImage(named: image) ?? UIImage(systemName: image)
        self.cellLabel.text = text
    }
    
}
