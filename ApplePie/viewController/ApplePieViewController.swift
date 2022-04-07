//
//  ApplePieViewController.swift
//  ApplePie
//
//  Created by Ashin Wang on 2022/4/5.
//

import UIKit

class ApplePieViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var guessWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterBtns: [UIButton]!
    
    var gameTheme: GameTheme!
    var currentState:GameState!
    
    
    let incorrectAllowed = 7
    
    var totalWins = 0{
        didSet{
            newRound()
        }
    }
    
    var totalLosses = 0{
        didSet{
            newRound()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        stackView.setCustomSpacing(30, after: guessWordLabel)
        for i in 0...letterBtns.count - 1{
            letterBtns[i].layer.cornerRadius = 6
        }
        
        
        gifImageView.image  = UIImage.animatedImageNamed(gameTheme.gifPic,duration: 3.5)
        gifImageView.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    
    
    
    func newRound(){
        if !gameTheme.letter.isEmpty{
            let newWord = gameTheme.letter.removeFirst()
            currentState = GameState(word: newWord, incorrectWord: incorrectAllowed, guessLatter: [])
            enableLetterBtns(true)
            updateUI()
        }else{
            enableLetterBtns(false)
        }
    }
    
    func enableLetterBtns(_ enable:Bool){
        for button in letterBtns {
            button.isEnabled = enable
        }
    }
    
    func updateUI(){
        var letters = [String]()
        for letter in currentState.formatterWord{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        guessWordLabel.text = wordWithSpacing
        
        scoreLabel.text = "Wins：\(totalWins)    Losses：\(totalLosses)"
        treeImageView.image = UIImage(named: "tree\(currentState.incorrectWord)")
    }
    
    func gameResult(){
        if currentState.incorrectWord == 0{
            totalLosses += 1
            for i in 0...letterBtns.count - 1{
                letterBtns[i].backgroundColor = UIColor(red: 82/255, green: 116/255, blue: 91/255, alpha: 1)
            }
        }else if currentState.word == currentState.formatterWord{
            totalWins += 1
            for i in 0...letterBtns.count - 1{
                letterBtns[i].backgroundColor = UIColor(red: 82/255, green: 116/255, blue: 91/255, alpha: 1)
            }
        }else{
            updateUI()
        }
    }
    
    @IBAction func letterButtons(_ sender: UIButton) {
        sender.isEnabled = false
        sender.backgroundColor = UIColor.systemGray
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        
        currentState.guessedWord(letter: letter)
        gameResult()
    }
}
