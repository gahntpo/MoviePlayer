//
//  MovieCell.swift
//  MoviePlayer
//
//  Created by Karin Prater on 06.08.21.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var movie: Movie?  {
        didSet {
            if let movie = movie, let url = URL(string: movie.posterImageURL) {
                
                ImageCache.publicCache.load(url: url as NSURL, movie: movie) { [weak self] movie, image in
                    
                    if let  image = image, self?.movie == movie {
                        
                        self?.accessoryImageView.image = image
                        if let contentWidth = self?.contentView.frame.width, let spacing = self?.spacing {
//                            let width = contentWidth - 2 * spacing
//                            let ratio = image.size.width / image.size.height
             //                            self?.heightConstraint?.constant = width / ratio
                            //TODO: fix layout error
                        }
                    }
                    
                }
                
            }
            
            
        }
    }
    
    let imageLoader = ImageLoader()
    
    static let identifier = "movieCell"
    let titleLabel = UILabel()
    let accessoryImageView = UIImageView()
    var heightConstraint: NSLayoutConstraint?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func configure() {
      //TODO: - when to call configure?
        accessoryImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
       
        contentView.addSubview(accessoryImageView)
        contentView.addSubview(titleLabel)

        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textAlignment = .center
        
        accessoryImageView.layer.cornerRadius = 20
        accessoryImageView.clipsToBounds = true
        accessoryImageView.layer.shadowColor = UIColor.gray.cgColor
        accessoryImageView.layer.shadowRadius = 10
        accessoryImageView.backgroundColor = UIColor.systemBackground
        
        accessoryImageView.image = UIImage(named: "MovieDisabled")
        accessoryImageView.contentMode = UIView.ContentMode.scaleAspectFill
        
      
        NSLayoutConstraint.activate([
            accessoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            accessoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            accessoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: spacing),
            accessoryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -2 * spacing),
            accessoryImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            
            
            titleLabel.topAnchor.constraint(equalTo: accessoryImageView.bottomAnchor, constant: spacing),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,  constant: spacing),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,  constant: -spacing),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,  constant: -spacing)
            ])
        
//        self.heightConstraint = accessoryImageView.heightAnchor.constraint(equalToConstant: 200)
//        self.heightConstraint?.isActive = true
        
    }
    let spacing = CGFloat(10)
    

}
