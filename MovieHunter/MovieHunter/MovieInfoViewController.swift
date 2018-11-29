//
//  MovieInfoViewController.swift
//  MovieHunter
//
//  Created by Jingxi Huang on 11/25/18.
//  Copyright © 2018 Jingxi Huang. All rights reserved.
//

import Foundation
import UIKit

class MovieInfoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratedLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var awardsLabel: UILabel!
//    @IBOutlet weak var ratingsLabel: UILabel!
    
    var image: UIImage?
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            nameLabel.text = "Title: \(movie.name!)"
            nameLabel.numberOfLines = 0
            yearLabel.text = "Year: \(movie.year!)"
            ratedLabel.text = "Rated: \(movie.rated!)"
            runtimeLabel.text = "Runtime: \(movie.runtime!)"
            directorLabel.text = "Director: \(movie.director!)"
            writerLabel.text = "Writer: \(movie.writer!)"
            actorsLabel.text = "Actors: \(movie.actors!)"
            actorsLabel.numberOfLines = 0
            plotLabel.text = "Plot: \(movie.plot!)"
            plotLabel.numberOfLines = 0
            languageLabel.text = "Language: \(movie.language!)"
            awardsLabel.text = "Awards: \(movie.awards!)"
            awardsLabel.numberOfLines = 0
//            ratingsLabel.text = "IMDB Ratings: \(movie.ratings!)"
            
            if let image = image {
                imageView.image = image
            } else {
                let url = URL(string: movie.imageUrl)!
                let session = URLSession(configuration: .default)
                let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
                    if let e = error {
                        print("Error downloading picture: \(e)")
                    } else {
                        if let _ = response as? HTTPURLResponse {
                            if let imageData = data {
                                DispatchQueue.main.async {
                                    self.imageView.image = UIImage(data: imageData)
                                }
                            } else {
                                print("Couldn't get image: Image is nil")
                            }
                        } else {
                            print("Couldn't get response code")
                        }
                    }
                }
                downloadPicTask.resume()
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

