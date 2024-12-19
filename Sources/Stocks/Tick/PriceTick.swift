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

    func setPrice<PriceValueType: BaseValue>(_ price: AskBidPrice<PriceValueType>) -> PriceTick<Time, PriceValueType> {
        .init(time: time, price: price)
    }

    func setVolume<VolumeValue: BaseValue>(_ volume: AskBidVolume<VolumeValue>) -> Tick<Time, PriceValue, VolumeValue> {
        .init(time: time, price: price, volume: volume)
    }

    func setPrice<PriceValueType: BaseValue, VolumeValue: BaseValue>(_ price: AskBidPrice<PriceValueType>,
                                                                     volume: AskBidVolume<VolumeValue>) -> Tick<Time, PriceValueType, VolumeValue>
    {
        .init(time: time, price: price, volume: volume)
    }
}
