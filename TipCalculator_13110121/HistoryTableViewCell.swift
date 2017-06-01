//
//  HistoryTableViewCell.swift
//  TipCalculator_13110121
//
//  Created by Pham Huu Nhu on 6/2/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var txtMoneyHistory: UITextField!
    @IBOutlet weak var txtTipAmountHistory: UITextField!
    @IBOutlet weak var txtResultHistory: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
