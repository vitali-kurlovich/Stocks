//
//  PriceCandle.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 17.12.24.
//

public
struct PriceCandle<Time: BaseValue, PriceValue: BaseValue>: Hashable, Sendable {
    public typealias Price = CandlePrice<PriceValue>

    public let time: Time
    public let price: Price

    public
    init(time: Time, price: Price) {
        self.time = time
        self.price = price
    }
}

extension PriceCandle {
    func setTime(_ time: Time) -> Self {
        .init(time: time, price: price)
    }
}
