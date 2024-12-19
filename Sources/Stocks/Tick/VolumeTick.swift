//
//  VolumeTick.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 16.12.24.
//

public
struct VolumeTick<Time: BaseValue, VolumeValue: BaseValue>: Hashable, Sendable {
    public typealias Volume = AskBidVolume<VolumeValue>

    public let time: Time
    public let volume: Volume

    public
    init(time: Time, volume: Volume) {
        self.time = time
        self.volume = volume
    }
}

extension VolumeTick: TimeValueProtocol, VolumeTickProtocol {}

public
extension VolumeTick {
    func setTime<TimeValue: BaseValue>(_ time: TimeValue) -> VolumeTick<TimeValue, VolumeValue> {
        .init(time: time, volume: volume)
    }

    func setVolume<VolumeValueType: BaseValue>(_ volume: AskBidVolume<VolumeValueType>) -> VolumeTick<Time, VolumeValueType> {
        .init(time: time, volume: volume)
    }

    func setPrice<PriceValue: BaseValue>(_ price: AskBidPrice<PriceValue>) -> Tick<Time, PriceValue, VolumeValue> {
        .init(time: time, price: price, volume: volume)
    }

    func setPrice<PriceValueType: BaseValue, VolumeValueType: BaseValue>(_ price: AskBidPrice<PriceValueType>, volume: AskBidVolume<VolumeValueType>) -> Tick<Time, PriceValueType, VolumeValueType> {
        .init(time: time, price: price, volume: volume)
    }
}
