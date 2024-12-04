//
//  CashTableViewCell.swift
//  CoreExpense
//
//  Created by Pavithran P K on 22/10/24.
//

import UIKit

class CashTableViewCell: UITableViewCell {

    @IBOutlet weak var dtlsLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var cashCellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cashCellView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
