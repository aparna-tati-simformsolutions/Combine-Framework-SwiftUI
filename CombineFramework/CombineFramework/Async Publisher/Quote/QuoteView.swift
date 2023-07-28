//
//  QuoteView.swift
//  CombineFramework
//
//  Created by Aparna Tati on 28/07/23.
//

import SwiftUI

struct QuoteView: View {
    @StateObject private var quotePublisher = QuotePublisher()

    var body: some View {
        VStack {
            Text(quotePublisher.quote.content)
                .font(.headline)
            
            Text("- \(quotePublisher.quote.author)")
                .font(.subheadline)
                .italic()
            
            Button("Fetch Another Quote") {
                quotePublisher.fetchQuote()
            }
            .padding()
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
