//
//  NewsDisplayTableViewCell.swift
//  IndiaToday
//
//  Created by Nithya Nehru on 06/07/22.
//

import UIKit
import Kingfisher

class NewsDisplayTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak private var titleLbl: UILabel!
    @IBOutlet weak private var descriptionLbl: UILabel!
    @IBOutlet weak private var headlineImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        headlineImgView.layer.cornerRadius = 8
        headlineImgView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.headlineImgView.image = UIImage(named: "errorImage")
    }

}
extension NewsDisplayTableViewCell {
    
    func loadArticlesData(articleResults: Article) {
        titleLbl.text =  articleResults.sourceName
        descriptionLbl.text =  articleResults.title
        guard let imageURL = articleResults.imageURL else {
            return
        }
        if imageURL.isValidURL {
            let loadingURLImage = URL(string: imageURL)
            headlineImgView.kf.indicatorType = .activity
            headlineImgView.kf.setImage(with: loadingURLImage)
        }
        
    }
}


