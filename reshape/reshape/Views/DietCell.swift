//
//  DietTableViewController.swift
//  reshape
//
//  Created by Иван Фомин on 29.03.2022.
//

import UIKit

final class DietCell: UITableViewCell {
    private let mealTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blackVioletColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    private var disclosureImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = nil
        return imageView
    }()
    
    private var disclosureWidthConstraints: NSLayoutConstraint = NSLayoutConstraint()
    private var disclosureHeightConstraints: NSLayoutConstraint = NSLayoutConstraint()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "DietCell")
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.addSubview(mealTypeLabel)
        self.addSubview(disclosureImage)
        backgroundColor = UIColor.modalViewGrayColor
        setupConstraints()
    }
    
    private func setupConstraints() {
        mealTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        mealTypeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 11).isActive = true
        mealTypeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        mealTypeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 36).isActive = true
        mealTypeLabel.height(17)
        
        disclosureImage.translatesAutoresizingMaskIntoConstraints = false
        disclosureWidthConstraints = disclosureImage.widthAnchor.constraint(equalToConstant: 6)
        disclosureHeightConstraints = disclosureImage.heightAnchor.constraint(equalToConstant: 14)
        disclosureImage.centerXAnchor.constraint(equalTo: self.rightAnchor, constant: -19).isActive = true
        disclosureImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        disclosureHeightConstraints.isActive = true
        disclosureWidthConstraints.isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mealTypeLabel.text = ""
        disclosureImage.image = nil
    }
    
    func setText(_ text: String) {
        mealTypeLabel.text = text
    }
    
    func disclosure(_ state: DisclosureState, animated: Bool = true) {
        switch state {
        case .closure:
            if animated {
                disclosureImage.rotateAntiClockwise()
            }
            disclosureImage.image = nil
            disclosureImage.image = UIImage(named: "Closure")
            disclosureWidthConstraints.constant = 6
            disclosureHeightConstraints.constant = 14
        case .reload:
            return
        case .disclosure:
            if animated {
                disclosureImage.rotateClockwise()
            }
            disclosureImage.image = nil
            disclosureImage.image = UIImage(named: "Disclosure")
            disclosureWidthConstraints.constant = 14
            disclosureHeightConstraints.constant = 6
        }
    }
}
