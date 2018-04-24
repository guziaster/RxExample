//
//  SubtitleCell.swift
//  RxExample
//
//  Created by Piotr Guzia on 24.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import UIKit

final class SubtitleCell: UITableViewCell, NibLoadable, Reusable {
    
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func setup(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
