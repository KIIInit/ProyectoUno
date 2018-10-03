//
//  ViewController.swift
//  ProyectoModuloUno
//
//  Created by edgar barragan on 12/08/18.
//  Copyright © 2018 edgar barragan. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    let randomChoice = GKRandomDistribution(lowestValue: 1, highestValue: 3)
    
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var piedraButton: UIButton!
    @IBOutlet weak var papelButton: UIButton!
    @IBOutlet weak var tijeraButton: UIButton!
    
    enum enuGameState{
        case win,lose,tie
        
        var rank: Int {
            switch self {
            case .win: return 3
            case .lose: return 2
            case .tie: return 1
            }
        }
    }
    
    enum buttonOption {
        case piedra,papel, tijera
        
        var rank: Int {
            switch self {
            case .piedra: return 3
            case .papel: return 2
            case .tijera: return 1
            //case .clubs: return 1
            }
        }
        
        func beats (_ otherOption: buttonOption) -> enuGameState {
            //return self.rank > otherOption
            if(self.rank == 3){
                switch otherOption {
                case .piedra: return .tie
                case .papel: return .lose
                case .tijera: return .win
                    //case .clubs: return 1
                }
            }else if(self.rank == 2){
                switch otherOption {
                case .piedra: return .win
                case .papel: return .tie
                case .tijera: return .lose
                    //case .clubs: return 1
                }
            }else{
                switch otherOption {
                case .piedra: return .lose
                case .papel: return .win
                case .tijera: return .tie
                    //case .clubs: return 1
                }
            }

        }
    }
    
    
    @IBAction func accionPiedraButton(_ sender: UIButton) {
        var beat : enuGameState
        beat = buttonOption.piedra.beats(randomSing())
        //answerMatch(beat)
        gameState(beat)
    }
    
    @IBAction func accionPapelButton(_ sender: UIButton) {
        var beat : enuGameState
        beat = buttonOption.papel.beats(randomSing())
        gameState(beat)
    }
    
    @IBAction func accionTijeraButton(_ sender: UIButton) {
        var beat : enuGameState
        beat = buttonOption.tijera.beats(randomSing())
        gameState(beat)
    }
    
    func answerMatch(_ beat: enuGameState){
        var result : String
        if beat.rank == 3 {
            result = "You Win!! 😎"
            
        }else if beat.rank == 2{
            result = "You Lose 😢"
        }else {
            result = "It`s a Tie!! 😐"
        }
        displayAnswerTextOnScreen(result)
        //return result
    }
    
    func displayAnswerTextOnScreen(_ answer: String) {
        responseLabel.text = answer
    }
    
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        responseLabel.text = "Again, Again!!"
    }
    
    
    func gameState(_ state: enuGameState){
        answerMatch(state)
        if state.rank == 3 {
            view.backgroundColor = UIColor.blue
        }else if state.rank == 2{
            view.backgroundColor = UIColor.purple
        }else{
            view.backgroundColor = UIColor.brown
        }
    }
    
    func randomSing() -> buttonOption{
        let sing = randomChoice.nextInt()
        if sing == 3 {
            return .piedra
        }else if sing == 2 {
            return .papel
        }else {
            return .tijera
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

