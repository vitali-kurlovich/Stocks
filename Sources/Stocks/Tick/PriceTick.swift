//
//  PriceTick.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 16.12.24.
//

import TimeSeries

public
struct PriceTick<Time: BaseValue, PriceValue: BaseValue>: Hashable, Sendable {
    public typealias Price = AskBidPrice<PriceValue>

    public let time: Time
    public let price: Price

    public
    init(time: Time, price: Price) {
        self.time = time
        self.price = price
    }
}

extension PriceTick: TimeValueProtocol, PriceTickProtocol {}

public
extension PriceTick {
    func setTime(_ time: Time) -> Self {
        .init(time: time, price: price)
    }

    func setPrice(_ price: Price) -> Self {
        .init(time: time, price: price)
    }
}

public
extension PriceTick {
    func combine<T: VolumeTickProtocol>(_ tick: T) -> Tick<Time, PriceValue, T.VolumeValue> {
        return .init(time: time, price: price, volume: tick.volume)
    }

    func combine<T: TimeValueProtocol & VolumeTickProtocol>(_ tick: T) -> Tick<Time, PriceValue, T.VolumeValue> where Self.Time == T.Time {
        assert(tick.time == time)
        return .init(time: time, price: price, volume: tick.volume)
    }
}
