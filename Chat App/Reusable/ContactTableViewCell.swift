//
//  ChatsTableVIewCell.swift
//  Chat App
//
//  Created by SST PC on 04/07/24.
//

import UIKit
import SDWebImage

class ContactTableViewCell: UITableViewCell {
    
    var data: FriendsDataModel? {
        didSet {
            setData()
        }
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var messageStatusImageView: UIImageView!
    @IBOutlet weak var messageTypeImageView: UIImageView!
    @IBOutlet weak var lastMessageStackView: UIStackView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    func setData() {
        guard let data else {
            return
        }
        
        lblName.text = data.personalDetail?.name
        lblMessage.text = data.message
        
        if let imageURLStr = data.personalDetail?.profilePhotoUrl, let imageURL = URL(string: imageURLStr) {
            profileImageView.sd_setImage(with: imageURL)
            
        }
    }
}
