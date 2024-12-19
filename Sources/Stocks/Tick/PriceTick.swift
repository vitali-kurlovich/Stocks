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
    func setTime<TimeValue: BaseValue>(_ time: TimeValue) -> PriceTick<TimeValue, PriceValue> {
        .init(time: time, price: price)
    }

    func setPrice(_ price: Price) -> Self {
        .init(time: time, price: price)
    }
}
