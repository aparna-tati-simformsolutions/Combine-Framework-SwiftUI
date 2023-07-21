import UIKit

let myPublisher = (1...10).publisher
let secondPublisher = (1...10).publisher
let thirdPublisher = (15...20).publisher

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
        print(result)
    })

// MARK: - filter operator
print("\nFilter Operator")
_ = myPublisher.filter { $0 % 2 == 0 }
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })

// MARK: - first operator
print("\n\nFirst Operator")
_ = myPublisher.first()
    .sink(receiveValue: { result in
        print(result)
    })

// MARK: - firstWhere operator
print("\nFirstWhere Operator")
_ = myPublisher.first(where: { $0 > 5 })
    .sink(receiveValue: { result in
        print(result)
    })

// MARK: - last operator
print("\nLast Operator")
_ = myPublisher.last()
    .sink(receiveValue: { result in
        print(result)
    })

// MARK: - lastWhere operator
print("\nLasWhere Operator")
_ = myPublisher.last(where: { $0 < 9})
    .sink(receiveValue: { result in
        print(result)
    })

// MARK: - map operator
print("\nMap Operator")
_ = myPublisher.map({ $0 * 2 })
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })

// MARK: - max operator
print("\n\nMax Operator")
_ = myPublisher.max()
    .sink(receiveValue: { result in
        print(result)
    })

// MARK: - min operator
print("\nMin Operator")
_ = myPublisher.min()
    .sink(receiveValue: { result in
        print(result)
    })

// MARK: - merge operator
print("\nMerge Operator")
_ = myPublisher.merge(with: secondPublisher)
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })

// MARK: - ignoreOutput operator
print("\n\nIgnoreOutput Operator")
_ = myPublisher.ignoreOutput()
    .sink(receiveValue: { result in
        print(result)
    })

// MARK: - outputat operator
print("\nOutputAt Operator")
_ = myPublisher.output(at: 4)
    .sink(receiveValue: { result in
        print(result)
    })

// MARK: - outputin operator
print("\nOutputIn Operator")
_ = myPublisher.output(in: 1...5)
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })

// MARK: - prefix operator
print("\n\nPrefix Operator")
_ = myPublisher.prefix(5)
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })

// MARK: - prefixWhile operator
print("\n\nPrefixWhile Operator")
_ = myPublisher.prefix(while: { $0 < 5 })
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })

// MARK: - prepend operator
print("\n\nPrepend Operator")
_ = myPublisher.prepend(3, 4)
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })

// MARK: - reduce operator
print("\n\nReduce Operator")
_ = myPublisher.reduce(0, { $0 + $1 })
    .sink(receiveValue: { result in
        print(result)
    })

// MARK: - removeDuplicates operator
print("\nRemove Duplicates Operator")
_ = [1, 2, 3, 4, 4].publisher.removeDuplicates()
    .sink(receiveValue: { result in
        print(result, terminator: " ")
    })

// MARK: - removeDuplicates operator
print("\n\nReplace nil Operator")
_ = [1, 2, nil, 4, 4].publisher.replaceNil(with: "Aparna")
    .sink(receiveValue: { result in
        print(result ?? 0, terminator: " ")
    })

// MARK: - zip operator
print("\n\nZip Operator")
_ = myPublisher.zip(thirdPublisher)
    .sink(receiveValue: { result in
        print(result)
    })
