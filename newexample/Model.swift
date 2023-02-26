import Foundation

// MARK: - Coin
struct Coin: Codable {
    let markets: [Market]
    let next: String
}

// MARK: - Market
struct Market: Codable {
    let quote: [String: Quote]
    let exchangeID: ExchangeID
    let symbol, baseAsset: String
    let quoteAsset: QuoteAsset
    let priceUnconverted, price, change24H, spread: Double
    let volume24H: Double
    let status: Status
    let createdAt, updatedAt: String
  

    enum CodingKeys: String, CodingKey {
        case quote
        case exchangeID = "exchange_id"
        case symbol
        case baseAsset = "base_asset"
        case quoteAsset = "quote_asset"
        case priceUnconverted = "price_unconverted"
        case price
        case change24H = "change_24h"
        case spread
        case volume24H = "volume_24h"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

enum ExchangeID: String, Codable {
    case binance = "BINANCE"
    case bitfinex = "BITFINEX"
    case coinbase = "COINBASE"
    case huobiglobal = "HUOBIGLOBAL"
    case kraken = "KRAKEN"
    case poloniex = "POLONIEX"
}

// MARK: - Quote
struct Quote: Codable {
    let price, volume24H: Double

    enum CodingKeys: String, CodingKey {
        case price
        case volume24H = "volume_24h"
    }
}

enum QuoteAsset: String, Codable {
    case btc = "BTC"
    case busd = "BUSD"
    case eur = "EUR"
    case quoteAssetTRY = "TRY"
    case usd = "USD"
    case usdd = "USDD"
    case usdt = "USDT"
}

enum Status: String, Codable {
    case recent = "recent"
}

