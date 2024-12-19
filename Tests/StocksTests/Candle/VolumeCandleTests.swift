//
//  VolumeCandleTests.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 19.12.24.
//

import Stocks
import Testing

struct VolumeCandleTests {
    @Test("Update time")
    func setTime() {
        let candle = VolumeCandle(time: 12, volume: 5)
        #expect(candle.time == 12)
        #expect(type(of: candle.time) == Int.self)

        let new = candle.setTime(20.0)
        #expect(type(of: new.time) == Double.self)
        #expect(new == VolumeCandle(time: 20.0, volume: 5))
    }

    @Test("Set candle price")
    func setPrice() {
        let candle = VolumeCandle(time: 12, volume: 5)

        let price = CandlePrice(open: 10, close: 12, low: 5, high: 15)
        let new = candle.setPrice(price)

        #expect(new == Candle(time: 12, price: .init(open: 10, close: 12, low: 5, high: 15), volume: 5))
    }

    @Test("Set candle volume")
    func setVolume() {
        let candle = VolumeCandle(time: 12, volume: 5)

        let new = candle.setVolume(10.0)

        #expect(new == VolumeCandle(time: 12, volume: 10.0))
    }

    @Test("Set candle price & volume")
    func setPriceVolume() {
        let candle = VolumeCandle(time: 12, volume: 5)

        let price = CandlePrice(open: 10, close: 12, low: 5, high: 15)

        let new = candle.setPrice(price, volume: 10.0)

        #expect(new == Candle(time: 12, price: .init(open: 10, close: 12, low: 5, high: 15), volume: 10.0))
    }
}
