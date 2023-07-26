import Combine
import Foundation

// MARK: - Cancellable Example
let cancellablePublisher = Timer.publish(every: 1.0, on: .main, in: .default).autoconnect()

let cancellableObject = cancellablePublisher.sink { value in
    print("Receieved Value: \(value)")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
    cancellableObject.cancel()
}

// MARK: - AnyCancellable Example
let anyCancellablePublisher = Timer.publish(every: 1, on: .main, in: .default).autoconnect()

var cancellables = Set<AnyCancellable>()

anyCancellablePublisher.sink { newValue in
    print("Received First Subscriber Value: \(newValue)")
}
.store(in: &cancellables)

anyCancellablePublisher.sink { newValue in
    print("Received Second Subscriber Value: \(newValue)")
}
.store(in: &cancellables)

DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
    cancellables.removeAll()
}
