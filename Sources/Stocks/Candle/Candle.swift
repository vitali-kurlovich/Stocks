//
//  Candle.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 17.12.24.
//

public
struct Candle<Time: BaseValue, PriceValue: BaseValue, Volume: BaseValue>: Hashable, Sendable {
    public typealias Price = CandlePrice<PriceValue>

    public let time: Time
    public let price: Price
    public let volume: Volume

    public init(time: Time, price: Price, volume: Volume) {
        self.time = time
        self.price = price
        self.volume = volume
    }
}

public
extension Candle {
    func setTime<TimeValue>(_ time: TimeValue) -> Candle<TimeValue, PriceValue, Volume> {
        .init(time: time, price: price, volume: volume)
    }

    func setPrice<CandlePriceValue: BaseValue>(_ price: CandlePrice<CandlePriceValue>) -> Candle<Time, CandlePriceValue, Volume> {
        .init(time: time, price: price, volume: volume)
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
