import Combine
import Foundation

// MARK: - Subscriber example 1
print("\nSubscriberExampleOne")
class SubscriberExampleOne: Subscriber {
    typealias Input = Int
    
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        print("Subscription: \(subscription)")
        subscription.request(.unlimited)
    }
    
    func receive(_ input: Int) -> Subscribers.Demand {
        print("Received Value: \(input)")
        return .unlimited
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completed")
    }
}

let publisherOne = [1, 2, 3].publisher

let subscriberOne = SubscriberExampleOne()
publisherOne.subscribe(subscriberOne)

// MARK: - Subscriber example 2
print("\n\nSubscriberExampleTwo")
class SubscriberExampleTwo: Subscriber {
    typealias Input = Int
    
    typealias Failure = Never
    
    private var remainingDemand = Subscribers.Demand.none
    
    func receive(subscription: Subscription) {
        print("Subscription: \(subscription)")
        remainingDemand = .max(2)
        subscription.request(remainingDemand)
    }
    
    func receive(_ input: Int) -> Subscribers.Demand {
        print("Received Value: \(input)")
        remainingDemand -= 1
        print("remaining demand: \(remainingDemand)")
        return remainingDemand > 0 ? .max(1) : .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completed")
    }
}

let publisherTwo = [1, 2, 3, 4, 5].publisher

let subscriberTwo = SubscriberExampleTwo()
publisherTwo.subscribe(subscriberTwo)
