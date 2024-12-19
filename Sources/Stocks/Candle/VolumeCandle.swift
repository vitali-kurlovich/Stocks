//
//  VolumeCandle.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 18.12.24.
//

public
struct VolumeCandle<Time: BaseValue, Volume: BaseValue>: Hashable, Sendable {
    public let time: Time
    public let volume: Volume

    public init(time: Time, volume: Volume) {
        self.time = time
        self.volume = volume
    }
}

public
extension VolumeCandle {
    func setTime<TimeValue: BaseValue>(_ time: TimeValue) -> VolumeCandle<TimeValue, Volume> {
        .init(time: time, volume: volume)
    }

    func setVolume<VolumeValue: BaseValue>(_ volume: VolumeValue) -> VolumeCandle<Time, VolumeValue> {
        .init(time: time, volume: volume)
    }

    func setPrice<PriceValue: BaseValue>(_ price: CandlePrice<PriceValue>) -> Candle<Time, PriceValue, Volume> {
        .init(time: time, price: price, volume: volume)
    }

    func setPrice<PriceValueType: BaseValue, VolumeValueType: BaseValue>(_ price: CandlePrice<PriceValueType>,
                                                                         volume: VolumeValueType) -> Candle<Time, PriceValueType, VolumeValueType>
    {
        .init(time: time, price: price, volume: volume)
    }
}
