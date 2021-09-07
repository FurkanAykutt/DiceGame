//
//  ViewController.swift
//  DiceApp
//
//  Created by Furkan Aykut on 7.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var rivalLabel: UILabel!
    @IBOutlet weak var youLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var imageArray : [UIImage] = []
    let imageNumber : [Int] = [1,2,3,4,5,6]
    var rivalScore : Int = 0
    var myScore : Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray.append(UIImage(named: "dice1")!)
        imageArray.append(UIImage(named: "dice2")!)
        imageArray.append(UIImage(named: "dice3")!)
        imageArray.append(UIImage(named: "dice4")!)
        imageArray.append(UIImage(named: "dice5")!)
        imageArray.append(UIImage(named: "dice6")!)
        
        imageView1.image = imageArray[0]
        imageView2.image = imageArray[0]
        imageView3.image = imageArray[0]
        imageView4.image = imageArray[0]
        
        scoreLabel.text = ""
        
    }

    @IBAction func rollButtonClicked(_ sender: Any) {
        let random = arc4random_uniform(UInt32(imageArray.count-1))
        let random2 = arc4random_uniform(UInt32(imageArray.count-1))
        let random3 = arc4random_uniform(UInt32(imageArray.count-1))
        let random4 = arc4random_uniform(UInt32(imageArray.count-1))

        imageView1.image = imageArray[Int(random)]
        imageView2.image = imageArray[Int(random2)]
        myScore = imageNumber[Int(random)] + imageNumber[Int(random2)]
        
        imageView3.image = imageArray[Int(random3)]
        imageView4.image = imageArray[Int(random4)]
        rivalScore = imageNumber[Int(random3)] + imageNumber[Int(random4)]
        
        if rivalScore < myScore {
            scoreLabel.text = "Rival Score : \(rivalScore), Your Score : \(myScore), You Win!!"
        }
        else if rivalScore > myScore {
            scoreLabel.text = "Rival Score : \(rivalScore), Your Score : \(myScore), Rival Win!!"
        }
        else{
            scoreLabel.text = "Rival Score : \(rivalScore), Your Score : \(myScore), Draw!!"
        }
        
    }
    
}

