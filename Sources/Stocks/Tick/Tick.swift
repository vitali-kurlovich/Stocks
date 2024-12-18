//
//  Tick.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 16.12.24.
//

public protocol PriceTickProtocol {
    associatedtype PriceValue: BaseValue
    var price: AskBidPrice<PriceValue> { get }
}

public protocol VolumeTickProtocol {
    associatedtype VolumeValue: BaseValue
    var volume: AskBidVolume<VolumeValue> { get }
}

public
struct Tick<Time: BaseValue, PriceValue: BaseValue, VolumeValue: BaseValue>: Hashable, Sendable {
    public typealias Price = AskBidPrice<PriceValue>
    public typealias Volume = AskBidVolume<VolumeValue>

    public let time: Time
    public let price: Price
    public let volume: Volume

    public
    init(time: Time, price: Price, volume: Volume) {
        self.time = time
        self.price = price
        self.volume = volume
    }
}

extension Tick: TimeValueProtocol, PriceTickProtocol, VolumeTickProtocol {}

public extension Tick {
    func setTime(_ time: Time) -> Self {
        .init(time: time, price: price, volume: volume)
    }

    func setPrice(_ price: Price) -> Self {
        .init(time: time, price: price, volume: volume)
    }
}
