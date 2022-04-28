//
//  MealCell.swift
//  reshape
//
//  Created by Иван Фомин on 05.04.2022.
//

import UIKit

final class MealCell: AbstractCell {
    private var checkCircleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "notRememberButton")
        return imageView
    }()
    
    private var caloriesLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkVioletColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        caloriesLabel.text = ""
        checkCircleImage.image = UIImage(named: "notRememberButton")
    }
    
    func setupCell() {
        self.addSubview(checkCircleImage)
        self.addSubview(caloriesLabel)
        setupConstarints()
    }
    
    func setupConstarints() {
        checkCircleImage.translatesAutoresizingMaskIntoConstraints = false
        checkCircleImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 11).isActive = true
        checkCircleImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        checkCircleImage.height(12)
        checkCircleImage.width(12)
        
        self.changeLeftTextConstraint(toAnchor: checkCircleImage.rightAnchor, constant: 6)
        
        caloriesLabel.translatesAutoresizingMaskIntoConstraints = false
        caloriesLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        caloriesLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        caloriesLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        caloriesLabel.height(17)
    }
    
    func setMealInformation(name: String, calories: Double, state: Bool) {
        setCellText(name)
        caloriesLabel.text = "\(Int(calories)) ккал"
        setState(at: state)
    }
    
    func setState(at state: Bool) {
        if state {
            checkCircleImage.image = UIImage(named: "rememberButton")
        } else {
            checkCircleImage.image = UIImage(named: "notRememberButton")
        }
    }
}
