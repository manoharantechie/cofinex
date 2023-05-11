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

  String getWalletBalance() {
    return """ 
     query GetAllWalletBalances {
    getAllWalletBalances {
        nextToken
        items {
            balance
            created_by
            date_created
            date_updated
            token
            type
            updated_by
        }
    }
}

    """;
  }

  String withdrawRequest(String from,String to,String amount,String token ) {
    return """ 
mutation TransferWalletBalance {
    transferWalletBalance(token: "$token", amount: "$amount", toType: "$to", fromType: "$from") {
        status
    }
}

    """;
  }

}
