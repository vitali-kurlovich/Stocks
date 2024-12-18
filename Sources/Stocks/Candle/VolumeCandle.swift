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

extension VolumeCandle {
    func setTime(_ time: Time) -> Self {
        .init(time: time, volume: volume)
    }

    func setVolume<VolumeValue: BaseValue>(_ volume: VolumeValue) -> VolumeCandle<Time, VolumeValue> {
        .init(time: time, volume: volume)
    }
}
