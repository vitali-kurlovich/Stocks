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

public
extension PriceCandle {
    func setTime<TimeValue: BaseValue>(_ time: TimeValue) -> PriceCandle<TimeValue, PriceValue> {
        .init(time: time, price: price)
    }

    func setPrice<CandlePriceValue: BaseValue>(_ price: CandlePrice<CandlePriceValue>) -> PriceCandle<Time, CandlePriceValue> {
        .init(time: time, price: price)
    }

    func setVolume<VolumeValue: BaseValue>(_ volume: VolumeValue) -> Candle<Time, PriceValue, VolumeValue> {
        .init(time: time, price: price, volume: volume)
    }

    func setPrice<CandlePriceValue: BaseValue, VolumeValue: BaseValue>(_ price: CandlePrice<CandlePriceValue>,
                                                                       volume: VolumeValue) -> Candle<Time, CandlePriceValue, VolumeValue>
    {
        .init(time: time, price: price, volume: volume)
    }
}
