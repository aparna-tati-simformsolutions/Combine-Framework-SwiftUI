//
//  QuotePublisher.swift
//  CombineFramework
//
//  Created by Aparna Tati on 28/07/23.
//

import Foundation
import Combine

class QuotePublisher: ObservableObject {
    @Published var quote = Quote(id: "", author: "Unknown", content: "Unknown", authorSlug: "", dateAdded: "", dateModified: "", length: 0, tags: [])

    init() {
        fetchQuote()
    }

    func fetchQuote() {
        let url = URL(string: "https://api.quotable.io/random")!
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Quote.self, decoder: JSONDecoder())
            .replaceError(with: Quote(id: "", author: "Unknown", content: "Unknown", authorSlug: "", dateAdded: "", dateModified: "", length: 0, tags: []))
            .receive(on: DispatchQueue.main)
            .assign(to: &$quote)
    }
}
