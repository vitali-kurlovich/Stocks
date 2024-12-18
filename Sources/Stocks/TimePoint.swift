//
//  TimePoint.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 16.12.24.
//

public protocol TimeValueProtocol {
    associatedtype Time: BaseValue

    var time: Time { get }
}

public struct TimePoint<Time: BaseValue>: TimeValueProtocol, Hashable, Sendable {
    public let time: Time

    public init(time: Time) {
        self.time = time
    }
}

public extension TimePoint {
    func setTime<TimeValue: BaseValue>(_ time: TimeValue) -> TimePoint<TimeValue> {
        .init(time: time)
    }
}

public extension TimePoint {
    func setPrice<PriceValue: BaseValue>(_ price: AskBidPrice<PriceValue>) -> PriceTick<Time, PriceValue> {
        .init(time: time, price: price)
    }

    func setVolume<VolumeValue: BaseValue>(_ volume: AskBidVolume<VolumeValue>) -> VolumeTick<Time, VolumeValue> {
        .init(time: time, volume: volume)
    }

    func setPrice<PriceValue: BaseValue, VolumeValue: BaseValue>(_ price: AskBidPrice<PriceValue>,
                                                                 volume: AskBidVolume<VolumeValue>) -> Tick<Time, PriceValue, VolumeValue>
    {
        .init(time: time, price: price, volume: volume)
    }
}

public extension TimePoint {
    func setPrice<PriceValue: BaseValue>(_ price: CandlePrice<PriceValue>) -> PriceCandle<Time, PriceValue> {
        .init(time: time, price: price)
    }

    func setVolume<VolumeValue: BaseValue>(_ volume: VolumeValue) -> VolumeCandle<Time, VolumeValue> {
        .init(time: time, volume: volume)
    }

    func setPrice<PriceValue: BaseValue, VolumeValue: BaseValue>(_ price: CandlePrice<PriceValue>,
                                                                 volume: VolumeValue) -> Candle<Time, PriceValue, VolumeValue>
    {
        .init(time: time, price: price, volume: volume)
    }
}
