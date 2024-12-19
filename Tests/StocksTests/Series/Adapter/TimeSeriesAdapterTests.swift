//
//  TimeSeriesAdapterTests.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 20.12.24.
//

import Stocks
import Testing
import TimeSeries

typealias TestTick = Tick<Int32, Int, Int>

extension TestTick: IntegerTimeBased {}

struct Converter: TimeSeriesConverter {
    typealias Input = TestTick
    typealias Output = String

    func convert(date: FixedDate, input: Input) -> String {
        let milliseconds = date.millisecondsFrom1970
        let price = input.price
        let volume = input.volume
        return "\(milliseconds) [\(price.ask), \(price.bid)] {\(volume.ask), \(volume.bid)}"
    }
}

struct TimeSeriesAdapterTests {
    @Test
    func adapter() {
        let ticks: [TestTick] = [
            .init(time: 20, price: .init(ask: 4, bid: 5), volume: .init(ask: 10, bid: 12)),
            .init(time: 25, price: .init(ask: 14, bid: 15), volume: .init(ask: 100, bid: 120)),
            .init(time: 30, price: .init(ask: 10, bid: 2), volume: .init(ask: 1, bid: 12)),
            .init(time: 40, price: .init(ask: 10, bid: 2), volume: .init(ask: 1, bid: 12)),
            .init(time: 50, price: .init(ask: 1, bid: 20), volume: .init(ask: 10, bid: 1)),
        ]

        let series = TimeSeries(timeBase: FixedDate(200), items: ticks)
        let converter = Converter()

        let adapter = TimeSeriesAdapter(converter: converter, series: series)

        #expect(adapter.indices == 0 ..< 5)
        #expect(adapter.index(before: 1) == 0)

        let result = Array(adapter)

        let expected = [
            "220 [4, 5] {10, 12}",
            "225 [14, 15] {100, 120}",
            "230 [10, 2] {1, 12}",
            "240 [10, 2] {1, 12}",
            "250 [1, 20] {10, 1}",
        ]

        #expect(result == expected)

        let resultSubrange = Array(adapter[1 ... 3])

        let expectedSubrange = [
            "225 [14, 15] {100, 120}",
            "230 [10, 2] {1, 12}",
            "240 [10, 2] {1, 12}",
        ]

        #expect(resultSubrange == expectedSubrange)
    }
}
