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
    }

    @Test("Set ticks volume")
    func setTickVolume() {
        let time = TimePoint(time: 12)

        let volume = AskBidVolume(ask: 10, bid: 12)
        let new = time.setVolume(volume)

        #expect(new == VolumeTick(time: 12, volume: .init(ask: 10, bid: 12)))
    }
    
    @Test("Set ticks price & volume")
    func setTickPriceVolume() {
        let time = TimePoint(time: 12)

        let price = AskBidPrice(ask: 100, bid: 120)
        let volume = AskBidVolume(ask: 10, bid: 12)
        let new = time.setPrice(price, volume: volume)

        #expect(new == Tick(time: 12, price: .init(ask: 100, bid: 120), volume: .init(ask: 10, bid: 12)))
    }

}
