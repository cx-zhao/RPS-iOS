//
//  Sign.swift
//  RPS
//
//  Created by Chenchen Zhao on 11/22/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    }
    else if sign == 1 {
        return .paper
    }
    else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    var rank: Int {
        switch self {
        case .rock: return 0
        case .paper: return 1
        case .scissors: return 2
        }
    }
    
    func beats(_ opponentSign: Sign) -> GameState {
        if (self.rank == (opponentSign.rank + 1) % 3) {
            return .win
        }
        else if ((self.rank + 1) % 3 == opponentSign.rank) {
            return .lose
        }
        else {
            return .tie
        }
    }
    
}
