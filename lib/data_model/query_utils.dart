class QueryMutation {
  String getTickeDetails() {
    return """ 
     query GetAllTickerInfoV2 {
         getAllTickerInfoV2(system: "global",limit: 100) {
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

  String getOrderBook(String pair) {
    return """ 
     query GetOrderBookV2 {
         getOrderBookV2(system: "global", pair: "$pair") {
            nextToken
            items {
                pair
                system
                  asks {
                    amount
                    price
                  }
                  bids {
                     amount
                      price
                  }
            }
         }
     }

    """;
  }

  String getTradeHistory(String pair) {
    return """ 
query GetTradeItemsV2 {
    getTradeItemsV2(pair: "$pair", system: "global") {
        items {
            qty
            price
            time
            pair
            side
            trans_id
            system
        }
    }
}


    """;
  }
}
