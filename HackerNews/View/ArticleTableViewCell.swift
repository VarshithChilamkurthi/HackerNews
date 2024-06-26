//
//  ArticleTableViewCell.swift
//  HackerNews
//
//  Created by Varshith Chilamkurthi on 25/06/24.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var articleUrlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(setter: HighlightResult) {
        titleLabel.text = setter.title?.value
        authorLabel.text = setter.author?.value
        articleUrlLabel.text = setter.url?.value
    }
}
