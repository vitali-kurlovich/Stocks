//
//  TickTests.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 19.12.24.
//

import Stocks
import Testing

struct TickTests {
    @Test("Update time")
    func setTime() {
        let tick = Tick(time: 12, price: .init(ask: 12, bid: 20), volume: .init(ask: 120, bid: 200))
        #expect(tick.time == 12)
        #expect(type(of: tick.time) == Int.self)

        let new = tick.setTime(20.0)
        #expect(type(of: new.time) == Double.self)
        #expect(new == Tick(time: 20.0, price: .init(ask: 12, bid: 20), volume: .init(ask: 120, bid: 200)))
    }

    @Test("Set ticks price")
    func setPrice() {
        let tick = Tick(time: 12, price: .init(ask: 12, bid: 20), volume: .init(ask: 120, bid: 200))

        let price = AskBidPrice(ask: 10.0, bid: 12.0)
        let new = tick.setPrice(price)

        #expect(new == Tick(time: 12, price: .init(ask: 10.0, bid: 12.0), volume: .init(ask: 120, bid: 200)))
    }

    @Test("Set ticks volume")
    func setVolume() {
        let tick = Tick(time: 12, price: .init(ask: 12, bid: 20), volume: .init(ask: 120, bid: 200))

        let volume = AskBidVolume(ask: 10.0, bid: 12.0)
        let new = tick.setVolume(volume)

        #expect(new == Tick(time: 12, price: .init(ask: 12, bid: 20), volume: .init(ask: 10.0, bid: 12.0)))
    }

    @Test("Set ticks price & volume")
    func setPriceVolume() {
        let tick = Tick(time: 12, price: .init(ask: 12, bid: 20), volume: .init(ask: 120, bid: 200))

        let price = AskBidPrice(ask: 100.0, bid: 120.0)
        let volume = AskBidVolume(ask: 10.0, bid: 12.0)
        let new = tick.setPrice(price, volume: volume)

        #expect(new == Tick(time: 12, price: .init(ask: 100.0, bid: 120.0), volume: .init(ask: 10.0, bid: 12.0)))
    }
}
