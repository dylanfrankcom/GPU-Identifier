//
//  GraphicsSubscriber.swift
//  GPU Identifier
//
//  Created by Dylan Frankcom on 2020-07-03.
//  Copyright © 2020 Dylan Frankcom. All rights reserved.
//

import Foundation
import Combine
import Cocoa

// To be implemented

final class GraphicsSubscriber: AppDelegate, Subscriber {
    typealias Input = String
    typealias Failure = Never

    func receive(subscription: Subscription) {
        subscription.request(.max(3))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received value", input)
        return .unlimited
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Received completion", completion)
    }
}
