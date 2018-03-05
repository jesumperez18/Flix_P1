//
//  MovieCell.swift
//  flix
//
//  Created by Jesus perez on 1/31/18.
//  Copyright © 2018 Jesus perez. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    
    var movie: Movie! {
        didSet{
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            posterImageView.af_setImage(withURL: movie.posterUrl!)
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
