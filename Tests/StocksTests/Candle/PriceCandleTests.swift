//
//  PriceCandleTests.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 19.12.24.
//

import Stocks
import Testing

struct PriceCandleTests {
    @Test("Update time")
    func setTime() {
        let candle = PriceCandle(time: 12, price: .init(open: 10, close: 20, low: 5, high: 25))
        #expect(candle.time == 12)
        #expect(type(of: candle.time) == Int.self)

        let new = candle.setTime(20.0)
        #expect(type(of: new.time) == Double.self)
        #expect(new == PriceCandle(time: 20.0, price: .init(open: 10, close: 20, low: 5, high: 25)))
    }

    @Test("Set candle price")
    func setPrice() {
        let tick = PriceCandle(time: 12, price: .init(open: 10, close: 20, low: 5, high: 25))

        let price = CandlePrice(open: 10.0, close: 20.0, low: 5.0, high: 25.0)
        let new = tick.setPrice(price)

        #expect(new == PriceCandle(time: 12, price: .init(open: 10.0, close: 20.0, low: 5.0, high: 25.0)))
    }
}
