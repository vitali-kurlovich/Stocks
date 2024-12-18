//
//  CandlePrice.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 17.12.24.
//

public
struct CandlePrice<Value: BaseValue>: Hashable, Sendable {
    public let open: Value
    public let close: Value
    public let low: Value
    public let high: Value

    public
    init(open: Value, close: Value, low: Value, high: Value) {
        assert(open >= low)
        assert(open <= high)

        assert(close >= low)
        assert(close <= high)

        self.open = open
        self.close = close
        self.low = low
        self.high = high
    }
}
