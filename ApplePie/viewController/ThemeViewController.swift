//
//  ThemeViewController.swift
//  ApplePie
//
//  Created by Ashin Wang on 2022/4/6.
//

import UIKit

class ThemeViewController: UIViewController {

    
    let showPic = [
        
        GameTheme(letter: ["apple","pineapple","papaya","grape","strawber"].shuffled(), bgPic: "bg-1", gifPic: "81cc25003da84794fd53ed41a1f1a81fggbh2hqqbClrx4hY-"),
        GameTheme(letter: ["seagull","reindeer","woodpecker","flamingo","clouded leopard","grizzly bear"].shuffled(), bgPic: "bg-1", gifPic: "428fd71c805c458c8434bbf3dc67b8abneMwqDqVg02Vml5p-"),
        GameTheme(letter: ["Exxon Mobil","General Motors","Mitsubishi","Citigroup","Hyundai","Tesco","Volkswagen"].shuffled(), bgPic: "bg-1", gifPic: "choose-your-charater-player-select-")
    ]
    @IBOutlet weak var fruitBtn: UIButton!
    @IBOutlet weak var animalBtn: UIButton!
    @IBOutlet weak var companyBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func gameTheme(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> ApplePieViewController? {
        let controller = ApplePieViewController(coder: coder)
        
        if segueIdentifier == "fruitBtn"{
            controller?.gameTheme = showPic[0]
        }else if segueIdentifier == "animalBtn"{
            controller?.gameTheme = showPic[1]
        }else if segueIdentifier == "companyBtn"{
            controller?.gameTheme = showPic[2]
        }
        return controller
    }
    
    @IBAction func unwindToHome (_ sender: UIStoryboardSegue){}
}
