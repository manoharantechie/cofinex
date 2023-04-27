class QueryMutation {
  String getTickeDetails() {
    return """ 
     query GetAllTickerInfoV2 {
         getAllTickerInfoV2(system: "global") {
              nextToken
              items {
                  high24hr
                  low24hr
                  marketPrice
                  pair
                  priceChangePercent24hr
                  quickTradePrice
                  topBuy
                 topSell
                 volumeQt24hr
                 volumeTotal24hr
                 volumeTraded24hr
                 system
              }
        }
     }

    """;
  }
}
