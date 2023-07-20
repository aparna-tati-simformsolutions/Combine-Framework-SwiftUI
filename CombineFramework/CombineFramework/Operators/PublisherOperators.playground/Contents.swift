import UIKit

let myPublisher = (1...10).publisher

// MARK: - allSatisfy operator
print("All Satisfy Operator")
_ = myPublisher.allSatisfy { $0 > 0 }
    .sink(receiveValue: { result in
        print(result)
    })

// MARK: - append operator
print("\nAppend Operator")
_ = myPublisher.append([1, 2, 3])
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })

// MARK: - scan operator
print("\n\nScan Operator")
_ = myPublisher.scan(0, { $0 + $1 })
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })

// MARK: - collect operator
print("\n\nCollect Operator")
_ = myPublisher.collect(4)
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })

// MARK: - count operator
print("\n\nCount Operator")
_ = myPublisher.count()
    .sink(receiveValue: { result in
        print(result)
    })

// MARK: - compactMap operator
print("\nCompact Map Operator")
_ = [1, 2, 3, nil, 4].publisher.compactMap { $0 }
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })

// MARK: - contains operator
print("\n\nContains Operator")
_ = myPublisher.contains(where: { $0 == 8 })
    .sink(receiveValue: { result in
        print(result)
    })

// MARK: - dropFirst operator
print("\nDropFirst Operator")
_ = myPublisher.dropFirst(2)
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })

// MARK: - dropWhile operator
print("\n\ndropWhile Operator")
_ = [1, 2, 6, 1].publisher.drop(while: { $0 < 3 })
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })









