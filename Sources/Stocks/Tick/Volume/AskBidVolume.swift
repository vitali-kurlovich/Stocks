//
//  AskBidVolume.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 16.12.24.
//

public struct AskBidVolume<Value: Comparable & Hashable & Sendable>: Hashable & Sendable {
    public let ask: Value
    public let bid: Value

    public init(ask: Value, bid: Value) {
        self.ask = ask
        self.bid = bid
    }
}
