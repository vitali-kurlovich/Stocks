//
//  TimeSeriesAdapter.swift
//  Stocks
//
//  Created by Vitali Kurlovich on 19.12.24.
//

import TimeSeries

public protocol TimeSeriesConverter {
    associatedtype Input
    associatedtype Output

    func convert(date: FixedDate, input: Input) -> Output
}

public struct TimeSeriesAdapter<Converter: TimeSeriesConverter & Sendable, Series: TimeSeriesCollection & Sendable>: Sendable
    where
    Converter.Input == Series.Element,
    Series: Sendable,
    Series.SubSequence: Sendable
{
    public let converter: Converter
    public let series: Series

    public init(converter: Converter, series: Series) {
        self.converter = converter
        self.series = series
    }
}

extension TimeSeriesAdapter: RandomAccessCollection {
    public typealias Element = Converter.Output
    public typealias Index = Series.Index
    public typealias Indices = Series.Indices
    public typealias SubSequence = TimeSeriesAdapter<Converter, Series.SubSequence>

    public var indices: Indices {
        series.indices
    }

    public var startIndex: Index {
        series.startIndex
    }

    public var endIndex: Index {
        series.endIndex
    }

    public func index(before i: Index) -> Index {
        series.index(before: i)
    }

    public func index(after i: Index) -> Index {
        series.index(after: i)
    }

    public subscript(position: Index) -> Element {
        let item = series[position]
        let date = series.dateTime(at: position)
        return converter.convert(date: date, input: item)
    }

    public subscript(_ range: Range<Self.Index>) -> Self.SubSequence {
        let series = series[range]
        return SubSequence(converter: converter, series: series)
    }

    public subscript(_ range: FixedDateInterval) -> Self.SubSequence {
        let series = series[range]
        return SubSequence(converter: converter, series: series)
    }
}
