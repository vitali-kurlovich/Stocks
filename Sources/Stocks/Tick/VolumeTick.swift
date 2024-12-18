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
    func setTime(_ time: Time) -> Self {
        .init(time: time, volume: volume)
    }

    func setVolume(_ volume: Volume) -> Self {
        .init(time: time, volume: volume)
    }

    func setPrice<PriceValue: BaseValue>(_ price: AskBidPrice<PriceValue>) -> Tick<Time, PriceValue, VolumeValue> {
        .init(time: time, price: price, volume: volume)
    }
}

public
extension VolumeTick {
    func combine<T: PriceTickProtocol>(_ tick: T) -> Tick<Time, T.PriceValue, VolumeValue> {
        return .init(time: time, price: tick.price, volume: volume)
    }

    func combine<T: TimeValueProtocol & PriceTickProtocol>(_ tick: T) -> Tick<Time, T.PriceValue, VolumeValue> where Self.Time == T.Time {
        assert(time == tick.time)
        return .init(time: time, price: tick.price, volume: volume)
    }
}
