//
//  TimePointTests.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 18.12.24.
//

import Stocks
import Testing

struct TimePointTests {
    @Test("Update time")
    func setTime() {
        let time = TimePoint(time: 12)
        #expect(time.time == 12)
        #expect(type(of: time.time) == Int.self)

        let newTime = time.setTime(20.0)
        #expect(type(of: newTime.time) == Double.self)
        #expect(newTime == TimePoint(time: 20.0))
    }

    @Test("Set ticks price")
    func setTickPrice() {
        let time = TimePoint(time: 12)

        let price = AskBidPrice(ask: 10, bid: 12)
        let new = time.setPrice(price)

        #expect(new == PriceTick(time: 12, price: .init(ask: 10, bid: 12)))

        let new1 = time.setPrice(.init(ask: 20.0, bid: 30.0))
        #expect(new1 == PriceTick(time: 12, price: .init(ask: 20.0, bid: 30.0)))
    }

    @Test("Set candle price")
    func setCandlePrice() {
        let time = TimePoint(time: 12)

        let price = CandlePrice(open: 4, close: 5, low: 1, high: 10)
        let new = time.setPrice(price)

        #expect(new == PriceCandle(time: 12, price: .init(open: 4, close: 5, low: 1, high: 10)))

        let new1 = time.setPrice(.init(open: 10.0, close: 12.0, low: 5.0, high: 15.0))
        #expect(new1 == PriceCandle(time: 12, price: .init(open: 10.0, close: 12.0, low: 5.0, high: 15.0)))
    }

    @Test("Set ticks volume")
    func setTickVolume() {
        let time = TimePoint(time: 12)

        let volume = AskBidVolume(ask: 10, bid: 12)
        let new = time.setVolume(volume)

        #expect(new == VolumeTick(time: 12, volume: .init(ask: 10, bid: 12)))
    }

    @Test("Set candle volume")
    func setCandleVolume() {
        let time = TimePoint(time: 12)
        let new = time.setVolume(12.0)

        #expect(new == VolumeCandle(time: 12, volume: 12.0))
    }

    @Test("Set ticks price & volume")
    func setTickPriceVolume() {
        let time = TimePoint(time: 12)

        let price = AskBidPrice(ask: 100, bid: 120)
        let volume = AskBidVolume(ask: 10, bid: 12)
        let new = time.setPrice(price, volume: volume)

        #expect(new == Tick(time: 12, price: .init(ask: 100, bid: 120), volume: .init(ask: 10, bid: 12)))
    }

    @Test("Set candle price & volume")
    func setCandlePriceVolume() {
        let time = TimePoint(time: 12)

        let price = CandlePrice(open: 4, close: 5, low: 1, high: 10)

        let new = time.setPrice(price, volume: 12.0)

        #expect(new == Candle(time: 12, price: .init(open: 4, close: 5, low: 1, high: 10), volume: 12.0))
    }
}
