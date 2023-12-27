//
//  todoTableViewCell.swift
//  TodoPractice
//
//  Created by j_kim on 2023/09/21.
//

import UIKit

class todoTableViewCell: UITableViewCell {
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!

    func setup(icon: UIImage, name: String, age: Int) {
        iconImageView.image = icon
        nameLabel.text = name
        ageLabel.text = String(age)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
