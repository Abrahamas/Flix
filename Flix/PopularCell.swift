//
//  PopularCell.swift
//  Flix
//
//  Created by Mac on 7/22/1397 AP.
//  Copyright © 1397 Abraham Asmile. All rights reserved.
//

import UIKit

class PopularCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var posterImage: UIImageView!
    
    var movies: Movie!{
        didSet {
            titleLabel.text = movies.title
            overviewLabel.text = movies.overview
            let baseUrlString = "https://image.tmdb.org/t/p/w500"
            
            
            let posterpathURL = URL(string: baseUrlString + movies.posterUrl!)!
            posterImage.af_setImage(withURL: posterpathURL)
        }
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
