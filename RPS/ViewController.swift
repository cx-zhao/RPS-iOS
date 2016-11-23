//
//  ViewController.swift
//  RPS
//
//  Created by Chenchen Zhao on 11/22/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateStatus(.start)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        updateStatus(.start)
    }

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    
    func updateStatus(_ gameState: GameState) {
        view.backgroundColor = UIColor(red: 0.2, green: 0.3, blue: 0.5, alpha: 0.4)
        appSign.text = "⛄️"
        switch gameState {
            case .win:
                status.text = "Congrats! You win!"
            case .lose:
                status.text = "Sorry! You lose."
            case .tie:
                status.text = "Wow, there is a tie."
            default:
                status.text = "Rock, Paper, Scissors?"
        }
        playAgain.isHidden = true
        rock.isHidden = false
        paper.isHidden = false
        scissors.isHidden = false
        rock.isEnabled = true
        paper.isEnabled = true
        scissors.isEnabled = true

    }
    
    func play (_ sign: Sign) {
        let appTurn = randomSign()
        updateStatus(sign.beats(appTurn))
        rock.isEnabled = false
        paper.isEnabled = false
        scissors.isEnabled = false
        switch appTurn {
            case .rock:
                appSign.text = "👊"
            case .paper:
                appSign.text = "🖐"
            case .scissors:
                appSign.text = "✌️"
        }
        switch sign {
            case .rock:
                paper.isHidden = true
                scissors.isHidden = true
            case .paper:
                rock.isHidden = true
                scissors.isHidden = true
            case .scissors:
                rock.isHidden = true
                paper.isHidden = true
        }
        playAgain.isHidden = false
    }
    
    @IBAction func rock(_ sender: AnyObject) {
        play(.rock)
    }
    @IBAction func paper(_ sender: AnyObject) {
        play(.paper)
    }
    @IBAction func scissors(_ sender: AnyObject) {
        play(.scissors)
    }
    @IBAction func playAgain(_ sender: AnyObject) {
        updateStatus(.start)
    }
}

